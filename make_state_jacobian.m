function J = make_state_jacobian(v_c, w, theta, delta_t)
% Make state jacobian mtarix for roomba model noise propogation
%   Inputs:
%       vc - [float] forward velocity of the vehicle in m
%       w - [float] angular velocity of the vehicle in rad/s
%       theta - [float] Orientation between ego and world frame in rad
%       dt - time interval between propogation (seconds) 
%   Outputs
%       J - [3x3] Jacobian matrix of the state transition
    if abs(w) < 1e-5
        J = [1, 0, 0;
             0, 1, 0;
             v_c*delta_t, 0, 1];
    else
        J = [1, 0, 0;
            (v_c/w)*cos(w*delta_t + theta), 1, 0;
            (v_c/w)*sin(w*delta_t + theta), 0, 1];
    end
