#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=D:/Programmi/Xilinx/Vitis/2022.2/bin;D:/Programmi/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/nt64;D:/Programmi/Xilinx/Vivado/2022.2/ids_lite/ISE/lib/nt64:D:/Programmi/Xilinx/Vivado/2022.2/bin
else
  PATH=D:/Programmi/Xilinx/Vitis/2022.2/bin;D:/Programmi/Xilinx/Vivado/2022.2/ids_lite/ISE/bin/nt64;D:/Programmi/Xilinx/Vivado/2022.2/ids_lite/ISE/lib/nt64:D:/Programmi/Xilinx/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='D:/Universita/tesi magistrale/reti_neurali/ip_repo/edit_rete_mnist_ip_v1_0.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log rete_mnist_ip_v1_0.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source rete_mnist_ip_v1_0.tcl
