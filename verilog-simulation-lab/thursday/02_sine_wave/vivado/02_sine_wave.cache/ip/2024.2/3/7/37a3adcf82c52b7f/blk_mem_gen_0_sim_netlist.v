// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sat Jan  3 20:02:30 2026
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
