function plot_trajectory_iterative(fig, x, P)
    %   Plots a single iteration of a trajectory and covarience, plots[x,y]
    %   position with theta vector and an x-y elipse of position covarience
    %   around origin
    %   Inputs:
    %       fig (figure obj) - figure to be plotted on
    %       x [3x1] - theta;x;y state of vehicle
    %       P [3x3] - covarience matrix of state

    %% Setup Figure
    set(0, 'currentfigure', fig)
    hold on
    %% Plot position
    scatter(x(2), x(3), 'ko', 'LineWidth', 2)

    %% plot direction axes
    %Find new points in world frame given theta
    R = [cos(x(1)) -sin(x(1)); sin(x(1)) cos(x(1))];
    vector_x = [1; 0];
    vector_y = [0; 1];
    vector_points_x = (R*vector_x) + x(2:3);
    vector_points_y = (R*vector_y) + x(2:3);

    %Plot vector
    plot([x(2),vector_points_x(1)], [x(3), vector_points_x(2)],'r')
    plot([x(2),vector_points_y(1)], [x(3), vector_points_y(2)],'g')

    %% Plot elipse
    P_xy = P(2:3,2:3);

    % eigenvalue witchcrat to find elipse function from covarience
    p = 0.9;
    s = -2 * log(1 - p);
    [V, D] = eig(P_xy * s);
    t = linspace(0, 2 * pi);
    a = (V * sqrt(D)) * [cos(t(:))'; sin(t(:))'];
    plot(a(1, :) + x(2), a(2, :) + x(3), 'b--');

    %% End Figure
    hold off
end