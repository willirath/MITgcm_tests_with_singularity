#!/bin/env bash

# Need to have `git` and `singularity`.  At HLRN, run
# `module load git singularity`.

# get latest MITgcm code from GitHub
git clone https://github.com/MITgcm/MITgcm.git
cd MITgcm

# command to run mitgcm in:
#
# specifies:
# - execute with singularity
# - image to use: docker://mitgcm/testreport-images:ubuntu-18.04-20180827
# - host-machine directory to provide to container: provide $PWD as /MITgcm
# - command to run in container: pass everyting to `bash -c`
#
# (check `tools/ci/runtr.sh` for how MITGCM_DECMD is used.)
export MITGCM_DECMD="singularity -v exec -B ${PWD}:/MITgcm docker://mitgcm/testreport-images:ubuntu-18.04-20180827 bash -c"

# another env var (IDK...)
export MITGCM_TROPT="-devel -of=../tools/build_options/linux_amd64_gfortran"

# run all tests
MITGCM_EXP="offline_exf_seaice" MITGCM_PRECS="16 16 16 16 16" . tools/ci/runtr.sh
MITGCM_EXP="global_ocean.cs32x15" MITGCM_PRECS="16 16 16 16 16" . tools/ci/runtr.sh
MITGCM_EXP="tutorial_deep_convection" MITGCM_PRECS="16 16" . tools/ci/runtr.sh
MITGCM_EXP="aim.5l_cs" MITGCM_PRECS="14 16" . tools/ci/runtr.sh
MITGCM_EXP="isomip" MITGCM_PRECS="16 16 16" . tools/ci/runtr.sh
MITGCM_EXP="global_ocean.90x40x15" MITGCM_PRECS="16 16 16" . tools/ci/runtr.sh
MITGCM_EXP="tutorial_plume_on_slope" MITGCM_PRECS="16" . tools/ci/runtr.sh
MITGCM_EXP="tutorial_advection_in_gyre" MITGCM_PRECS="16" . tools/ci/runtr.sh
MITGCM_EXP="hs94.cs-32x32x5" MITGCM_PRECS="13 16" . tools/ci/runtr.sh
MITGCM_EXP="tutorial_global_oce_biogeo" MITGCM_PRECS="16" . tools/ci/runtr.sh
MITGCM_EXP="tutorial_global_oce_in_p" MITGCM_PRECS="16" . tools/ci/runtr.sh
MITGCM_EXP="tutorial_cfc_offline" MITGCM_PRECS="16" . tools/ci/runtr.sh
