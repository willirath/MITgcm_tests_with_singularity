# Run MITgcm tests with Singularity

This runs MITgcm tests wit singularity.  It essentially adapts
the [MITgcm `.travis.yml`](https://github.com/MITgcm/MITgcm/blob/02b4c39948fb9bf41c412869d9deefefe661ba24/.travis.yml).

To run, make sure to have `git` and `singularity` (at HLRN, `module load git singularity`) and then:
```shell
./run_MITGCM_tests_with_singularity.sh
```
