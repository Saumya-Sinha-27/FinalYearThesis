function f=backsteppingControlTF(x)
t0=0;T=8;a=3;m=a*10;h=(T-t0)/m;t=[t0:h:T];
I=ones(1,length(t));x0=0.72;y0=0.72;z0=324.5;C001=I;

tic
C01=x0*C001(1:end-1);
D01=x0*C001(2:end);
C02=y0*C001(1:end-1);
D02=y0*C001(2:end);
C03=z0*C001(1:end-1);
D03=z0*C001(2:end);

% [P1, P2]=T1F1(t0,T,m,1)
% [P3, P4]=T1F2(t0,T,m,1)

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
for j1=2*length(t)+1:1:3*length(t)
    C13(j1-2*(length(t)))=x(j1);
end
C3=C13(1:end-1);
D3=C13(2:end);
X=C11
Y=C12
Z=C13


CCC1=3*(X-0.659*I);
CC1=CCC1(1:end-1);
DD1=CCC1(2:end);
CCC2=.664./(X+.1)-0.664.*Y./(X+.1)-Y.*Z;
CC2=CCC2(1:end-1);
DD2=CCC2(2:end);
CCC3=Y.*(Y-0.877)-5.*(Z);
CC3=CCC3(1:end-1);DD3=CCC3(2:end);

f1=[C01+(CC1*P1+DD1*P3)-C1];f2=[D01+(CC1*P2+DD1*P4)-D1];
f3=[C02+(CC2*P1+DD2*P3)-C2];f4=[D02+(CC2*P2+DD2*P4)-D2];
f5=[C03+(CC3*P1+DD3*P3)-C3];f6=[D03+(CC3*P2+DD3*P4)-D3];
f=[f1;f2;f3;f4;f5;f6]; 

toc
% TF solution
x1=[(x(1:m+1))];x2=x(m+2:2*(m+1));x3=x(2*(m+1)+1:3*(m+1));
end
 