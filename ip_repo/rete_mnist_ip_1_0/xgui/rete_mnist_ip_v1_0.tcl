# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S_mnist_lite_AXI_DATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_mnist_lite_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_lite_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_lite_AXI_HIGHADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_ID_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_DATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_AWUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_ARUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_WUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_RUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_BUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_mnist_full_AXI_HIGHADDR" -parent ${Page_0}

  ipgui::add_param $IPINST -name "INFERENCE_COUNT_CLK"

}

proc update_PARAM_VALUE.INFERENCE_COUNT_CLK { PARAM_VALUE.INFERENCE_COUNT_CLK } {
	# Procedure called to update INFERENCE_COUNT_CLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INFERENCE_COUNT_CLK { PARAM_VALUE.INFERENCE_COUNT_CLK } {
	# Procedure called to validate INFERENCE_COUNT_CLK
	return true
}

proc update_PARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH { PARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_mnist_lite_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH { PARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_mnist_lite_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_mnist_lite_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_mnist_lite_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_lite_AXI_BASEADDR { PARAM_VALUE.C_S_mnist_lite_AXI_BASEADDR } {
	# Procedure called to update C_S_mnist_lite_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_lite_AXI_BASEADDR { PARAM_VALUE.C_S_mnist_lite_AXI_BASEADDR } {
	# Procedure called to validate C_S_mnist_lite_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_mnist_lite_AXI_HIGHADDR { PARAM_VALUE.C_S_mnist_lite_AXI_HIGHADDR } {
	# Procedure called to update C_S_mnist_lite_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_lite_AXI_HIGHADDR { PARAM_VALUE.C_S_mnist_lite_AXI_HIGHADDR } {
	# Procedure called to validate C_S_mnist_lite_AXI_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_ID_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_AWUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_AWUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_ARUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_ARUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_WUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_WUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_RUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_RUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH } {
	# Procedure called to update C_S_mnist_full_AXI_BUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH { PARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH } {
	# Procedure called to validate C_S_mnist_full_AXI_BUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_BASEADDR { PARAM_VALUE.C_S_mnist_full_AXI_BASEADDR } {
	# Procedure called to update C_S_mnist_full_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_BASEADDR { PARAM_VALUE.C_S_mnist_full_AXI_BASEADDR } {
	# Procedure called to validate C_S_mnist_full_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_mnist_full_AXI_HIGHADDR { PARAM_VALUE.C_S_mnist_full_AXI_HIGHADDR } {
	# Procedure called to update C_S_mnist_full_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_mnist_full_AXI_HIGHADDR { PARAM_VALUE.C_S_mnist_full_AXI_HIGHADDR } {
	# Procedure called to validate C_S_mnist_full_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH PARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_lite_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH PARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_lite_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_ID_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_AWUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_ARUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_WUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_RUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH { MODELPARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH PARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_mnist_full_AXI_BUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.INFERENCE_COUNT_CLK { MODELPARAM_VALUE.INFERENCE_COUNT_CLK PARAM_VALUE.INFERENCE_COUNT_CLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INFERENCE_COUNT_CLK}] ${MODELPARAM_VALUE.INFERENCE_COUNT_CLK}
}

