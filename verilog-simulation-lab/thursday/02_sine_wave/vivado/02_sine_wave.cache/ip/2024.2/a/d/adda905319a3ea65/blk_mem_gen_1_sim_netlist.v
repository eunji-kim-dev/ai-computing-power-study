// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 21:33:24 2026
// Host        : PC-Home running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [15:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [15:0]douta;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "8" *) 
  (* C_ADDRB_WIDTH = "8" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.7096 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "256" *) 
  (* C_WRITE_DEPTH_B = "256" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[15:0]),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[7:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[7:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19616)
`pragma protect data_block
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
O7msG1rGsnU=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
