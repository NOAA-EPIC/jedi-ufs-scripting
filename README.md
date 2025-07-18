# jedi-ufs-scripting
Temporary repository for shared code related to JEDI-UFS/in-line JEDI development.

See this [evolving doc](https://docs.google.com/document/d/1un1u4l-dzZqo6P_q9k7OE5-2GZD9_l-nurf3KnEOjJk/edit?tab=t.0) for more background information on in-line JEDI development.

# File structure overview

```shell
.
├── Dockerfile
├── README.md
# Build the control GW based on a more recent version of NOAA-EMC's GW. The WM hash matches that of the letkf build.
├── control
│   └── cntl-build.sh
# Build the control GW based on the EnKF-only and work from Travis Elless. This GW is out-of-date and will likely not be used as the control. 
├── control-jedi_enkf_only
# There are updated versions of files used to assimilate only pressure.
│   ├── changed-files
│   │   ├── atmens_analysis.py
│   │   ├── jcb-prototype_lgetkf_observer.yaml.j2
│   │   └── jcb-prototype_lgetkf_solver.yaml.j2
# Build the EnKF-only GW.
│   ├── jeo-build.sh
# Setup the EnKF-only experiment.
│   ├── jeo-experiment.sh
# These are patches needed to compile the EnKF-only workflow with an updated WM and apply changes necessary for pressure-only assimilation.
│   └── patch
│       ├── gdas_cd.patch
│       ├── global-workflow.patch
│       └── travis-elless.patch
├── environment.yml
# Scripts associated with the in-line JEDI experiment.
└── in-line
# Build the in-line GW and associated executables.
    ├── ij-build.sh
# Clone and update the codebase for the build.
    ├── ij-clone.sh
# Build + clone + test convenience script.
    ├── ij-do-all.sh
# Setup a GW experiment.
    ├── ij-experiment.sh
# Run ctests associated with fv3-jedi and in-line.
    ├── ij-test.sh
# Common utilities used by the in-line scripts.
    ├── util
    │   ├── env.sh
    │   └── load-modules.sh
    └── work
# Run the GW experiment.
        ├── benkozi-gw.sh
# ...nothing special...
        ├── benkozi-work.sh
# Patches the hera environment for finding Python packages. May not be necessary.
        ├── gw-HERA.env.patch
# Example .gwrc used by benkozi
        ├── gwrc
# Helper Python script that uses rocoto outside of cron
        └── submit_global_wflow.py

8 directories, 24 files

```