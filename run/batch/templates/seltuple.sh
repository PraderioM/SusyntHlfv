#!/bin/bash

# Template to execute `run_Selector` and make nutples on the wis queue
#
# For more details on the formatting, see 'selection.sh' and 'submitJobs.py'.
#
# davide.gerbaudo@gmail.com
# September 2014

#PBS -j oe
#PBS -m n
#PBS -q %(queue)s
#PBS -N %(jobname)s
#PBS -o %(logfile)s

echo "Starting on `hostname`, `date`"
echo "jobs id: ${PBS_JOBID}"

cd ${PBS_O_WORKDIR}
echo "Working from ${PWD}"
cd ../..
source RootCore/scripts/setup.sh
cd -

 run_Selector \
 --sample %(samplename)s \
 --input ${PBS_O_WORKDIR}/%(filelist)s \
 --tuple-out %(local_outfilename)s \
 %(opt)s


echo "${PWD} contentents:"
ls -ltrh
echo "Done, `date`"

