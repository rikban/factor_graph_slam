% Make state jacobian mtarix for roomba model noise propogation
%   Inputs:
%       delta_t - [float] Time interval to propagate forward by
%       x_prev - [3x1 vector] Previous state - theta, x, and y
%       control_inputs - [2x1 vector] Linear speed of left wheel and right
%       wheel
%       params - [nx1 vector] Diameter (m)
%   Outputs
%       x - [3x1] Propagated state vector
%       P - [3x3 vector] Propagated noise matrix

function [x, P] = propagate(delta_t, x_prev, P_prev, control_inputs, params)

    x = propagate_motion(delta_t, x_prev, control_inputs, params);
    P = propagate_noise(delta_t, P_prev, x_prev, control_inputs, params);

end