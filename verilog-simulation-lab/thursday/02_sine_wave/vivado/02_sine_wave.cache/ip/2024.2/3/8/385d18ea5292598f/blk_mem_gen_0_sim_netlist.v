// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 22:51:32 2026
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
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
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
