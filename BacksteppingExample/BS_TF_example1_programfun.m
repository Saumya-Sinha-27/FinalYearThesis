function f=BS_TF_example1_programfun(x)
t0=0;T=8;a=3;m=a*10;h=(T-t0)/m;t=[t0:h:T];
I=ones(1,length(t));x0=0.5;y0=0.5;z0=0;C001=I;

tic
C01=x0*C001(1:end-1);
D01=x0*C001(2:end);
C02=y0*C001(1:end-1);
D02=y0*C001(2:end);
C03=z0*C001(1:end-1);
D03=z0*C001(2:end);



P1=eye(m, m);
for i=1:m
    for j=i+1:m
        P1(i,j)=1;
    end
end

P3=P1

P2=zeros(m,m);
for i=1:m
    for j=i+1:m
        P2(i,j)=1;
    end
end

P4=P2


for i=1:1:length(t)
    C11(i)=x(i);
end
C1=C11(1:end-1);
D1=C11(2:end);
for j=length(t)+1:1:2*length(t)
    C12(j-(length(t)))=x(j);
end
C2=C12(1:end-1);D2=C12(2:end);

X=C11
Y=C12



CCC1=-X+Y;
CC1=CCC1(1:end-1);
DD1=CCC1(2:end);
CCC2=-X-Y;
CC2=CCC2(1:end-1);
DD2=CCC2(2:end);


f1=[C01+(CC1*P1+DD1*P3)-C1];f2=[D01+(CC1*P2+DD1*P4)-D1];
f3=[C02+(CC2*P1+DD2*P3)-C2];f4=[D02+(CC2*P2+DD2*P4)-D2];
% f5=[C03+(CC3*P1+DD3*P3)-C3];f6=[D03+(CC3*P2+DD3*P4)-D3];
f=[f1;f2;f3;f4]; 

toc
% TF solution
x1=[(x(1:m+1))];x2=x(m+2:2*(m+1));
end