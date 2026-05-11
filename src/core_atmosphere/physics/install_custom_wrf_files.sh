#!/usr/bin/env sh

###############################################################################
# Install additional runtime tables used by WRF/urban physics into
# physics_wrf/files.
#
# This script is intended to be run from src/core_atmosphere/physics by the
# core_atmosphere Makefile.  Files in physics_wrf/files are subsequently linked
# into the top-level MPAS run directory by src/core_atmosphere/Makefile.
###############################################################################

set -u

wrf_files_dir="physics_wrf/files"
custom_dir="custom_wrf_files"
noahmp_parameters_dir="physics_noahmp/parameters"
repo_root="../../.."

urban_tables="
URBPARM_UZE.TBL
URBPARM_LCZ.TBL
URBPARM.TBL
"

other_tables="
NoahmpTable.TBL
"

mkdir -p "${wrf_files_dir}"

install_from_sources() {
   file_name="$1"
   destination="${wrf_files_dir}/${file_name}"

   if [ -s "${custom_dir}/${file_name}" ]; then
      cp -f "${custom_dir}/${file_name}" "${destination}"
      echo "*** Installed ${file_name} from ${custom_dir}"
      return 0
   fi

   if [ -s "${noahmp_parameters_dir}/${file_name}" ]; then
      cp -f "${noahmp_parameters_dir}/${file_name}" "${destination}"
      echo "*** Installed ${file_name} from ${noahmp_parameters_dir}"
      return 0
   fi

   if [ -s "${repo_root}/${file_name}" ]; then
      mv -f "${repo_root}/${file_name}" "${destination}"
      echo "*** Installed generated ${file_name} from the top-level MPAS directory"
      return 0
   fi

   echo "*** WARNING: ${file_name} was not found in ${custom_dir}, ${noahmp_parameters_dir}, or ${repo_root}"
   return 1
}

for table in ${urban_tables}; do
   install_from_sources "${table}" || true
done

for table in ${other_tables}; do
   install_from_sources "${table}" || true
done

exit 0
