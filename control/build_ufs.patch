diff --git a/sorc/build_ufs.sh b/sorc/build_ufs.sh
index 660293d6b..0c540574e 100755
--- a/sorc/build_ufs.sh
+++ b/sorc/build_ufs.sh
@@ -4,7 +4,7 @@ set -eux
 cwd=$(pwd)
 
 # Default settings
-APP="S2SWA"
+APP="ATM"
 CCPP_SUITES="FV3_GFS_v17_p8_ugwpv1,FV3_GFS_v17_coupled_p8_ugwpv1,FV3_global_nest_v1"  # TODO: does the g-w need to build with all these CCPP_SUITES?
 PDLIB="ON"
 HYDRO="OFF"
@@ -50,6 +50,7 @@ if [[ ${BUILD_TYPE:-"Release"} = "DEBUG" ]] ; then
 elif [[ "${FASTER:-OFF}" == ON ]] ; then
     MAKE_OPT+=" -DFASTER=ON"
 fi
+MAKE_OPT+=" -DMULTI_GASES=OFF -DINLINE_POST=OFF"
 
 case "${EXEC_NAME}" in
   "ufs_model.x") COMPILE_ID=0 ;;
