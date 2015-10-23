#!/bin/bash

# Template to execute `run_MatrixPrediction` on the greenplanet queue
#
# For more details on the formatting, see 'selection.sh' and 'submitJobs.py'.
#
# davide.gerbaudo@gmail.com
# September 2014

#SBATCH -p %(queue)s
#SBATCH --mem-per-cpu=1gb
#SBATCH --time=04:00:00
#SBATCH -o %(logfile)s
#SBATCH --job-name=%(jobname)s


SCRATCH=/scratch/${USER}/${SLURM_JOB_ID}

echo "Starting on `hostname`, `date`"
mkdir -p ${SCRATCH}
cd       ${SCRATCH}
echo "Working from ${PWD}"
stdbuf --output=1M --error=1M \
run_MatrixPrediction \
 -i ${SLURM_SUBMIT_DIR}/%(filelist)s \
 -o %(local_outfilename)s \
 -s %(samplename)s \
 --etapt \
 --systematics \
 --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Jun_17.root \
 %(opt)s

 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Jun_17.root \ with sys frac breakdown
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_May_14.root \ with sys
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_May_10.root \ anatype 2lwh
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_May_04.root \ # tight iso (py onthe fly)
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Mar_18_syst.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Apr_14.root \ # also real eff from hlfv area
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Apr_06.root \ # fr from hlfv area
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Mar_18_hack_mu.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Mar_18_tag40.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Mar_18.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Mar_12.root \ # tag is tight
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Mar_02.root \ # fine eta, 2d
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Feb_23.root \ # fine pt
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Feb_18.root \ # fixed tight
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Feb_02_loose_iso.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Dec_18_scale_low_pt_mu_and_el_fake.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Dec_18_mu_el_fake_from_data.root \


 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FakeMatrix_Dec_10.root \
 # --matrix-file ${ROOTCOREDIR}/data/DileptonMatrixMethod/FinalFakeHist_May_20.root \


echo "${PWD} contentents:"
ls -ltrh
cp -p ${SCRATCH}/%(local_outfilename)s ${SLURM_SUBMIT_DIR}/%(outfilename)s
echo "Done, `date`"
echo "Cleaning up ${SCRATCH}"
rm -rf $SCRATCH || exit $?
