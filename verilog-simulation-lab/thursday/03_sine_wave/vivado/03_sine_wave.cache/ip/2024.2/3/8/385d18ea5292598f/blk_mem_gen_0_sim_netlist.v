// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 23:22:14 2026
// Host        : PC-Home running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [7:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;

  wire [7:0]addra;
  wire clka;
  wire [11:0]douta;
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
  wire [11:0]NLW_U0_doutb_UNCONNECTED;
  wire [7:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [7:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.5432 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "256" *) 
  (* C_READ_DEPTH_B = "256" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
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
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
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
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[11:0]),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19776)
`pragma protect data_block
e5Lwr7min4iXvjGGHbuagkKpEYBkw5CCgot8L1lB2LQSGovaIzOUgl9PdJ4iy8K/O8eD17KQPW2b
wU8vXZnxRVFkNL9ecdOWTE/dzaOtS114CAn7MdiwnoxdZ/Z26ofC/XYp7dPlRt2J2mSikIKWRkuU
QXNIOYEE0vWxR6VBdUUUGPFj1gLfQ8YGlriJUpq36rOs/YKFyJyevg9SzAM1i8gDwucqnRznZOHS
FDNovseuo3rRe3JhqHp1VtQFiJCNypJfBQEngjKOWQXvClOi+pIxD6dC9yeRDo7FMVqEQK6PfzLw
paoErMndDDwX3YInlTxwA8EDX7Dh8DU34d5Io4zdzi7NEpbB1ZyRmz9KEwKqjs1ISlhfRnxxAMlJ
+s9q8QCbCuIE9NLu2+K/dr7kZSFVL47FtcF3Dgjpp3JMTyAa+q8anjlNNJop+KozBc+fGaO57X04
RHfNHUfeGlrEhK1akVL3hQNAz+tOEQYNX3UI5j3COAeZGyCJCuFwRaob1Yabweyv6W6HPugTjXmP
vuLGTdlfQIZF1j5ThmtpQb9F/JA4hyAoDQ65o1ohusd4dtVrfW9vs0pFGYD8SDwUADLO3L7VzY11
wQeVBr5LyZFKeijCiVQFJb2J8ZBgMGyFBE/JPCKgu3erM2IknfkZyfpKXURUsHYu6RSS/AKm00cV
XyELX5bbKFtBhzFnD835FjkuRuAO7MAn92Em/ni8K5upw2xtFZeuGUJz1RnfysdFjPYUW89zAiZt
L1y3XCf2yu0AmzKJICgRTNlNWoOcX1nPCs8xtaAVn7eXuIbKOsM0NGcf0kwTTh9z1Vxf/xPI+iYv
ZnyQ4g81q11TC8QVunZ8hJOnMIkBqSVZpzmRjHRRHfBHnMrnDBBY2aZON7M4IGDdFFa7LD8iDgxD
sYZruZ4Zc48baJoSnlnPrUpVUCOAlTpkvxcG2XDOxwaixc/Y5mZCLYNPIRBGSIs8vqfK3FE+5Kwg
35vAKKYdkmGcSKfna1Il9hLp56QEiaplsASz85zsH23hjHfAeDxRVmcla2SYrck+x2UtdDTrH+U+
oCfVmv5pjhuPVajtmtzCBHYsNe/x+xectP1tVYPYWzT04Xa8ZSc7uAmJllHiMGvrkEJDIkqb0eIs
eKJ0fhwZ2ojDYmzkLX7tdc3chzVew5d07wV1Fp/f6pBEdMh7FXp0fH4CfWKDq2TZmDmjhPeYAArh
3PvFVXO6zbnVs/5xaLZTvvzFzAczKpLf5u7aq4syHxzy+l2seotJVZt2wkRtDuw25M85Yf3dwcIJ
cHz6eSyERMHWULPfrVPaJrGbwtp1B3srKxe30EUrObiJOVWEip1rxPqqhl36wzApJWtca7G0MsHZ
bhr98kFP1MFERgnLXm3ORAuDy7rNVjvnbH2C1npVqigkrGiDKYFEdbZ1V4X82JUYOm7EDCVMINjF
twfUF+dQNFjY9VS8gWZ31TvHhfS6qd1qaW7x+JFVi/vHlVbTQKPdKaiRhjukwgFsy7sqQTcZCY4w
YpXvENMspypUKevQia/gfD4Tf8ezXBItxMKi7+lp9NcJqJd7eVD1g0Pa0NyuViJCkru6lmAUd3B6
VGSRQx/uJT6kVsCbuMy6LO15D2YFFBewmcUHCRpuKMoQYkjbBROUtUf1tvlyTIf4/2rBLxoqP29Q
Djzi3f22RuzBYt8YEA5hWBwXlYs8YTWYGX7TGEUO88lDHMvMZi1W6z571IZFQi6WxVEq+eBEM6zP
i6HAQpMIlzFnnWPF/PXerppFkyPF/rKb9KlVQImtJXIDHfD2S9sHKaa52WkX80JhubJBzYtpf/uz
L06tcbjmnSGXNi7P826l0bXFn+Sh6ylf42VuIod1KHeFzqQtfGkoxVfOPe7ZRdqq9SQXobJrCuxQ
QHFWk7PYY57gYKh4BVv2CxHEjS11wWexHIETUrgIt9eh3CFYfcmosdIQcWgi3mkGDFHPM0Pn1CZk
0IXV7q9qCNF4Hfa4+OqtWQHKm7T/86xR4ZuOBsYL8notBaljG0ryNrdfZpqGqDNNvXNqB5g0pXmJ
8lSRsQ6Y0jYac/AIGt/USn0x7ppVLMWsvlJD8/+rNkQcWHDXLpcDNzf44Ho9WrmuYxsdHcq/YUuo
wfN7Yzo2Li9cGvYgvg372JcqcvZm8AZnlWmz2sTlEzKLdsZi02EMQga5qqiBFHevkkyEhiZRw0l1
KSCyhc7Q80kipR9eabZk6j3Lyky1vXBeXSOEqyVvmRkh3yVXdXzHakAaB3FkbUGl5x5ggTLAzRjb
Xq3Yp5XUvESUfstCgQSwQA2NZbpWpHybPGXNugV09AYzKPOOKURdhv5G4lWU8iwFf8wfufeJBpcg
zoN6zkif/TnIPME6sOv7x7ydCWKlZ3iDYKDFdNw+ykDaKw4tCMvr1DdTNgHaY52UtKWDFvYotj9g
VoSrfWDDhrjPWJnjBZNC9RB7qjNjJwUFyN2mFZ9wbmvr/nQT4dcfUeT+O542pPeR53zLOFUA4HUV
EH3uAtfXXOH8LyTDpxIXrlPHtOOV+CuwLS0s+OXG0MKi6fdSdHFW2jakfDAuQxzhEqT5KlbDTRuR
I3bXLqsDbbi1C8WTyxo5EFfXDDZb4Sx6XH+HwzQBaN/qMzZ/dqvvAxHsPBUhGoMe3zXXC/CkzPTt
bZU/MB7cVz1AYD0VnQGA/0mYDbdNIW3o6iGEVNeVpJr103jcDgVixHMA2XkMw6/EfFAmdq/VzkuK
XDcGJWya3yzh6e/Si1iNIb/0hmDVxS5S1FslMa33L5fpXQP6lUl11oDllE1NVufGTk9SF8TPohet
ZU+gBm8BXDZ9B6PEo0gXvLD24Aw8T5Fa06msam70WER8AgTgoIPTmekcmCYMUD18KtbgxgNpyXiR
1xZocNiaosTCE+NLkp1VuLkP2CmY09k2uHlTyijb8rJZSlzxGXAd3Fhe3MrZwzM2VtCCTZSpl/y7
dZzXOVj0U+GpMMpWCWAwBEgq1j5yLzUJnNw802zUKqGukjrXzvAexF+6hNNUOGqUXwwijrQS/RXH
GLu4FT8a7ZXn1Kn1QZUNv1Vqu+Z0QoyG2r6bOz5y1WlqOhlLKSHIdHiEIZp8crNT1HqrICKaeeqW
Dvnifqyu8BGABHE37jZzcmqqZOSjd1H2j7F6SEpaFWyd6bYW/n5QP3sWwaoiUD6P9bz1iuVNYfmR
l3cy+xSrm2u9DtluXP8qABDlZu3GfpjeGvJWh28t6Ge5ZIuygMGon2xrD2u+cEuwgyHe0YtAa540
1woDgkX0EpcjAiUNsdLNZPSy+GQnuR82bpHk4rlwWh5HlaOFEPd6czowu9yyH7HfnpmXW/dgxvAo
vxu4LotbrSSGE1Ibs6QeO4I5TJ9EXRL7zPyq4UPuD/UrKaAUdHwijzbO0crqd8+ZCLJQtACKGegg
40+bUBUuSCc3gKViu3BP40GLV6H4+liTpsHrzNiVvzv/3nXBeNIffr83LVA52SYaqIxuhUL1inCd
UO6EhQ4YQustoUJDJwtRkvNQY6ETyVPMGzEvkOUZ99OKQONQi1Lzs2CFw8GsKyC9SUCmKiocKVpi
QEkwP1XfcHVDjAuSLUntmT4WmJehR7zsSP3NeEEsaeZjvjvyX4U4B7GtuT+EFuTiDjTaUgVE1oUv
gzelEzbbVDm1tGsOupYYT7UO49E+KxxQN/Rqw2hdNObEps3ZwWAxtfLZ/T7UdSK9U6lleY4zGgcR
SpBzjinVg4Cstmsbhi7O+xqrghu3+QmsU1P8EP3cAUFRseZ0BfTPrlMxamoMJ2Bjb/PdsZpbftdH
IlgLSKzVC99m1KaH1QnccGuCd+u8jgQXidYuvT5EDb5ENuDJiUrhdVtTdL5+XuUiNH5CBW5xdcH7
1+Y3Pnn+KWIcBcjo/BqT9l6irpL/A0BMqiAmhC0EMkBo2NEXcJ56qV4omrmTXEwHfqZ9N+C/wDp+
6Nc2clqSv/9IPOtSYpbXbvwHVspOjjcsZdUBF5322hZWDPg9cjqkyJc6HFwVOaw+qey//bMgwCud
aypkCZEjB/63dpBTFMY21L35H5nVP2crv7IH9o8FVF415wUhDol/GhKqsBYW6bCmFhZiww6tdcLl
hE0kha1LYiNeGegyh5RBkdd3CwhH8j2kkcGJ4L3BCaT7zrTCum851QrY8iyqVLCAOeQ2sKUZE+y7
+BYJz38JGTqCxZ6g9vMCmieWf0blcm2Cm5CN2VuLy8SovkCcotRCJkedVUQosbG6emkuL+cJzRqH
GXRImRLcMTYtlD8HMRaXhTWo3J0vabx/mz/CdS2VK5NVOnmz6CuOTx5ugW4yTi607kjAxiRm1lgF
CLVMntoGlEtYqjWZ7p30D0qfLz9R9TyGmtbzOhvgUfRiqFfNmTjEM++Rpc8p+Xenw501UkMaU1fF
5hqNrHiqvL1USvjPwDuXyLjoWGKN19l1LxHKmWs7lCdUcfjQYt/qAJVNy21rLb+0C6Q9pAUUaiWk
cuNmdV1yt7tguvBr7jwSRigIEo3e/JsDT3+tMr0/acNqtaLRLwz1KAdx3QDmophcVaghKD5bG69l
yLFJyfl6nETXYkJERMEWSFC61u4vtQniRJbEvY4SdyvVxlm3MTBUCXFvgEZvG+f9QFSceMvWrl6b
kgXv0sfXacQKMDxyEF2mOLCmpdVpqThXllQtKwD8iGSl3y+FLAtT9P6SkBGCAg8bpMhAzMi6JJDG
EAfbQ/M9CJoTozHyQ3e3wsLKJdnntN2y27dH03A2Drm6FaDbmf8O+74ZUW6mhYUBodcqYxc68BYE
kt7uDS/cFU0i0+k2J/nQP5KnexLHiCJmiDIx8EknbeLnd+IopELSLjpr+p5wqJ7sLvVspZgFr0uf
/1yvlYfNFswnXDjU7YA8dA29rYbw5oiQllu9abEaDnGeV2a3ahc6cSuBAm+SUAbRH+DjZccfSbOO
838grznhdTVICOIqbB5/X6s7ymQjLtrR8WdSEZKUcRmeqPUqR3fQ/BVAve8iGsDmLvZVcs3lJ2Wn
54qK+cWuE2/QDPat014T7i9PV+Oa5IXD0GJlypMQXOb+GvHhMhhQm+PViiazqEu1bfgRQTqLdjSS
JTrrTCwAA3fMRL8LtHvTWlEy1rbfutK/FwN1C2/YmP6Wdb8DKOPWDNLi5DN0v96mhOfRGuSH6xoq
XaNBagDekZl7VykwtSuVM9QoIjGlzS+9A1lCtEto2iCWaKnCJ/AQ9ygD7o1BiFma0WdYYbGOBbZX
p0iDSPYXJGBMRhfmzXuuDz1Vqq5bDBMy2Cjgt+NNU251MHr7/b4PTypcw5zWFuQPbRQqFhNDuhIN
KLIdepuubKMailLWUEpVFW9enT0NA+pXkogCTOpV2EFWMsZ7qBgMvwOQktdoVlOjDQ3jG5h8z8Qo
WbEHZ46D0fQUwda7AUhnE18sNypH71y/GmxMMOGXn9jUawFzie8E+DyjMChVWFGAa7OidP9751bf
3NEIAvHNmn37Oo+d8kl2yit9vCRZbh2tlBVams9LrcVFFNyP/q4UF0UANFMBNqrCNhQq6EVr+T2j
/j5mixFadrjJ1rYAuW1BCq+v1qCxZYmAATVCIjlyhLeR/HlMZGkokploziK8Vr24I5psA2B39wNU
taqWdXiqxWaOeWab1Y8nnx8b2wKrqMBCVaTGDUJWD711Qx4uJpR7ZWQUa/VYAaaZidV/XvOmjlhq
W8PusbL7CjVkDbNT9SkJ2oG6OlXGSt619bL27GzSwL1Z7NKbM7IOpGvBtEHklpAZBXPI7oGEMspE
aECcJvgidXdnLh9/cjvCvQP2xVv3CdcdBfp7fEJfRtbw4cihmi9znW5Yz+EKpoBnY4UnQZ7hxsYC
CcrLgnGIiOCBh4t8/Os6vOu6JPpyXMCqZ4rPde+HVVBIHacVwUgTunWimAW1boCQOh28T4nRMpA8
Yq64pvMj25Bo3bUL05BuKdWegu95F+SJk7zyrHYCtx14z6wVAiC7Cj//nGjwOPISVptEYBhMbqv+
7RWH34meRYDLoUhUSRLFIxyJSAlRtGiEJ9ChVDvs0n3gZD/PucL5AqNdNU0zaGMWzNvWd0M6RGGw
ZMXKH2Gk4vS8wwVNwMgWrgXG3PyYArrpIWu5Riq8xizgwczBOmplXLpYHolJ/DCvfSLTLLENW9C9
c7wPM1rMXaiCProaVI9R+PWrxQMntdG8AqNnwWjP9S8N8Z4KCU04WW1yramQtWtLvDEHk4r5oEg5
U5O3/tWXP92I7vwPPln8AhMO0bOq6bJ+YOTxDyUZxT4mZtYtI6rM3vXpiEeDVS39tllznWEVcrxp
1kLRgwrNXoUk/HXwZeLyP76eD1E9YXKPar6W3F7RjZ+plo+SuMlELVQHioeirxJ1HNDxVL+WRDr7
FtSbYZokd/q5ZUzJ5tjGgqDHIJ35QNs5lQ8qsWx1H9j0rZgvKji4X3R3mUQKHnT6SoJmHmmcRtUa
2Yr/tGMVr8btT2s7OGf7xF8TyBT3/eWooy6Xet9QTpw1AFpXSSti6nFgut2ZF/e2ol/xcTdk9O62
pgepItzXQ7IKWO2J8dPF0KF9QyxNSpsdfj0tZOY+R91kW46DanDtGJ0L9JbgC17kUJ5HbLRa26as
Ohbsi9SbOGvDRFC+WG5T08mUKYaEDkU6d4pbKJEYHRLeH5XH6tOIcMfRKOip0SQHOsCm/UA5eLXl
k3rtN0bsPh8Eys3PymeP4B4PakAcx2Y0Bh6i/PWpwYllHJcvgRo00EdUdIZEMYpjZQy5Qd87jq9w
KegwhHuqfUp7zYg1sHm92SngCXAR1moPP9z40I2ELwvUpgnrKgDLvKRFLN8kxs1tUPqjivk3y+eM
9b/M90fkCpChfL9rMtHfQkPdJAC3Eq9sLX6Jb/7KWDC6Qcswim4NoWR/FpH/qUPQmDbU8xQF056q
NKwSMTQBdJsBPv7v+13lzyK8VJnG5AwgIMIEZN+ta5rVd1bdYt9PDo78Wx6azupHhh12rMpr4M5k
AqjGZcC7XezmTELKRUIl8hBlPjcH/IfYw4LMsCFdXpzEsV+NdkMOpkjvSLyN6NuWnjJX2wAxk5vh
D+Wja9epUDAvdPe6/slkEL4EfW2pcCGnnYNNgqM5sJj/Zde55BLksuPGfuGu6d8HG7Swy5MBf3vr
5ucuqpHhzX9k5NBzgsFcVbXR+DbMYtFF/BJgmHQIGUKqX8iCOTF8SRSK7mdNR3Dr4w04BvcTew8E
2CB5sBURJcJ7LFHqZKqdGLg0lHAwfuXlGvHufP41y9eL7YXBZXLB+Q6BLR1GXjpHutmPjARl28ZZ
wET9YwAQynbbOofDvKvZAxEcfAKzC323R5MrscK1VTP81qwwMrsypMCu6PWOYqQayd/GYODnrtxe
ZjBnEqlp6D5mFhADNKkHQSkN9QZ9Zh8BpijIm/Pii/qrcmj+x6roTNXCfm/mpJfStqubKo6RDicL
DTr5ySGcoa96QkV7TsbtTGSzeLVYBky4Kks3EBVRtUfpA/y7yehJucaRf7Bfl6zl6VBVD5p9MUGc
GCZcBqAEDLlvYtfbOEsU/C/uXwT33wGA1L1z6hAP5ngcBQkcd+KVhxcGmprR8L5oO09r4oVQB25b
0QKxvI4b8gKou3iclwZ3CK2HRSR2hi1pwd6BIbpECXIb3TTVDN+VGaO0YaUg3r8O8H2LwB4eW7r6
xUDUlz+EESwxPPy+4YHXauHfeNBPfzm4c9pj+71elFCeJBKXB8VnIQaQWEpWLg+Gq9v5obwK5V9y
ywnpwda627sI6G4AkvvzLng0Z3hQ1sc1SF7D79FSDQHLacvw/chfPRWjwW93J7UuzXT+bQ1G85lU
P8G49oMcElWZbavRgCD/Y+zJzHFvIi8W/xkCa2WEIfp6zXKAqPbZNXzZrJwdqTSMCOBXAqoPYMBf
QTboE79HlKgXbsn2iWKZ7QB9sWtEpVFaEBp/ONCt2e1kqnISBQnJ6OrfS9kLXEV6+grKasiqo2fg
sJIDFxZhtRQ5E4SwMIMg1pWh78UZkvjAO8cVCF3j4ZUhtXl0zo9PFXXWxYdkHmcfJt3NIeA7VwYw
4e7OeaBmT0CPSBINwwNP3o5oqzP/QU1B5dtFqCu6tUjWmo0GZYHcUKvzbQ9HDhOy2pKYvYeeerJQ
wwCA6YYdgr5mYRQE8d/fzIbBdlnElGqdMlrgoWgPugA4s948v2EBSry5j2oQM1/dTCnD7qFj3p99
zwqOl5bvW6HZdus5vCV2cmM6AWub9b3FtI5tRrQl1uraoTj5h3MDRnaOi09379p9HplRDqS5CULP
22PnqZvTgfxU3huQEobh4OwfMCBkEnF3BO4Zwp0rAFUXrRqvROu1sZWUeUKhLHmYcmsMrHA73pWh
raM1UTmr4XyryXwb8T+suGof4Kfb0zOhzOq/SOA0EiVpx7NYY22RpEmBYrgnxkqgz3GNL9HSSB7W
Zw8QwLwqHhgyffmBB/+yBTROxRPToeYXZw682JY0XFJ+/+VPocXOntI34Q8QlgBV9iPExfRXyk88
/jDIr0Mx2cWuv+6RAotkTqANhrU3aIKAJAFbwmjkQp7F1hPtAZ0zl5TdwzJJZFtdl5RjaZUAaYty
bVwOyhc8ueEA3y83kbT+djxHwL8/5NOZkS9skyjNcclciVoPkSdcxlqA+JEXYoEWTeypPbmCMBXv
CG38NChn2trH14UOnziFP6fvl5dNT69TNEHotAE7aS/FHjWAg4TfBux3lqG4d0n0OlEI/vxmT6ig
y/rI2g7gNlkQGj80rh9Ghs3cpRa1h7mJJ6vPQ7/f+pdrLgUHyBXTY4NDi8Bw6HVJAPY6hDsSK/nB
nJxzIc0A26gdMD82JTJAtYSECZwC/jHMJb4n2iB+w1HIKiR7xXCp1Iy8zImqwg3FhwsrVOjVQzvp
rKwS5KQFWAjkvOunNIuX4XoQEZQdspy+qVYdcYCdhGPzZ4CoEdZSZqVFpDy09l3+f2IbcXFm68Dm
REwqCPFYaQLFkrvODLcoGEgoM0PTGllrvdvjYyr0QdMGyBARfBOJ2d792Di612QN/1R6MkkZ6Gil
JR19Cz8nJITJ1GPa0WLNf1AJtEd5zyxtRhVVhGSGHlWjVxfLY5gFwPDf2NUMqRkZjt8N0ekfamJ7
Y6KOfxrvO+HkP+jpn2etR8H7Bf2FkUZnaCITxkYPgT4TwbUXQvcpuoYzgKlCCeZPJsoJ2hORLqOE
XLweldqu3DsNCxOyeJL9leSuREN4A/jQqnj88pKjhAnWRO0DujRlyYCtGPOet8F5Wq7ZSZIUxQX3
9ri8PPl7K7v2q+DbgAhPELlLsZhM9o63emFncsM9HhI2usik8Py3SHY88LZ5HRIICadwRKTDJDPO
C2plaBsvDm7uGYyZXuIcZtu085Pwmum/nM4fsG3RatON4ArH0YQbuWDdIpD/QRXI4j8Lo7lnLg2Z
YMwE4wiEmKvKsBqMsEwhTNjYZMh42QXEngn7+LWe3eMyxG0SUKZo1msQR4X4eYNQxHAV5NS0P3hA
/18okDlsiKEigtiAn4PXgxJOYnZogfrF6poS1wt7KKl2zc59CZXrKUKzzF8KlpT65MqAC3jshUGc
o48Pi++dcJNjk7OaOZQak/YC1NaRD6vjTrMem7gteBCzff3mV4lgNvFsl//Xc1SquX2aKcPLH/br
03eoL1d1ka8HH1AUgTR39Hqhn92WqMlVGN8YPhIBnu0qt52hiBgXMIBJemOjoT5GITO1OyTlnBFC
rhzRCXdZB2zZzGhtlN+wNm9O/s/lVQjJpC3Kcs4bHvtfEYMjRwacA3pg6N+WnVXaThLzF2cYd33m
QQP7e7CNh3uXpeZL17K5N4F5Nx4XJsz3EG/xqca3L4KxlQ9XFq3uYJ/SR9etU4eTr7lk3Wjm7IJt
YXJZvFh1T5yHGvxrIpZ+yPaxfMjbPXshkoouV9yn2sYmqqOXQ3aFcysxz1rQu43SiKFkLc00uMQa
6cD/k/Pc5JFakw9ncNDIU7bmVaYCWw0q79xAi653ZoJU/PZoJWKHxcHLSJxb1zJbUu93Na2GeYkq
iEtdJqm4wmDiFFRO5yYunD7UA14DWVlZBqluKVW5/n99tgATNM2HUYdhczkIeliIjzz+4CAmhFSa
YveFcd6Pk5Y3MFp6F8U8iQWl59KCnt9zAonngNBODl/1wfP0FUzcyAmDeWbUMTNq33rQdfyuoLqj
phBmb8WwSRBsK3JOzDnXkuH1n4fWF12HsdpuxZ0Z7h8LWKs1iYBQwQpPoM07cLchQY5vroDPeKDB
+JBz03KxsmjYRsFinFcFdg3UVT5jOPZfnGmx36nA1BE7TiLlwqMUyFKsQyS7r1E+qww7iuiu38lG
8xnXLPMT1IJ6spZrZb3BRHRA8Yit93jm1N/HWXs3GfrOldCPAzcKnQiRLW+jipYva0FxpBpdHb5M
eHx90FWlWAvB/OIX5+8w0jnSCzn44hMI3mmNhjN7Lj2OWGN285Z2wspbUrHGksCrqumEPF3TiBih
qns+T46GbJ4MHbsV2LqTyG2L9MKxK9KFZA1d7OcaKwaaBmWq0b7ImwthowJWX2XtELst9U/u37YG
CUzVH32aUrUGGmCJ+1ppwd0L3Ecs6QRrziCT3CapcZb4wAzp21Bt1IoaVCRuJKLDXzbQ+6XzMp1K
MVZ7xmm8CaXJ0NToc4iYxoDky3fQd0QtTa9McvoIcFELgfaL9GfpeNOI7MBpdo2BpsdEfB7Wg+Dg
qRhOT981Cd4L5w1m4ifuHuCHyUzqfn75Uaj1iG3UFAwKfDjaF/UNHnQBNhPmueYZAqZvSd9FbOIn
FCU6zIR29TZ5zF4B1o0dH/j/PVS5d0yNyuZ/xHs62exnejagItRuqVJSAz6EQfoxY9iF+iwJAlxh
DP+SQXMhrMsCnhV1o+5S3fhGbGt9OFMB3RloNwZTOopjVr3inKyOJ/OFcrCFoEJfQtVPJUIOPc5E
DhJ0n6npXRpR0P7+4ulh/f+0yoPnQTg+xYv7iSLD+F2k/VRksmuIRHepu5cI0DnljF2muOjJXuCc
sRMiz0Aj6n/Ss5+oLDGGmM8j/pbL1RUL1xDw3bShklhZL1pz71vjfvgrL5RmMb9SYWGd6jdOslng
1Y2Mf9meFJqP+K6SURRwD8QoaPEqCf/+yZbmg77WW0sNTU0kM8DxrhRDeaNvjYrus4xKVv7l3gQk
2C3XBR89x6n8zZ3PttjWhpDdmaKFjuW5U44pSLb6p/1i6MBKsY9121hafYdltAJ6uuoP30PdZU+v
PkxTWNMZ2eXKsNIqWsf+oiQ2gk9vOf9CUV6MVK8X76zy9t8POM6/BcQZeMyTLlU0sXaaBLhdUaPD
Vc5Ck39KUZz+aXSjm6FZNLSVNTKI9L6atNxpGTVNL4TquN89UwahKWj4+gZlNQNjwR8LLPWZ9XIF
bG13hTSGyqqO7OtdVAsG1LyFzGkGl7m7kazf8g5KwWHmWon3CTckWDQdG7G01vlfFqgdomeCmP+a
/ELltYtGv9ubr0KuH6gAe23Hs/vyviwq45fa2EPo67F52/2zy6h82InzoUY6s/jRf7f/rWkuj1qq
sMfpOdBFVmuy44zMLZtwE2soCQVY3U7CggMaIEnIx9PwBH+upeKLI+PHov4dxeqvSnWFbftQc/cs
B2asBQE8ELGIG7rqHdMU26DPeyF0jQwCWmTphqIJA5RdqudTSMywyNDQQOUC6jG0V4irA1nCuVMG
ji/0YmsHI5xOVy4TXBY1L8FypGd2Pl8eTAqKIWr4BIR3P8kHDfupUDRfYyY7ITKioMT4vmBVPXxz
sJ8H/wznzNhm+NWPWj0yqb2dt1MhliCXGfB1o0ixRT0libsS/oHegfqrVU6ROMk0EEC6YYbL50Ts
KpOhEabRkc697BQt4YZEIxBPBibHbDnQ/EI6eVCnhimmxdCGOCZ7cv2x/jW91pXGpTOrbePFQkYG
+RVS2r3JBDFuFRx0BIyt4Rhp36WYwqsI1zQwDHYvq0DdfjN7GTXH9mNCViMH5KV3GVYsW+6ZjMkf
ufy/BxnpEIbrdpiet776zdYfRS3fgwA8VbBGV4U8y0Buqo/liuEX9GatkcTnftBmR7J9iaoLCZui
48HD613q/SfO8nx/+ZD+G5zAuVR5ZgtsWFaTTn8CgaR7KjDXDADjwJhItDF+R3hNFiygq83cgr1d
a29prZtFUvRGVDdtBpJhSigE0dc8AxfnnMkj0SRPNVtcwo0qBvoOO6Es9n5FSon7kPgo1BP9C+Gd
o2QeG8Fa9aJkIUuyH8WpWo/wf11ga5Sv1AxSiaBeE3dyumefRRSfK4rrGViUzLeYM/14pxsZqu/h
t8BwKUfU7PuNRbwiWmy/1mqHQvgRVSTaH+lt3pEbFSBktEYR4eo2aEcdQoIVWp+ykfmGg59dIpaF
0tnigtyQx+zHze2I575oFiEn/ndnyCC4vzUvVDrKsi0YqiSVxwlGvUO1wLLhQ6loRFrpUDrsPNNu
+xIHyMBodsqZwB5S6AsbUI2iqksvAbrHwsuC6k6FhmBuN8U0vnrKfCek9+e7zyGftHRvQO67fiVs
VnraCEWHYtmiCmK02iDZ/GrxWF4tlqflzW/hfiynOzdLwhQi7F4ZsrMvGHdoOcJcp4hnk16GVQ92
fDUWfGnBt2HisDaQjxxn2oT4rohMoSW2GtvTbGQLWpzf4A0XIZVVELgP+cLs1EljxFMdsU/iYfKN
E6ySotD7ard8hl6cQNS1V47aaPuOadN/Gh/k4B3LPqzLxr8QksaD00D+AclXr55a1vXgUBfjbhcT
u51vxZCeK8BtALexzaJ+F3wlLXn+wD8oqiDsfNJldnKyheacOyRz2BtGnXP4lwqnILhIL4YC4Lki
P4rceb7m9F7vNw5u+jwHeKkTvZIkHjt2sEOSxHAy/v1EtEg55gUCuHzS6yUQW8JnW/0Pmr0PBF07
b/J2dXPgG5MVf9qDUaFK1JyTL+Xt8GPWcZMOgZxAbtcsvbvzn1rkX5s1HE9UY00bw7leA9BvjCoH
Uyf/ql1XDdnh9+gYZTmsSNw8lffvDEziG4dKy/e1MsVuK9pXxvWTaZ1Ced96vlf6Ra5Hc8FSyOJK
KV3sTavHK0BEWdzQsinIEo9fYA1hAsBKrumWOoVk2sUX4JzKn13FI0PUG/hEdrsOxj0k4g53naIG
tMdNMkZJwsWZmneQg4eDrHRcdcpVlePrkXx0Rb1sQQrKgm7VDzCGbi22fFP9Rc7hhb4YDSF6pEFU
2/1lvSb99/u7WtudRdfnVUeLfFROiRd5hzGqXlxMyFkl2578iB9DLE92EyWOH1o19JtSrJY32bcg
Q9znjsXESg0pV21TZK72qDoSMU3Y+tVMXJuAcNfHIl18sd7T+4mi33qEN2TxwZsKokXhP2kgIgUz
SpO/JIJwCEc0pL4Z8sR/VPbzT2v/xAEJ36UJmgwmphweGzXrqwbn/FMSr3AqgvMK7tmS1DKVzuFb
b6GJYBTvWKJSqPrPY+PFKd3pBN/1fms13dJGA3eq4y4MkA1bB5Md7uq5dsuDKoxA6ZolCYkUI0aP
Nk8vRJ63nUmpBnZKN+KEsGP/yz0GGY4MjoIAEmXCL0f6YpujnhPgGpXN1cJfK57xEI8G9KT1PkBb
MGdC+CNb1An/L/vFa3mis1S5QbyxkCWsqcnkN3rkeybtZmeem8rZuQqeLhEMyhbfhl3kbnd3VSeL
JyoODgTf3oFGmbnBb91YRueRbeDu2UM8b1uBRm5dbvdpi1/NgAarQcQxnG3Y29h0WV1BKlh/1o0D
ysvw5NKh82CsYm+sMwFe4MACEPQD3oEXOxy3zoFlSoRFaO6E9tDrAOA/NGWYTIT6ITaqwAudqB9w
+Hbz9I0fG5Ml04eTN17W6uF1xkASxsR20boh0CiblJw4AXERKlIDbt4ePsUn4eMwUFvO7f+IsB3l
kX5N4SPifJwONGtII+rjbszJuDGxsNvm59HZki1SjLOcy0i8nQcKe28xLGbzWPsmq9RxcPyZi2R8
qYrAR957pV/tw+uU82T9+awwjlgqfol5rbUOM/zkLlr00VpAZLH9STQpoz4jAM53lPkLSDXZBgQF
An9zvT4ETBUwVpfrfE7CgyoYxu3yAzZUtvr2aGeI/ivPv/xxJixAcaLXL7qBV41GOSb8cuGuBujl
oIQTmvLsDTK4JNygO8iQGWjsbJXJZDcUh/jCFqv08k2a7leTKE/1PQ3KPoWybNvBEszJfzfokv7O
tQ6UKTYl6oScY3jxnqQhH+8yDUic6lvaYq7baGymESa9A5537Ud5gKagXleBHQglTdWIAW2O1l2k
EMe+uXFR8lGnRwFV+Vn/gkFZ4684LNjKlX7ABU9x933k6bdmCj5OPHcwBAarFTUqy5GDMquEPg7D
nusRo+xSvho634Sis6+/Or4RqClcQ0rfH8aTGy/0sNHv9/CUos4NXN8E1vCyHmiOu+9dZSZwqKiQ
fMKfZhrknWRm+YSIQNtLE/8GrNnZN0zn63j2AK7XlTmz/rEjfP8a/Va7fRtU3FYlEKwbhoiT0zYX
cIYZrD/aj0vSR1biFhsK+nIlC1BDxQ0bc9sYXTgV++pW4NqqdtWBijCKNAeaGlHdoJpLs4+9tWei
8x9OaV2vFZsMJvOn1A4wibI+wnJa6shpq22zGRmp7Km6tVfj59ymc/ipZwYvDDchyu1zqGtMFdBN
WIEqGKw6tV/VO43mmiFfVRrdBmXcAkqvdtCYkaxpT/29U33bQ9/8n1kkfgY6fbmSjIQv1rIYQbTG
sZRp8vTQ7N7U225LqSN2cBeO8twNJzStUm1mNV8MzvXQ304n+/Ug8qDIJCKfC77TnSL6B1o5y1Ac
tqw8m//8A3kCON7JlhLhdZ/OIG0lbbHU8KKijrAqofEtfYHi9rRHFwhGEcgRNaYeXxQbGikl/xQ7
iseH9zvQMS/yc9t4noe7BNsapxHWZWXwSWygX+VD06wrs/Y8DS38Z9Nih7IkkXB7XYj8rCDOk51K
PHv/rhIdGxwTwKIWoKXP/UoozVmfTxaUE17qm4Dupep9pems+TcaEPC8Vi9eb9r5uHmNdEuJgO3V
fWs1RAtFCoYEvK2KUaGjiPrRZ/7B7QVgMOhVMJTcBcc+veBqzYMinBYOaKP7ft8R0xvP73DBMGun
o8EEW5/Cr+os9Dt/v2I1EvLkYqx/wNf61EfC8Nn7u1u3Fct6y9+X3BD7GvBuQVMzvILCNXjHrqhQ
724ZA4HgvYtW3dlwx2R7V19K/kYnLX8cVjj70mkvf1Ube8lkMsxBb7nyLqjxAaZQ61+aLa4e0RYm
r9W/YT6Ynvwf+GnHkGMziZQuMxUQIbcsUGlKKlBpJC1kHn5+Q2e0B+TUMws7PoCoddvCvZh3I48R
BzOfOZO22679ENZsdyRethfwxrbLtKOCw7RrKdgrPts9LxGGhYoYR9WwkugOeCShtyvtw/zFucrL
+NCxTHtig+kdrjHzbuv5ci7uiRpRYirl9x3ToMmum/F7W3xtnRhe9DizBZGfuAzv4kQ+Eecq+kTq
z6zrGToS5jEeWj+7tqIdYUVXol7QJZrj5nf1lLXUhIL9fphilIsCfmvC5w+yl0MDC+gaeCZ9pga8
KFDiUKDVFxtPPbTwUSeRLqBBxu60z5UbJ1Xou7D/fey9toISSWny2kdMJ3yl9/Z1d1Bx3jpbSvrv
GerRQ2l+mump7BKjBEtHw1TIT0qwE/IVZ4BapESoKCTdmZ3wa4tzzVWuyq8TdGiyLc/Y6Xx/+PGW
Mpj+V75TMUZH14vjRoi/pMTnF9EBYBdECHR984yLQhd362DfXQv6b9k8mevjjbuQgXGcdXmukwGW
AbfuWBN+YiEpd7xkDiDC5kRSNVb2wtUcsZBxXYUJ/nNbgEuArbQI6fk6WyNvEVylThC+ZzdlRWdX
QhvdhQycnOkxxgbTSmbyRuB62mXyfwLoYiAAL+VJ46Di2nk+YRzlFyzzx9Ze2cUWUCVLGoV6Am+2
QdjfAWtJwh0FyRZ0b0uww464d5kRMunMhHE3DMGvB9PW1nxgMt4fQSV74I6UmlYE8jMtXzKFGgwv
+PZGgpYm66R0A2u0bXz7ftpd3I3NPuHovPlZVCg3u3ppGkM0ZeEpz0qvKZ/BQg6gG+vFRI5vd9AL
I2n8j6jwyLP3uQfmZx5SI7YRUV8oRgIEfnm+McX8IUE7zkKLtSjdE6bhPDdrMZXl98MB9RNHruMJ
aayX7juZixGReGmr+hhQGkdePu2qEFDEujbCuyL4TEQ32OqDpWp9QVpPUZEwWMrq8E/tHeENFWZD
61fPviZzCLISMk0OtmQ3J2LWUMQ6IO5IsgfxdzXGOs1LxSypqSdx37t1+eR5oP/mYurfqXshe++3
r+mpzgdhhx342/JQzDTx4f5I5Cav1+uVdcj7uE+VW1OV2F48AiO5p+lszSLKrG/exMaOdaOQ2oAf
4A8dRlBByWVXc1dpgWly6Kf1xiNeTE0VmZQU5E05f0oNmtxzADH6kgMNH/67BHOXMQwf8U8nScsK
oivppdFlWfQywTohGTsildb3IsN5UvC5pbexqWZrY2bEt58DsV13IIBwI2FIxo2dkjbIHfS+rGik
uc4voPJbyz1jeWCm7YLv8Hlxgg8lfJcmcPRryMPTyRBoxsNPhiT4O6KsgMD5Wq1V6YBD9Z74AMX8
QJCuQ/3FyWHttv6nO0ddFqbx4fN1+tnm5wJdNOSWIr26z+/ls3ZYzJCEUPdU/m578HEmdlXI4iYL
vsU/BXdcUmVospk/wwCVPG+IHD3GWAsaMKoWQO0YaZBEVsZgwEQYosaizsDAq/Cn5AyL3M3Zd1jz
VrR7UDwC4obRgjlirHM7cGVK6i1R9RiYXymf2lY+BovLom6zHfwYRIY4q+sBKnFNsAaTgxyuedIt
lbASpAZg8rHtvU7rGacJkD/2jnG8jSbfTDsu9hcrLai2vv4S/G1NTFpT6IbAO5/1zsibWgJzm57J
55mNH9Eah8gVc/AEHXuMWRvCRkIaPAwGG6GhjD2sv94yJeiL+YomGYbpNwZByizAG0YKrDus9k4v
R2ixB6C4+gQXbXx82owkmTASiT4lW4Ll8p897NZbnwIDiqiLGkhEyHQWv0XlOBNOina2hjszFIfB
E5Olkyn1zcVDt0OQP+JK0dPZP/87SNuE9ArPlja0RO4mlslY1hhI32nrxd7uhA332P81HE//ZtJo
BZD9fwVOwrHW6YQ25pDh5g5mUfIAxd3wPJbNsAzLS70sMySbrfvQitxrq0PXJ1te2Lr/8pGAqfW9
q31karZ+PXYR5REaDkjGIjdvQ5BFcThe8h0z41fOY4xDz5LWwSDGZ+BK0W43OX77vYAFqPlrFPMg
C+AEvGtlybyngGsbpuN8rUmrx7bdJsMfQSe8TthrxRiOaPXh8WShS/oqQRLxLvso4nZKrWHb3BZK
xX3a4zhVBZ1QNMs8JL/QdSnLS+XBjjLXj98lp8l+D88eU28Bgay0gpsVHkOropF6Sm8QxJU5PkCi
6LnFcJ7YrHB310t/vxSLnoLIJhOc80JmlhnT/32/tORC4QFjKXB++6sXhh5w2OqG15faHHkTGGFr
P4qiS/JoDbaCnGfZ8xvcJLAcsDvySjZ33+q6dQB9cHj0PRZ3VUv+jZlpMTHx3oHTDn7hApHvLQ4q
Nuz2GNgojKWnJzx9o4rkOIYDvQOAkOGOcDvTRUCeGn8v/GkxVmi67WIiHzoKnZDRAg4mIwO7MTdA
p62jaHcXjOSINnHU7ubyc45tUcg8bH7o6j8tRhQDHeNWI9b/PQ5V81zSORvG6rbT118SkO5XQUU4
9Ffxo92nqkBXzFohVdFs9Hor36bLw8KSjyfJBBZwz5pszEUCaoip6yylWKr81DWqkIkmW6Kv8GOU
oNvt2xNO6XejbS+OE8Bd+Vq4buo3SydoUkuCNAxPwCE18RDkOIRbYO9URqgx941dwGtaQbDD2Mbl
tmKwbvHK+2pF9HlxV7OCrAsBLlRrpJ24kc709iZAPxP+crBwG4gvjHZEuTpXuSMf1jYCtlsgCrUT
8aZRobkWs+T57rkaHoch5b+kQWqVRR1vMnpV7o5bguXaOlhvFRV4PcL54q459O4lgkiWfQ5grp0h
vq4q2dFrqUNTnZ6+QuHjhUBp4JVAXOXUkmUWsBqjIjpju3G/6RAnl0Hha1aKFvC4Txsu7FY9cfeV
PPQiN7M7RcAH22g5mVSYWWGXBtLS1/IlqW47fS8zws2dPRelfzhX4yxX6P9U9CtkeyD9WT6qukQZ
B1OGd7IdNdOjL3MckP42QqgKp5H2HzrI93sfU+oo8UIEK4y8fTOpr5GC8oRAbuy7/Hh3nqVKUFYx
xisTe1IUDxqYEBLMUxRuSjf616800ZdS++Y66/risayFeHytzwiMCpYbLzBFaFCWxvC+4wFdcO5u
13qx7wz2AT9ITVuHM+CSUUxQvpEYFNcKlT09NdEjm/qT4IskJjL5R+pDXs+iBo0TnLeQqA57bPs2
17aieEcPjVeyF/J5/dgLLMFkVP80Bbe+i1rIZSJLpB5VIWXY4OTEtch5s+eoTAB63mwIENb6pifE
YAVy4a6/ud22luw2upRatOjToxB3j3+X4l9VxoQ78ADyJOQrrKC0wwwiy5HVV+/Wlr1fcs211SQY
oGpWQBfmoDLqTEiFOd158VwMSyGf4eYsGXSGFaxgtxhhMK1nD7nE7ZFHh2aTNAvVi+ktkWZel9yk
NTuWRYGYA54ya8G6BNum56bONajSmxo0PXHJkS8+/x0z+rCUbld1QbNZxDzQdf5cxrItK2pgsS8a
yfcC2y8S78vUcy8ih/wtt96t8HU/SEwGfqS1+W+AhjKnbI092qDUBYXk+0rvASkzLtnWDYgF1XvF
u7KxACdw9S9UQ1rkHHyyyMK723lQR22WgeirSg3TmAT7WRWaxoTSJHBB3yvpA95LTP0mUa167RUI
NBO7N6MvUfzvyUeZ7IwRK5FeGiJTnpiDJeMI8+sVEyTYcKmtxB9mxT+aSJieN+VMlkXbqbGTrggd
rxdRyJQIvR6zD+nuwh4bFU/bo0c7Fzn6EBBT4GuJyj74V2fQltpTi9KZ8W1NvGZy8BLplZ2BSMlk
VR5ZAk2jh0y+8BISBe+Ny9iy815dJ3AXUCDCnzJ2/4l3eBQ57FaZTnU1X6iYWxLs0c1PkwNbzSQz
Rl6TZe9PrAbR01IfaOLDhDL4yhowygRsNTA/NLVyALt0y8hrfV29nZm/KxK18bpmB9uDRSHFjI0t
MoU9/CmFlC8WG0q2yHbYEkpxYw0SMySsVYAFgrww57FmZiFfuGng46kQIL+55RLRLiT02B3nc3/O
md2rX6JBVRyGFgyCEKEIf2Un+fUReF/4Gg4KXpHvvf7HroQoS9fxmLPGsmygDgwACBTo2phWtRQ0
raZ+FtLLFPbldgAyaNiOc0blVsf/dH3Drcoe2QlwIzwX2INv76uQtXxr0yboTHvR96oZRJ/g/1us
ymMcOzvuIXbYlhWv4dAXhpFvV7Z+4crrW87HHTCC3ieIWwi4vPMygN+JiNHmsG9ATOZV7uuodwGA
FJKFKjVuADvgwC/NMwI8aqzR2AFsSUgkSlJfwedy02SIwfGp8Z1+SsRn/U9ohdBbfAakVZ6dNSx8
NzvOhnnvbzDzVvjdLVb9IHE1DFGbqnKR42oT54xbPe9/ogyMQq17DqztaPDo1VHGofQClW3noe5J
h2jrog/FtlP3lxSP1JFhTisUFlbC22de4vtNKuTp8snUNTL8aYG6M75ojrZ56pl0dA9guL9l/SSx
vvAgsBgDVmGWvbLaiF1Sh7mfhxzwyNMd3IDUXh5dxiJKnUJovS7LbU24zb1NBHYIrnZE6/rnW1pQ
eq6HFJXwcw1k+8FhvecuRi91k4G1B97nMBPb9KQT5AJgcPeRRiEhk8y7MoXysrKYoeNbdR6ItWLj
Vw+LzKQWYevMEW/ml8DDmkCvjL1+qOdimeIDDZiZldMzHsZS/uZrEhD2/laXskFy1MJudXRDlOdi
Gp5yDswvM6oPgxU3HEJoLSWzp0IGnoJvHmzojAptZAC5uHdhf8jXTSI1KyesBCn7uT/2wXG/ZgUY
kjg7objWtJDe3mm0yXEprrf0XtPhJm0H/FtUpExFfJU1iAcG8gtWEoyxtiNOC6kb2iOPg2aLT4aP
3inLec2VG8Va/FDyY7nQmUnaTVqh6lFDr6fDm8DJs6xjTjAAQtwduuX2Bmmkid+MFCtCjjF613mV
97468JOAPtzxnte+wcODQwhZbLaHhpnwl5EYGLaCDxcF9fq1QrOht3VSGdT7gcFj5oKvaLXZOgrz
1wYPLv3RjezJYxne59WbE86cqDtih/1kwSN0lQda2nsegW2x/ZQGrcp2XV2S78fHn871dUZOLDTv
xLDw/W3E/WP+0a+DT2aJiLz69vaYCg6AL9i+iORR+0u3Hv1zF/uNyhHsT5qf+KKJz7M03dqJqWej
CqgMm+c+2U4CzOTlL1k3g6umfQMSoD39QBbaRGZn2VjB9P7AGXmKqp+G1khjlovdjdxd94BwBYSc
lVNKaOCChXgHZmTAYCTj1Bs18ADeR5J2SgbGbMTM/8DNvIvb+GZxd2lDi7dmJmI/wzefCVuzI5T5
l49RCm3S2Z8bEAxM7YR30485k+VTBtovxJ5H3TbSonYw+S7iyn5Hb+SO7+njU5D26hl+K0YSuxja
/Nw5N7ZE4sbltm7Wh7wtFpVf+hm3u+2C01WCQR1gH94lNRZkgV2UYwZahmW1RbiwlcjsiHynX9XG
9fSTLZ1hmaoGAQtggKHV32Fpb7+jsBn9pqPKlSVgV+OSHhgBc/TvLAYOqKp/QIbauctr8lgrR78b
pcob1GwI4moTWSAc9JerBg5qmc4FgYvI9GRDKAyloL/FrhABNoUWEIYaCRwkbPImdk948sGGfl4n
tRaDzD8NsIvWtW0ijIY5kWOB+SQYbdi5WCpaSpivgsDV7dYP39OogjrqCaC/vy6BKTNF/B3uSDfx
N7q8qUHCRWhT1/1G4gQwOEanToHhPMWetUFEJjPMXRjsFU2nxn1DURwtshIn/gbTPdZhT0acZLUt
EeCJZvFIlqq2mpJwseDGvAIuzfKUNygIVkz7c6IyJLHZz+wDSXaiIu7N4qdtgjXyjPV/fLNS7v/7
a7WqJhJWoqZ25XJ8Wh+81VeYEzbrkbIA/zazOzA3lXh+AEJbGwi1+lIo2BN2Op2Bh5pPGxQKk38M
HAG8MIg3+dMYQttFhTeWuUynLgAB5wyWX7gpeEDVgOtu4XU/XwjhVafwTYBrGUcdrTSxxWFLaaUv
eM46enERfiCN8eqdkn46Fbl2OvpAPtVm30O0TywrTuEvURNmBvuqNYvmjTcxqZ5iJJ6d/zyvZFx/
KIaMkYG5NtV37bYHwg1QNtNhKpeCoqHVBOy7pm4z3coRW9tB1OnfemYJBDnl4rXmXlUKL8zYUm13
PtkJFEiYG/WHehEgQ/YSGf7AFg+fM3PNBll4pPSrJs7rVDtLEqSyr9yo5R/KsSurN9/nK7KpyWJ0
dJok8tKIhdwQa5MEQaamXnymvrEVPJnHSIssw749D9HXuxQ08Su6qKcNRyaxR1hEUkI/tQOsFLqQ
aVTJKrMV6vC0LgVgIBfMvFrH58mbsxdO7ZKR2xRePWoC6Y2nwvGstQyS44GiuYq1B9RWura8eNSo
76z3YQ8JJwRVONSpZxA+cDWaXj/wAByt/HJfdZTMLkXA9zodMLWv3U9OPpokvUZervxcEZnwtG3e
hOi2Ba+pSyUzutC+AE2QuyOcJPP1zDGNxPJrXJalPR9WXG1o2BsX5PN31dnxgJXCgdu2of1COBjZ
soVWeNRwSO5iZFM5kB0i/pFr74LwhY7bzqi/u5n7fpl+OGlJQZwzwaYwD+RDkGiVOajPf+x8ylih
dUvcXr4ICHqSjOeXWc8fcVTTtC8FhQP+krFphEfSCqbV0BlvyOyNImR3Ru9oJGbYLUHJ1NdHBzPG
LPfNPvVBGc90R1HhTR9K3q7LD1IEWHp1JlRaNUq7Y2pygYK/bRJjG1/eZ9rqjjH0wUUV4fZkSDzF
pZilu7KGK1aQKqCGrbRB/3x4am4Qt/yL+mg9RpuTSZSVwQX2lhAPv5FI+1KZ5smmZCBotF6AOBId
lqwiA7qA+rws99HLKQalnQVL+lkAEf4qnWoTBJtwX1vPOYjQGeuEg56tr/37ViJZpwkL0HWL8vAH
cpJcUm67bj+OPiYGERPrHJEHal0IjomNB41zo7q+FcImy1qApiitRlg8omJ0c+WXq2JGmwdypt7r
7LNRztGu1mHbiw63iI7j4HS9/pA9iEWjPWk4Ds4zCkugDsiuDPzhtxL1vnJfZj3Nn4iN+hwGsbx0
brL1QRBbMEoXuPFsw2TGVfJ7pE4jj0PKzYFUCtJWFI+yo2ySiZBcN+LL6nIQvoBmU+mqcOJP04Dh
iUFAJPrFC9U5RzUQrN6UL91w/xcv6g4Wxl5mgDLE8/EO2+xIB+Ial3PBczI5BZAZ891PKt7Fl3M1
MRt9VWqVK/bn5eiSpfa7T5hzwXPw37ZB5nb8TD0ITs6IX4t7SAuHXZazf2MZMyJj+2Y9wq4VSNkC
xPX31zezKtnA8Naz8GYkdAEC29hW5W8Me/GK0HaVdokJxMUgz6/mO61v30iRcZn17XFRPr2ynj71
DUtCj+em6wmGn6ksyz3J4gNyWdNdh9wAU5Z4L02OhHMpukDb/0ktBiXouEgTW8eX4RBtF2OVF7rs
EmPNKIYdQhxntIffpgjEN+zkumVEYA87RcieN4akGwDHfupM/g2CpvkSHvA6HeG8moWXdJshUjNK
ROnIw29sAVJ3CXglacoG8sBI1a8jnJ6Ity/46vZCr9JBL81fHQ0jJZAkjieV0yhS8MxpzMtQL+wn
/l8dMDxN8Y6gkV1MsqKj30JoLxbrVidjgkR/JIdh4XBu3WbIfuTBWONW5Wiku6yLA2JjNABXwXzK
EutE0/W1qrRN5qfMvlsLAq+nLZbV9Ac2u9ABmAuQ7j5WJcR8K5om6VaBYpPH6GWVthxp5X6X5wwe
9qg9QjUjBtTL1xTBp97t2olNB1sRBYB3ZmfVeeEU/W3RAir88C8klxlRLR4xhciW8ch/QSPiNUmm
OB7utVeusLmryMFzNXP0tRajKMdAJbRt40dRoHCOjymUYw0iXo1KVQSfrwijeIjPBzBl6AvFNH+r
6OIYKu1tjaYAU7P5AAyz6N8Ns/2NuIBPxVYdBKxtOY1iJ/1QugX1HUewH1u5zDGICQzZyjT1KHOy
yhlxFT7a8suwWRs0YsKvIFedUXw8Seawl97Wvbt4mHW32EqYAMOvGviq3hzfSOO4eUaCP1P+f7PB
J3LShKksBHQm6aXzdiHtLyFAPqsTvWgfE1fKf9dxe2oJ2Ln7qqAmY3h/cXfPkqXnfbNAnmK2Ac/N
eAdwOCxqLTDaoxvUb+mrMiYRfCReixFGhtRcBVLTMu1WFbAZh0c8wL5kyckibsi/Fgjwal+M272L
s1D3ljbfedV850Apf5s8s+/zMc+MKMmrIgmBN26iOdWPBYzGZWf6EiG0081oe4maoLvrgtZ1QvYO
iDimB8D6LCoLJFgEoXOOqu0uG/etdA7fTPQKBPAp0HGhRYU5QVp754SKvnIBVQx/wgHp+bkA7yXl
g80ueoe9RHw1B5fu3GnBzOEP0F2CH8fp9f/nnJWIYagK4pDwWT9kBKDlx2nb78omk8kRZO4x8Yhu
NToivHZHxsrVFMvSOX+oheG1+WxE+QrMbbmhcUFTeJRARMDAdOFZake0EYK+YvZRUB21HhzhAj+L
JIVt+WaxGm3u1szNAoUmb8kBU94ToljJKuz872g1HJ5ed02Y4s6C2i+BJ6PgpLzX16M6NMjALFI3
YdBvkkak7eN2Lg6Kq1FdJNfUZM4YHEDDUdRFs69Ps+GFI25HH0U85di5OYR6zVIAK8XQE3bBclKJ
v7NlCbMsXB3UegVSd/+qAfiDEnhbQOiz+eIZlQb1vlMJmwPzGPwlZhR1EM8xHHoN1V22vxuz8ncu
m4Cq5upiT7PdxsbNAZrkctxyo1y2jzOAJxn71664IwXYK3zNKgituxNmZkUnhdLJTbw1rPNWtUYv
UTjWk6V5X5tofgRT7zX/XUApu5QfByJublhg06allh6FRjEoKjrEpndM5+c9iwJv/oKZLskEKNUX
T6DvhFVcxUIU77EkKriw0IHj4smghjTJjK9utooOvTACRbIDw0xd1Nhhf3H3XW143Rd13//JIylw
em6jkke3pLu7VGXUrm5CYXlYK3HYcroS8E2p4gw0vSB0Z7YealGHAkOFXdT2Q2yLKXT2TL14Nah0
79ARFYZJAWIU5+QtyYH2UsCJiJOuKReVK/tPiIGN2+xEiW8X0rUWSdS6eyfdBRGQ5r1Zcvjdx8tn
leGOVrGXN2Rr8xTyseaSHcUBU0IvO0rblFY2FkE6+QyfJXozRHhHOMDaXbEEm5MsuVsY0m0Uc51t
8wwdoISzV62YhVSLyUZX78XW7y8aiY+1nBcl34G2VQjS55iPz2CCDoqaj884kM310biSp3OGAfTO
pEMxfFvVF7PrOWH6erdfEZZ68BwYXJhfz8DAqJ20XnsHAEVlelRzpYxjj3ZPbOkZpocI7Fz46EBF
PsY0k3V5NNtX8tmPHs9eclVF5MaMNzkB8wacMcjksp4TsqbM695WRAlBo643f2yFsEl8hSFWwT4T
en0JM4z74FNlXoJhC93rWVkiZq3bi5KjW+CpTSXrfWXf3wf8J3XUBhF0aD/FIuqtgQ4A+yAN4GGD
0Sf7KKus0UGIhqQHZa7zXGmPlEXNixG6DR412/KkP9A1F3+p33gSU8myPt8zWifC+j3PYQkJalN+
8nAPymZi7dgtTc0sJcz4oQITcZgxzZpTzTcD/Wu9e+oHEg4UWVQlx/e3NR3Mk2PS73dAJfscIGto
Vdba0JEXgIryPV2rfUrMlL2Py7S9x4b/RyeTxFAvIl2fIHkvj8RqyCpE/csIQsKZP+TET45bfeG0
voLVzJwTwwlQpxktX44+n+c+NLpDOHCokXrHsoEIsMvtD5iyDhOhKz+pd7GyybcKzcnDAhBCfjEy
0epKl9zxslJK1340QAE1Cn0AIgZ2bJHhJBTV3sjA7sU58y7JqOVL5lvkhkc3xs4isBr6ofTp68yX
iwd80IMvzxzIvnVEz7Fn3/6dBh5UOKthCVMiEZQncCgr+8h0ocoKa8jG8gmkY8m7QxRfEH87ynYI
85yAvI4s/vC6Zd5QSsgpXImXhwEHp48/ITR2UHr9RFCWhQZ89Uk7uZwCQ3B92nUYbuCUtpK8C+Ee
hm/BKbdmqd3cwk/3IM6ed2Z1NkQRC4AUaqk+vITt3yslh5jxE+dd0LGQCSLGaz9afXTDwbNcQN1W
LSbdQJ7OVQOVYLO77ZrnoIpPhnHm04SEXal79UZgbZsrMaALNVaHNPNGqF77zBD3t1hKthIg9kVy
Ks3RkfMfQ0q0LJ4LOpxNG9wuM55ztHp9stc5TPZ+zZEdjWV5xW8Cs5TQaIH+/iEyTNIfkyUiCiwK
NvIV/NaM8tK1T6Iay42e87B/NFzrWNU+lAzfa5K5oX0BKZ54Vl6KKvH6SEE2sJfOtyi8DI1mp1SC
O8X5Xc3fNPIr7s5wlJV6SOK5oZjKPfjp86ApQgJ1VifENnrq7F7WkR2cNDD6pHItmpi5TwX/CCbX
oTCf84U/X2AWRu24edZ1K+ivc9LPSxqDPbCc4bOG26KMewxslskHUrRCc/8Sy3HBhp2Vp+NHNwe2
h8WtNNjo62x12Lwa0xJRcTKXNKoT4+3lu6nDqNbZE77zeH+UXTt2DWU1OzbVAV4LGS9Nb6xzS1St
8HeKcW43Qf3aO3SMFsTphWgE8q76ror+YzsftWLTPDLoTjHOgKLod5WtBZWl3StDKUx7kbDLAp6x
T2ojnISh2rPu+uOcM1eIsYpvAwnsLC18Vc7QOEuj5nv/OzxK54go8fQaQItQ6zbOfc7m7yUEClhw
boM4ill70tvazV9ukHlCl+QP9aPpaRU/zK4Svxj4/oo1aFK+MCOwQb4Nj1ovN3NoxwJlk0/pfxjX
d9CIWLgcczeqT63rF0WDZjp7c5kTnQCAI1KVMOPG05VltedNtf6uu6ElpJj7pRg1/dZqPGTTlQZ0
xy8vKJS9En//cT8HtooF2jNAO6qsdquiDNxmF+LFo+I5tcbpbPWdy+TqGkJvUcE+qrZSK29ena7Q
jU0E4Kw2kaxdzzpzFd8Kd+16t+vh4gg1dgnG/6d8DfVzmmtyyE9bxof9MxqQOZjIs5JQDK04uUZB
FaCDkC9gRY41XlpjevsQuhXuYAryFyUeKbqf/FBXrosQaLOPrPgimn9A5anw2VNP8YIlGLsq
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
