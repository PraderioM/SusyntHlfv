#!/bin/bash

#PBS -j {oe}
#PBS -q %(queue)s
#PBS -N %(jobname)s
#PBS -o %(logfile)s

echo "Starting on `hostname`, `date`"
echo "jobs id: ${PBS_JOBID}"
echo "using root: `which root`"
echo "using rootcoredir: $ROOTCOREDIR"

echo "Starting on `hostname`, `date`"
cd ${PBS_O_WORKDIR}
./python/plot_emu.py %(opt)s
echo "Done, `date`"
