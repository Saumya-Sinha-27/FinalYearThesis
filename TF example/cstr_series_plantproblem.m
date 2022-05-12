t0=0;T=100;a=3;m=a*10;h=(T-t0)/m;t=[t0:h:T];
I=ones(1,length(t));X0=0.72;Y0=0.72;Z0=324.5;C001=I;



x0=zeros(1,3*(m+1));
x = fsolve(@cstr_series_programFun,x0);
x1=[(x(1:m+1))]
x2=x(m+2:2*(m+1))
x3=x(2*(m+1)+1:3*(m+1))
exact1=x(:,1);exact2=x(:,2);exact3=x(:,3);
e1=abs(exact1'-x1);e2=abs(exact2'-x2);e3=abs(exact3'-x3);
for i=0:10
    b=a*i+1;e11(i+1)=e1(b);e22(i+1)=e2(b);e33(i+1)=e3(b);
end
e11=e11';e22=e22';e33=e33';norminf1=norm(e1,inf);norminf2=norm(e2,inf);
norminf34=norm(e3,inf);normrms1=norm(e1,2);normrms2=norm(e2,2);
normrms3=norm(e3,2);

plot(t, x1)
hold on
plot(t, x2)
hold on
plot(t, x3)
hold on

[t,y] = ode45(@cstr,[0, 100],[0; 0; 0]);

plot(t,y(:,1),'-o',t,y(:,2),'-o',t,y(:,3),'-o')
% title('Solution of van der Pol Equation (\mu = 1) with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1','y_2','y_3')

function dydt = cstr(t,y) 
dydt = [1-1.1*y(1);
    2*y(1)-0.6*y(2);
    4*y(2)-0.35*y(3)];    
end



