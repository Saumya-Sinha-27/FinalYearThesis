% function dydt = cstr(t,y) 
% dydt = @(t, y)[3*(y(1)+0.659); 0.664/y(1) - 0.664*y(2)/y(1) - y(2)*y(3); (0.877/(y(2)^2)-0.664/(y(1)*(y(2)*y(2))))*(0.664/y(1) - 0.664*y(2)/y(1) - y(2)*y(3)) + y(2)*(y(2)-0.877) - 5*(y(3)-(1/y(2))*(0.664/y(1) - 0.664*y(2)/y(1) +y(2) - 0.877))];    

% [T,Y] = ode45(f1,[0 50],zeros(3,1))


% options = odeset('RelTol',1e-2,'AbsTol',[1e-2 1e-2 1e-2]);
% [T,Y] = ode45(@cstr,[0 12],[0 1 1],options);
[t,y] = ode45(@cstr,[0, 100],[0; 0; 0]);

plot(t,y(:,1),'-o',t,y(:,2),'-o',t,y(:,3),'-')
% title('Solution of van der Pol Equation (\mu = 1) with ODE45');
xlabel('Time t');
ylabel('Solution y');
legend('y_1','y_2','y_3')

function dydt = cstr(t,y) 
dydt = [1-1.1*y(1);
    2*y(1)-0.6*y(2);
    4*y(2)-0.35*y(3)];    
end