module bentkung(a,b,cin,s,cout);
input[31:0] a,b;
input cin;
output[31:0] s;
output cout;
wire [32:0] c;
wire[31:0] p1,g1;
wire[15:0] p2,g2;
wire[7:0] p3,g3;
wire[3:0] p4,g4;
wire[1:0] p5,g5;
wire [0:0]p6,g6;
assign c[0]=cin;
genvar i;
generate
for(i=0;i<=31;i=i+1)
begin: a1
assign p1[i]=a[i] ^ b[i];
assign g1[i]=a[i] & b[i];

end
endgenerate

generate
for(i=0;i<=15;i=i+1)
begin : a2
assign p2[i]= p1[2*i+1] & p1[2*i];
assign g2[i]= g1[2*i+1]| (p1[2*i+1] & g1[2*i]);
end
endgenerate

generate
for(i=0;i<=7;i=i+1)
begin: a3
assign p3[i]= p2[2*i+1] & p2[2*i];
assign g3[i]=g2[2*i+1]| (p2[2*i+1] & g2[2*i]);
end
endgenerate

generate
for(i=0;i<=3;i=i+1)
begin: a4
assign p4[i]=p3[2*i+1] & p3[2*i];
assign g4[i]=g3[2*i+1] |  (p3[2*i+1] & g3[2*i]);
end
endgenerate

generate
for(i=0;i<=1;i=i+1)
begin: a5
assign p5[i]=p4[2*i+1] & p4[2*i];
assign g5[i]=g4[2*i+1] |  (p4[2*i+1] & g4[2*i]);
end
endgenerate

generate
for(i=0;i<=0;i=i+1)
begin: a6
assign p6[i]=p5[2*i+1] & p5[2*i];
assign g6[i]=g5[2*i+1] |  (p5[2*i+1] & g5[2*i]);
end
endgenerate

assign c[1]= g1[0] | ( p1[0] & c[0]);
assign c[2]= g2[0] | ( p2[0] & c[0]);
assign c[4]= g3[0] | ( p3[0] & c[0]);
assign c[8]= g4[0] | ( p4[0] & c[0]);
assign c[16]= g5[0] | ( p5[0] & c[0]);
assign c[32]= g6[0] | ( p6[0] & c[0]);

assign c[3]=g1[2] | (p1[2] & c[2]);
assign c[5]= g1[4] | ( p1[4] & c[4]);
assign c[6]= g2[2] | ( p2[2] & c[4]);
assign c[9]= g1[8] | ( p1[8] & c[8]);
assign c[10]= g2[4] | ( p2[4] & c[8]);
assign c[12]= g3[2] | ( p3[2] & c[8]);


assign c[13]= g1[12] | ( p1[12] & c[12]);
assign c[7]= g1[6] | ( p1[6] & c[6]);
assign c[11]= g1[10] | ( p1[10] & c[10]);
assign c[14]= g2[6] | ( p2[6] & c[12]);


assign c[15]= g1[14] | ( p1[14] & c[14]);
assign c[17]= g1[16] | ( p1[16] & c[16]);
assign c[18]= g2[8] | ( p2[8] & c[16]);
assign c[20]= g3[4] | ( p3[4] & c[16]);

assign c[19]= g1[18] | ( p1[18] & c[18]);
assign c[21]= g1[20] | ( p1[20] & c[20]);
assign c[22]= g2[10] | ( p2[10] & c[20]);
assign c[24]= g3[5] | ( p3[5] & c[20]);

assign c[23]= g1[22] | ( p1[22] & c[22]);
assign c[25]= g1[24] | ( p1[24] & c[24]);
assign c[26]= g2[12] | ( p2[12] & c[24]);
assign c[28]= g3[6] | ( p3[6] & c[24]);

assign c[27]= g1[26] | ( p1[26] & c[26]);
assign c[29]= g1[28] | ( p1[28] & c[28]);
assign c[30]= g2[14] | ( p2[14] & c[28]);

assign c[31]= g1[30] | ( p1[30] & c[30]);

generate
for(i=0;i<=31;i=i+1)
begin: a9
assign s[i]= p1[i] ^ c[i];
end
endgenerate


assign  cout=c[32];


endmodule