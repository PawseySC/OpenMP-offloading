#!/bin/bash --login 
#SBATCH --reservation=CurtinHPCcourse2025
#SBATCH --account=courses0100-gpu
#SBATCH --tasks=1 
#SBATCH --gpus-per-node=8
#SBATCH --partition=gpu
#SBATCH --time=00:05:00 
#SBATCH --export=NONE
module load rocm/5.7.1
module load craype-accel-amd-gfx90a
# Compile
echo "Compiling code with clang"
srun --export=all -u -n 1 make -f makefile.clang clean
srun --export=all -u -n 1 make -f makefile.clang
# Run
echo
echo "Running the c code"
srun --export=all -u -n 1 rocprof --hsa-trace -o c_prof.csv ./laplace 4000
