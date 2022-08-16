module tb_dadda;
reg [15:0] a,b;
wire [31:0] result;
reg [31:0] glden_ref;
daddamul dut(a,b,result);
integer seed,i;
integer flag=0;
initial 
begin

for(i=0;i<=15;i=i+1)
begin
a=$random;
b=$random;
glden_ref=a*b;
$monitor("At time %d , a is %d , b is %d, result is %d ",$time,a,b,result);
#5 if(glden_ref!=result) 
		flag=flag+1;
#5;
end


end
endmodule 




