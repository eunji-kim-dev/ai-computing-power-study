// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 20:02:30 2026
// Host        : PC-Home running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/verilog/20260103/02_sine_wave/vivado/02_sine_wave.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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
