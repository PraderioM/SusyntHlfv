#!/bin/env python

# make plots comparing mcoll for signal in fpt slices
#
# see email from Shikma on 2015-05-17
#
# davide.gerbaudo@gmail.com
# May2015

import datetime
import math
import optparse
import os
import pprint
import time
import dataset
from rootUtils import (drawAtlasLabel
                       ,dummyHisto
                       ,getBinContents
                       ,getMinMax
                       ,graphWithPoissonError
                       ,increaseAxisFont
                       ,topRightLegend
                       ,importRoot
                       ,integralAndError
                       ,setAtlasStyle
                       ,topRightLabel
                       ,writeObjectsToFile
                       ,buildRatioHistogram
                       ,buildBotTopPads
                       ,getXrange
                       ,referenceLine
                       )
r = importRoot()
from utils import (mkdirIfNeeded
                   )
# from kin import addTlv, computeCollinearMassLepTau, computeRazor, computeMt, selection_formulas

def main():
    normalize = True
    f_tauel = r.TFile.Open('out/plot_emu/May_14/blinded/signaltaue_NOM_sr_emu_os.root')
    f_taumu = r.TFile.Open('out/plot_emu/May_14/blinded/signaltaumu_NOM_sr_mue_os.root')
    # inclusive
    h_tauel = f_tauel.Get('h_mcollcoarse_signaltaue_NOM_sr_emu_os')
    h_taumu = f_taumu.Get('h_mcollcoarse_signaltaumu_NOM_sr_mue_os')
    plot_m_emu_mue(h_tauel, h_taumu, 'any_pt')

    # slices
    h2d_tauel = f_tauel.Get('h_mcoll_vs_pt1_signaltaue_NOM_sr_emu_os')
    h2d_taumu = f_taumu.Get('h_mcoll_vs_pt1_signaltaumu_NOM_sr_mue_os')
    for h in [h2d_tauel, h2d_taumu]:
        h.RebinY(2) # 40 bins same as mcollcoarse
    for pt_min, pt_max in [(12.0, 15.0), (15.0, 20.0), (20.0, 25.0), (25.0, 30.0),
                           (35.0, 40.0), (40.0, 300.0)]:
        ltel, h_tauel = slice_histos_pt1(h2d_tauel, pt_min, pt_max)
        ltmu, h_taumu = slice_histos_pt1(h2d_taumu, pt_min, pt_max)
        assert ltel==ltmu
        header = ltmu
        plot_m_emu_mue(h_tauel, h_taumu, header)
        
def plot_m_emu_mue(h_tauel, h_taumu, header='leg header', normalize=True):
    can = r.TCanvas('m_coll_'+header,'')
    can.cd()
    if normalize:
        for h in [h_tauel, h_taumu]:
            if h.Integral():
                h.Scale(1.0/h.Integral())
    padMaster = h_tauel
    padMaster.SetMinimum(0.0)
    padMaster.SetMaximum(1.1*max([h.GetMaximum() for h in [h_tauel, h_taumu]]))
    for h, c in [(h_tauel, r.kRed), (h_taumu, r.kBlue)]:
        h.SetLineColor(c)
        h.SetMarkerColor(c)
    padMaster.Draw('axis')
    leg = topRightLegend(can, 0.25, 0.35)
    leg.SetHeader(header)
    for l, h in [('h#rightarrow#taue, sr_emu', h_tauel),
                 ('h#rightarrow#tau#mu, sr_mue', h_taumu)]:
        h.SetStats(0)
        h.Draw('l same')
        leg.AddEntry(h, l, 'lp')
    leg.Draw()
    can.Update()
    can.SaveAs('m_coll_'+header+'.png')

def slice_histos_pt1(h, pt_min, pt_max):
    xaxis = h.GetXaxis()
    xtitle = xaxis.GetTitle()
    assert 'p_{T,l1}' in xtitle
    bin_min = min([b for b in range(1, 1+xaxis.GetNbins()) if xaxis.GetBinCenter(b)>pt_min])
    bin_max = max([b for b in range(1, 1+xaxis.GetNbins()) if xaxis.GetBinCenter(b)<pt_max])
    pt_m = xaxis.GetBinLowEdge(bin_min)
    pt_M = xaxis.GetBinLowEdge(bin_max) + xaxis.GetBinWidth(bin_max)
    suffix = "pt_%d_%d"%(int(pt_m), int(pt_M))
    h_slice = h.ProjectionY(h.GetName()+'_'+suffix, bin_min, bin_max)
    return suffix, h_slice

def topRightLegend(pad,  legWidth, legHeight, shift=0.0) :
    rMarg, lMarg, tMarg = pad.GetRightMargin(), pad.GetLeftMargin(), pad.GetTopMargin()
    leg = r.TLegend(1.0 - rMarg - legWidth + shift,
                    1.0 - tMarg - legHeight + shift,
                    1.0 - rMarg + shift,
                    1.0 - tMarg + shift)
    leg.SetBorderSize(1)
    leg.SetFillColor(0)
    leg.SetFillStyle(0)
    pad._leg = leg
    return leg

if __name__=='__main__':
    main()
