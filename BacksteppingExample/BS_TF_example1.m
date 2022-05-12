t0=0;T=8;a=3;m=a*10;h=(T-t0)/m;t=[t0:h:T];
I=ones(1,length(t));X0=0.5;Y0=0.5;Z0=0;C001=I;



x0=zeros(1,2*(m+1));
x = fsolve(@BS_TF_example1_programfun,x0);
x1=[(x(1:m+1))]
x2=x(m+2:2*(m+1))
% x3=x(2*(m+1)+1:3*(m+1))
exact1=x(:,1);exact2=x(:,2);
e1=abs(exact1'-x1);e2=abs(exact2'-x2);
for i=0:10
    b=a*i+1;e11(i+1)=e1(b);e22(i+1)=e2(b);
end
e11=e11';e22=e22';norminf1=norm(e1,inf);norminf2=norm(e2,inf);
normrms1=norm(e1,2);normrms2=norm(e2,2);


plot(t, x1)
hold on
plot(t, x2-2*x1)
hold on
[t,y] = ode45(@cstr,[0 8],[0.5; 0.5]);

plot(t,y(:,1),'-',t,y(:,2)-2*y(:,1),'-')
% title('Solution of van der Pol Equation (\mu = 1) with ODE45');
xlabel('Time t');
ylabel('Solution x');
legend('x_1 TF','x_2 TF','x_1 ODE45','x_2 ODE45')

function dydt = cstr(t,y) 
dydt = [-y(1) + y(2);
    -y(1) - y(2)];    
end
