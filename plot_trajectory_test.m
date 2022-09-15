% Test for trajectory Plotting
% Note: sometimes produces invalid covarience matricies
close all

% Initial Condiditions
x = [0;0;0];
P = [nan, nan, nan;
    nan, 1, 0;
    nan, 0, 1];
% Plot initial Conditions (circle facing up at (0,0)
fig = figure;
plot_trajectory_iterative(fig, x, P)

%Randomly propigate states and covariences and plot the new result
for idx = 1:5
    
    % propigate states by a random amount
    x = x + [0.5; 2.5; 2.5] - rand(3,1).*[2;5;5];

    %propigate covarience by random amount
    P = P + [0, 0, 0;
             0, rand()*0.5, 0.25 - rand()*0.5;
             0, 0.25 - rand()*0.5, rand()*0.5];

    plot_trajectory_iterative(fig, x, P)
    axis equal
end
