module ha(x,y,sum,cout);
input x,y;
output sum,cout;

assign sum = x ^ y ;
assign cout = x&y ;
endmodule 