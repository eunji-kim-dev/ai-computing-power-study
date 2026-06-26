// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 22:51:32 2026
// Host        : PC-Home running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/verilog/20260103/02_sine_wave/vivado/02_sine_wave.gen/sources_1/ip/blk_mem_gen_0_1/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
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
  blk_mem_gen_0_blk_mem_gen_v8_4_9 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19760)
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
