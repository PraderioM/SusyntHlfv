#!/bin/env python

# Loop over the 'onebin' histograms and make a summary of the stat/syst signal uncertainty
#
# Input: histogram files from plot_emu.py
#
# Example usage:
# > python/print_signal_uncertainty_summary.py out/plot_emu/Aug_01/unblinded/
#
# davide.gerbaudo@gmail.com
# Dec 2015

import glob
import os
import re
import sys
import math

from collections import OrderedDict, defaultdict


from rootUtils import importRoot
r = importRoot()

from utils import commonPrefix, commonSuffix
from print_signal_variation_table import (File,
                                          filter_two_sided_variations,
                                          filter_one_sided_variations
                                          )

def main():
    ""
    input_directory = sys.argv[1]
    all_input_files = [SignalFile(f) for f in glob.glob(input_directory+'/*signal*.root')]
    all_samples = list(set(f.sample for f in all_input_files))
    all_regions = list(set(f.region for f in all_input_files))
    debug = False # True

    linebreak = 60*'-'

    for region in SignalFile.regions_emu() + SignalFile.regions_mue():
        files = [f for f in all_input_files if f.is_component() and f.is_right_decay(region)]
        for f in files:
            f.histoname_prefix = 'h_mcoll_vs_pt1'
            # uncomment ptmin,ptmax below as needed.
            # The actual bin edges are 12-20, 20-30, 30-inf; use the *.9 hack to avoid double counting from TAxis::FindFixBin
            f.ptmin, f.ptmax = None, None
            f.ptmin, f.ptmax = 12.0, 19.9
            # f.ptmin, f.ptmax = 20.0, 29.9
            # f.ptmin, f.ptmax = 30.0, 1000.0

        samples = list(set(f.sample for f in files))
        if debug:
            print linebreak
            print "%s : using %s" % (region, ', '.join(samples))

        nom_files = [f for f in files if f.variation=='NOM']
        nom_samples = [f.sample for f in nom_files]
        nom_yield =  SignalYield.build_merged_yield(nom_files, nom_files)
        yield_nom = nom_yield.get_yield()
        error_nom = math.sqrt(sumquad([f.get_error() for f in nom_files]))
        missing_nom_samples = [s for s in samples if s not in nom_samples]
        if missing_nom_samples:
            print "for '%s' missing nominal sample %s ... skipping"%(region, str(missing_nom_samples))
            continue

        variations = list(set(f.variation for f in files))
        max_column_width = max(len(v) for v in variations)
        cellwidth = '%'+str(max_column_width)+'s'
        two_sided_variations = filter_two_sided_variations(variations)
        one_sided_variations = filter_one_sided_variations(variations, two_sided_variations)
        two_sided_variations_up = [v for v in two_sided_variations if 'UP' in v]
        two_sided_variations_do = [v for v in two_sided_variations if v not in two_sided_variations_up]

        if debug:
            print "Two-sided variations [%]"+'\n'+linebreak
        two_sided_yields = []
        for vup in sorted(two_sided_variations_up):
            vname = vup.replace('_UP', '')
            files_up = [f for f in files if f.variation==vup]
            files_do = [f for f in files if f.variation==vup.replace('UP', 'DOWN')]
            if len(files_up)!=len(files_do):
                print "skipping mismatched variations"
                print "up[%d]: %s" % (len(files_up), ', '.join(f.sample+' '+f.variation for f in files_up))
                print "do[%d]: %s" % (len(files_do), ', '.join(f.sample+' '+f.variation for f in files_do))
                continue
            two_sided_yields.append(SignalYield.build_average_sys_yield(nom_files, files_up, files_do))
            if debug:
                yield_up = sum(f.get_yield() for f in files_up)
                yield_do = sum(f.get_yield() for f in files_do)
                print ' '.join(cellwidth%v for v in [vname,
                                                     "%.2f"%(100.*(yield_up-yield_nom)/yield_nom),
                                                     "%.2f"%(100.*(yield_do-yield_nom)/yield_nom)])
        if debug:
            print "One-sided variations [%]"+'\n'+linebreak
        one_sided_yields = []
        for v in sorted(one_sided_variations):
            files_var = [f for f in files if f.variation==v]
            yield_var = sum(f.get_yield() for f in files_var)
            if debug:
                print ' '.join(cellwidth%v for v in [v, "%.2f"%(100.*(yield_var-yield_nom)/yield_nom)])
            one_sided_yields.append(SignalYield.build_merged_yield(nom_files, files_var))

        theo_syst_yields = build_syst_variations(nom_files)
        theo_syst_variations = [y.variation for y in theo_syst_yields]
        if debug:
            print "Theoretical variations [%]"+'\n'+linebreak
            for v in sorted(theo_syst_variations):
                yield_var = next(y.get_yield() for y in theo_syst_yields if y.variation==v)
                print ' '.join(cellwidth%v for v in [v,
                                                     "%.2f"%(100.*(yield_var-yield_nom)/yield_nom)])

        err_syst = compute_total_syst(nom_yield,
                                      two_sided_yields,
                                      one_sided_yields,
                                      theo_syst_yields)
        err_stat = error_nom
        print "%s : %.2f +/- %.2f +/- %.2f" % (region, yield_nom, err_stat, err_syst)

    if debug:
        print linebreak

