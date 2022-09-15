% Propagate noise for the roomba motion model
%   Inputs:
%       delta_t - [float] Time interval to propagate forward by
%       P_prev - [3x3 vector] Previous noise matrix
%       control_inputs - [2x1 vector] Linear speed of left wheel and right
%       wheel
%       params - [nx1 vector] Diameter 
%   Outputs
%       P - [3x3 vector] Propagated noise matrix

function[P] = propagate_noise(delta_t, P_prev, x_prev, control_inputs, params)
    
    v_l = control_inputs(1);
    v_r = control_inputs(2);
    v_c = 0.5*sum(control_inputs);
    diameter = params(1);
    w = ((v_r - v_l)/diameter);
    J = zeros(3);
    J = make_state_jacobian(v_c, w, x_prev(1), delta_t);
    sigma = P_prev;
        
    P = J*sigma*J';
end