help([[
  This module loads libraries required for building and running UPP
  on the NOAA RDHPC machine Gaea C7 using oneAPI-2025.3.1.
]])

whatis([===[Loads libraries needed for building the UPP on Gaea ]===])

prepend_path("MODULEPATH", "/ncrc/proj/epic/spack-stack/c7/spack-stack-2.1.1/envs/ue-oneapi-2025.3.1/modules/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2025.3.1"
load(pathJoin("stack-intel-oneapi-compilers", stack_intel_ver))

stack_cray_mpich_ver=os.getenv("stack_cray_mpich_ver") or "9.2.0"
load(pathJoin("cray-mpich", stack_cray_mpich_ver))
load(pathJoin("stack-cray-mpich", stack_cray_mpich_ver))

cmake_ver=os.getenv("cmake_ver") or "3.31.11"
load(pathJoin("cmake", cmake_ver))

load("upp_common")
load("zlib/1.2.13")

setenv("CC","mpicc")
setenv("CXX","mpicxx")
setenv("FC","mpifort")

setenv("CMAKE_Platform","gaeac7.intelllvm")
