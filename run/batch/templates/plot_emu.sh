#!/bin/bash

#PBS -j oe
#PBS -m n
#PBS -q %(queue)s
#PBS -N %(jobname)s
#PBS -o %(logfile)s

echo "Starting on `hostname`, `date`"
echo "jobs id: ${PBS_JOBID}"

export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh
localSetupROOT --rootVersion 5.34.18-x86_64-slc6-gcc4.7
localSetupSFT --cmtConfig=x86_64-slc6-gcc48-opt pyanalysis/1.4_python2.7

echo "using root: `which root`"
echo "using rootcoredir: $ROOTCOREDIR"

echo "Starting on `hostname`, `date`"
cd ${PBS_O_WORKDIR}
cd ../..
source RootCore/scripts/setup.sh
cd -
./python/plot_emu.py %(opt)s
echo "Done, `date`"
