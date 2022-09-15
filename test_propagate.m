%% Integration test
close all;
clear all;
delta_t = 0.1;
x_prev = [5;5;5];
control_inputs = [3;1];
P_prev = eye(3);
params = [1];  % Only parameter is diameter for now
f= figure;

for i = 0:25
 [x, P] =  propagate(delta_t, x_prev, P_prev, control_inputs, params);
 % Plot here
 plot_trajectory_iterative(f, x, P)
 axis equal
 x_prev = x;
 P_prev = P;
end