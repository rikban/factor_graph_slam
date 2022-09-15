% Make state jacobian mtarix for roomba model noise propogation
%   Inputs:
%       vc - [float] forward velocity of the vehicle in m
%       w - [float] angular velocity of the vehicle in rad/s
%       theta - [float] Orientation between ego and world frame in rad
%       dt - time interval between propogation (seconds) 
%   Outputs
%       J - [3x3] Jacobian matrix of the state transition

function [x, P] = propagate(delta_t, x_prev, P_prev, control_inputs, params)

    x = propagate_motion(delta_t, x_prev, control_inputs, params);
    P = propagate_noise(delta_t, P_prev, x_prev, control_inputs, params);

end