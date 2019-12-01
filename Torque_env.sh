#! /bin/sh

export HOMEG4=`pwd`
export PATH=$PATH:/cvmfs/sft.cern.ch/lcg/contrib/CMake/3.11.1/Linux-x86_64/bin
source /cvmfs/sft.cern.ch/lcg/contrib/gcc/6.3/x86_64-slc6-gcc63-opt/setup.sh                #set up compiler
source /cvmfs/geant4.cern.ch/geant4/10.5.p01/x86_64-slc6-gcc63-opt-MT/CMake-setup.sh        #set up environment for Geant4
export CXX=`which g++`                                                                      #tell CMake about compiler used
export CC=`which gcc`
