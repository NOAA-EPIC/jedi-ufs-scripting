# jedi-ufs-scripting
Temporary repository for shared code (probably scripts) related to JEDI-UFS development.

# In-Line JEDI-UFS

## Environment Variables

* Required:
  * `IJ_CLONE_DIR` --> Target directory to clone the `global-workflow` (`git clone ... ${IJ_CLONE_DIR}`). Directory cannot exist.
  * `SLURM_ACCOUNT` --> _Required only if running tests._ This is the machine account to use for running `fv3-jedi` unit tests.
* Optional
  * `IJ_SUFFIX` --> Optional suffix to apply to out files. I not provided, defaults to the system's current datetime.

## Contents Description

* `./in-line/util` --> Support scripts (env, modules, etc.)
* `./in-line/work` --> Space for work scripts - can be messy
  * See `./in-line/work/benkozi-work.sh` for a full usage example.
* `./in-line/ij-clone.sh` --> Clone the `global-workflow` and perform any post-processing on the repository contents.
* `./in-line/ij-build.sh` --> Build the `global-workflow` and in-line associated executables.
* `./in-line/ij-test.sh` --> Run tests associated with in-line coupling and FV3-JEDI.
* `./in-line/ij-do-all.sh` --> Run clone, build, and test in sequence (for convenience).

## Example

```shell
cd jedi-ufs-scripting/in-line
bash ij-do-all.sh
```