def sumquad(ll):
    return sum([l*l for l in ll])

def compute_total_syst(nom_yield,
                       two_sided_yields,
                       one_sided_yields,
                       theo_syst_yields):
    """Add upp in quadrature the sys variations"""
    nom = nom_yield.get_yield()
    return math.sqrt(sumquad([nom - s.get_yield()
                              for s in two_sided_yields + one_sided_yields + theo_syst_yields]))

class SignalFile(File):
    """A File yield with signal features
    """
    @classmethod
    def regions_emu(cls):
        return ['sr_emu_os_jets', 'sr_emu_os']
    @classmethod
    def regions_mue(cls):
        return ['sr_mue_os_jets', 'sr_mue_os']

    def is_component(self):
        """Pick components (signalgghtau*, etc.), discard tot signal samples"""
        s = self.sample
        tot_signals = ['signaltaue', 'signaltaumu']
        return 'signal' in s and s not in tot_signals

    def is_right_decay(self, region=''):
        decay = ('taue' if 'sr_emu' in region else
                 'taumu' if 'sr_mue' in region else None)
        return region==self.region and decay in self.sample

class SignalYield(object):
    """Same as SignalFile/File, but without the file

    To be used for the syst that don't have a histogram or for the merged yields
    """
    def __init__(self, signal_file, variation, yield_value):
        self.sample = signal_file.sample
        self.region = signal_file.region
        self.variation = variation
        self.yield_value = yield_value
    def get_yield(self):
        return self.yield_value
    @classmethod
    def merged_sample_name(cls, names=[]):
        return commonPrefix(names)+commonSuffix(names).replace('__','_')
    @classmethod
    def build_merged_yield(cls, component_nominal_yields=[], component_syst_yields=[]):
        """Given a list of component yields, build a total SignalYield

        If one of the syst components is missing, replace it by its corresponding nominal val
        """
        one_region = len(set(y.region for y in component_nominal_yields+component_syst_yields))==1
        if not one_region:
            raise RuntimeError("mixing multiple regions: %s"%
                               str(set(y.region for y in component_nominal_yields+component_syst_yields)))
        one_variation = len(set(y.variation for y in component_syst_yields))==1
        if not one_variation:
            raise RuntimeError("mixing multiple variations: %s"%
                               str(set(y.variation for y in component_syst_yields)))
        variation = component_syst_yields[0].variation
        all_samples = [y.sample for y in component_nominal_yields]
        cny = {n.sample : n for n in component_nominal_yields}
        csy = {s.sample : s for s in component_syst_yields}
        samples = cny.keys()
        nom_template = next(ny for ny in component_nominal_yields)
        sample_name = SignalYield.merged_sample_name(all_samples)
        tot_yield = SignalYield(nom_template, variation,
                                sum(csy[s].get_yield() if s in csy else
                                    cny[s].get_yield()
                                    for s in samples))
        tot_yield.sample = sample_name
        return tot_yield
    @classmethod
    def check_attribute_with_same_value(cls, attr_name, list_of_yields):
        values = list(set([getattr(o, attr_name) for o in list_of_yields]))
        if len(values)!=1:
            raise RuntimeError("mixed values for '%s': %s"%(attr_name, str(values)))
    @classmethod
    def build_average_sys_yield(cls,
                                component_nominal_yields=[],
                                component_syst_yields_up=[],
                                component_syst_yields_do=[]):
        "build the average sys yield of up/down variations"
        cny  = component_nominal_yields
        csyu = component_syst_yields_up
        csyd = component_syst_yields_do
        cls.check_attribute_with_same_value('region', cny + csyu + csyd)
        cls.check_attribute_with_same_value('variation', csyu)
        cls.check_attribute_with_same_value('variation', csyd)

        nom_yield = cls.build_merged_yield(cny, cny)
        up_yield = cls.build_merged_yield(cny, csyu)
        do_yield = cls.build_merged_yield(cny, csyd)
        vup = csyu[0].variation
        vdo = csyd[0].variation
        variation = commonPrefix([vup, vdo]).strip('_') + commonSuffix([vup, vdo]).strip('_')
        nom = nom_yield.get_yield()
        up  = up_yield.get_yield()
        do  = do_yield.get_yield()
        avg_delta = 0.5*(abs(nom-up)+abs(nom-do))
        tot_yield = SignalYield(nom_yield, variation, nom + avg_delta)
        return tot_yield


