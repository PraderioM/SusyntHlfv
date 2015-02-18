

Quickstart
----------

```sh
git clone git@github.com:gerbaudo/SusyntHlfv.git
git clone git@github.com:gerbaudo/SusyNtuple.git
git clone git@github.com:gerbaudo/DileptonMatrixMethod.git
svn co svn+ssh://svn.cern.ch/reps/atlasphys/Physics/SUSY/Analyses/WeakProduction/ChargeFlip/trunk ChargeFlip
# options might not be needed on your setup
localSetupROOT --rootVersion 5.34.18-x86_64-slc6-gcc4.7
# numpy is needed for some of the scripts
localSetupSFT --cmtConfig=x86_64-slc6-gcc48-opt pyanalysis/1.4_python2.7
source SusyNtuple/scripts/installMinimalSUSYTools.sh
```

[doxygen doc](http://gerbaudo.github.io/SusyntHlfv/doxygen-html/)

davide.gerbaudo@gmail.com
June 2014
