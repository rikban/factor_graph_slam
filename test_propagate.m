%% Unit test
delta_t = 0.1;
x_prev = [0;0;0];
control_inputs = [2;1];
P_prev = eye(3);
params = [1];  % Only parameter is diameter for now

for i = 0:10
 [x, P] =  propagate(delta_t, x_prev, P_prev, control_inputs, params);
 % Plot here
 x_prev = x;
 P_prev = P;
end