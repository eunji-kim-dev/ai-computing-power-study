// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 23:22:15 2026
// Host        : PC-Home running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/verilog/20260103/03_sine_wave/vivado/03_sine_wave.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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
