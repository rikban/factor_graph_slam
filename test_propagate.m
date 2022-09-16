%% Integration test
close all
delta_t = 0.1;
x_prev = [0;0;0];
control_inputs = [1;1];
P_prev = eye(3)*0.01;

params = [1];  % Only parameter is diameter for now
f= figure;
plot_trajectory_iterative(f, x_prev, P_prev)
for i = 1:25
    [x, P] =  propagate(delta_t, x_prev, P_prev, control_inputs, params);
    % Plot here
    plot_trajectory_iterative(f, x, P)
    axis equal
    x_prev = x;
    P_prev = P;
end