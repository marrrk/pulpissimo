export BOARD=arty
export XILINX_PART=xc7a100tcsg324-1
export XILINX_BOARD=digilentinc.com:arty-a7-100:1.0
#export XILINX_BOARD=digilentinc.com:genesys2:part0:1.1
export FC_CLK_PERIOD_NS=100
export PER_CLK_PERIOD_NS=200
export SLOW_CLK_PERIOD_NS=30517
#Must also change the localparam 'L2_BANK_SIZE' in pulp_soc.sv accordingly
export INTERLEAVED_BANK_SIZE=28672
#Must also change the localparam 'L2_BANK_SIZE_PRI' in pulp_soc.sv accordingly
export PRIVATE_BANK_SIZE=8192
$(info Setting environment variables for $(BOARD) board)

