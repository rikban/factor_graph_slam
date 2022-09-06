% Unit testing
%% Both wheels same speed
close all;
clear all;
v_r = 2;
v_l = 2;
ic = [pi/2,0,0];

computeTrajectory(v_r, v_l, ic);
% Ask about ASSERT_EQ equivalent

%% Wheels opposed
close all;
clear all;
v_r = -2;
v_l = 2;
ic = [0,0,0];

computeTrajectory(v_r, v_l, ic);
%% Right wheel faster
close all;
clear all;
v_r = 5;
v_l = 2;
ic = [0,0,0];

computeTrajectory(v_r, v_l, ic);

%% Motion model for roomba

function [] = computeTrajectory(v_r,v_l, ic)
    diameter = 1; % meters
    % theta_0 = 0; % radians
    
    v_c = 0.5*(v_r+v_l);
    
    
    omega = ((v_r - v_l)./diameter);
    
    f = @(t,z) [omega;
         v_c*cos(z(1));
         v_c*sin(z(1))];
    
    [t, za] = ode45(f,0:0.1:5, ic); 
    
    figure(1);
    plot(t,wrapTo2Pi(za(:,1))); hold on;
    plot(t,za(:,2)); hold on;
    plot(t,za(:,3));
    xlabel("t");
    ylabel("");
    legend("\theta", "x", "y");
    
    figure(2);
    plot3(za(:,2),za(:,3),za(:,1), 'LineWidth', 2);
    grid on
    xlabel("x (m)");
    ylabel("y (m)");
    zlabel("\theta (rad)");
    title('Solution curve')
end