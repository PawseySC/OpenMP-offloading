#!/bin/bash --login 
#SBATCH --reservation=CurtinHPCcourse2025
#SBATCH --account=courses0100
#SBATCH --tasks=1 
#SBATCH --partition=work 
#SBATCH --time=00:05:00 
#SBATCH --export=NONE
module purge
module load craype-x86-milan
module load PrgEnv-gnu/8.3.3
# Compile
echo "Compiling code with GNU compilers"
srun --export=all -u -n 1 make -f makefile.gnu clean
srun --export=all -u -n 1 make -f makefile.gnu
# Run C code
echo
echo "Running C code"
srun --export=all -u -n 1 ./laplace 4000
# Run Fortran code
echo 
echo "Running Fortran code"
srun --export=all -u -n 1 ./laplacef 4000
