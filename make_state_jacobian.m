function J = make_state_jacobian(vc, w, theta, dt)
% Make state jacobian mtarix for roomba model noise propogation
%   Inputs:
%       vc - [float] forward velocity of the vehicle in m
%       w - [float] angular velocity of the vehicle in rad/s
%       theta - [float] Orientation between ego and world frame in rad
%       dt - time interval between propogation (seconds) 
%   Outputs
%       J - [3x3] Jacobian matrix of the state transition
    J = [1, 0, 0;
        (vc/w)*cos(w*dt + theta), 1, 0;
        (vc/w)*sin(w*dt + theta), 0, 1];
end
