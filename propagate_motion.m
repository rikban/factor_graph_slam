% Return propagated state given control inputs, 
% previous state, time to propagate by, and parameters. 
%   Inputs:
%       delta_t - [float] Time interval to propagate forward by
%       x_prev - [3x1 vector] Previous state - theta, x, and y
%       control_inputs - [2x1 vector] Linear speed of left wheel and right
%       wheel
%       params - [nx1 vector] Diameter 
%   Outputs
%       x - [3x1] Propagated state vector
function[x] = propagate_motion(delta_t, x_prev, control_inputs, params)

    v_l = control_inputs(1);
    v_r = control_inputs(2);
    v_c = 0.5*sum(control_inputs);
    diameter = params(1);
    w = ((v_r - v_l)/diameter);

    x = x_prev + [w*delta_t;
                (v_c/w)*sin(w*delta_t);
                (v_c/w)*cos(w*delta_t)];
end