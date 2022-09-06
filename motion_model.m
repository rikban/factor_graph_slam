%% Motion model for roomba
close all;
diameter = 1; % meters
theta_0 = 0; % radians

% t = (0:9);

v_r = 2; %sin(t);
v_l = 3; %cos(t);
v_c = 0.5*(v_r+v_l);


omega = ((v_r - v_l)./diameter);

% theta_dot = (v_r - v_l)./diameter;
% x_dot = v_c.*cos(theta);
% y_dot = v_c.*sin(theta);

f = @(t,z) [omega;
     v_c*cos(z(1));
     v_c*sin(z(1))];

[t, za] = ode45(f,[0 15],[0 0 0]); 


% [~, x] = ode45(@(t,x) x_dot, [0 9], zeros(10,1));
% [~, y] = ode45(@(t,y) y_dot, [0 9], zeros(10,1));

figure(1);
plot(t,za(:,1)); hold on;
plot(t,za(:,2)); hold on;
plot(t,za(:,3));
xlabel("t");
ylabel("x (m)");
legend("\theta", "x", "y");

figure(2);
plot3(za(:,2),za(:,3),za(:,1))
grid on
title('Solution curve')