def sys_yields_for_this_component(nominal_signal_file):
    """provide a list of the syst variation yields.

    Values from
    Physics/Higgs/HSG4/LFV/Leplep/FitModel/workspaces/Data_unconstrainedFpt_withJets/step1
    qcd_scale_signal_uncertainty()
    and
    pdf_signal_uncertainty()
    When up+down variations are given, average them out.
    """
    nsf = nominal_signal_file
    nom_yield = nsf.get_yield()
    sample = nsf.sample
    jets = 'os_jets' in nsf.region
    nojet = not jets
    sys_yields = []
    all_variations = ['QCDscale_ggH', 'QCDscale_ggH1in', 'pdf_Higgs_gg',
                      'QCDscale_ggH1in', 'pdf_Higgs_gg',
                      'QCDscale_qqH', 'pdf_Higgs_qq',
                      'QCDscale_VH', 'pdf_Higgs_qq']
    if 'ggH' in sample:
        if nojet:
            sys_yields.append(SignalYield(nsf, 'QCDscale_ggH', nom_yield*1.12))
            sys_yields.append(SignalYield(nsf, 'QCDscale_ggH1in', nom_yield*1.08))
            sys_yields.append(SignalYield(nsf, 'pdf_Higgs_gg',    nom_yield*1.08))
        else:
            sys_yields.append(SignalYield(nsf, 'QCDscale_ggH1in', nom_yield*0.8))
            sys_yields.append(SignalYield(nsf, 'pdf_Higgs_gg',    nom_yield*1.08))
    elif 'vbf' in sample:
        sys_yields.append(SignalYield(nsf, 'QCDscale_qqH', nom_yield*1.02))
        sys_yields.append(SignalYield(nsf, 'pdf_Higgs_qq', nom_yield*1.03))
    elif 'VH' in sample:
        sys_yields.append(SignalYield(nsf, 'QCDscale_VH',  nom_yield*1.04))
        sys_yields.append(SignalYield(nsf, 'pdf_Higgs_qq', nom_yield*1.03))
    else:
        print "unknown sample '%s'"%sample
    return sys_yields

def build_syst_variations(nominal_signal_files=[]):
    """
    From a list of nominal component signal yields, build a list of total yields with the theoretical syst variations.

    When the syst affects only one component, fill the other ones with the nominal
    """

    all_components_sys_yields = []
    for sf in nominal_signal_files:
        all_components_sys_yields = all_components_sys_yields + sys_yields_for_this_component(sf)
    all_regions = list(set(f.region for f in nominal_signal_files))
    if len(all_regions)>1:
        print "warning: not sure this functions works properly when mixing regions: ",str(all_regions)
    all_variations = list(set(f.variation for f in all_components_sys_yields))
    all_samples = list(set(f.sample for f in nominal_signal_files))
    sys_yields = []
    for region in all_regions:
        for variation in all_variations:
            tot_yield = 0.0
            nominal_components = [sy for sy in nominal_signal_files if sy.region==region]
            sys_components = [y for y in all_components_sys_yields if y.region==region and y.variation==variation]
            sys_yields.append(SignalYield.build_merged_yield(nominal_components, sys_components))
    return sys_yields

if __name__=='__main__':
    main()
