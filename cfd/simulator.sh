#!/bin/sh
# Sample simulator to Dakota system call script

# The first and second command line arguments to the script are the
# names of the Dakota parameters and results files.
params=$1
results=$2

# --------------
# PRE-PROCESSING
# --------------
# Incorporate the parameters from Dakota into the template, writing ros.in

dprepro3 $params simulation.run simulation_mod.run
chmod +x simulation_mod.run

# ---------
# EXECUTION
# ---------
#source ~/anaconda3/etc/profile.d/conda.sh
#conda activate dakotaEnv
./simulation_mod.run

# ---------------
# POST-PROCESSING
# ---------------

# extract function value from the simulation output
#grep 'Function value' cc.out | cut -c 18- > results.tmp
# extract gradients from the simulation output (in this case will be ignored
# by Dakota if not needed)
#grep -i 'Function g' cc.out | cut -c 21- >> results.tmp
mv results.out $results
