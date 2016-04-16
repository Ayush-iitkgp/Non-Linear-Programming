clc;
close all;
clear all;

% define objective function in f.m
% define objective gradient in dfdx.m

% Exact 2nd derivatives (hessian)
H = [2.0, -2.0; -2.0, 8.0];

% Start location
x_start = [-3.0, 2.0];

% Design variables at mesh points
i1 = -4.0:0.1:4.0;
i2 = -4.0:0.1:4.0;
[x1_mesh, x2_mesh] = meshgrid(i1, i2);
f_mesh = x1_mesh.^2 - 2.0 .* x1_mesh .* x2_mesh + 4 .* x2_mesh.^2;

% Create a contour plot
fig = figure();
hold on
% Specify contour lines
lines = 2:2:52;
% Plot contours
CS = contour(x1_mesh, x2_mesh, f_mesh,lines);
% Label contours
clabel(CS, 'FontSize', 10)
% Add some text to the plot
title('f(x) = x1^2 - 2*x1*x2 + 4*x2^2')
xlabel('x1')
ylabel('x2')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Quasi-Newton method
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Number of iterations
n = 50;
% Use this alpha for every line search
alpha = linspace(0.1,1.0,n);
% Initialize delta_xq and gamma
delta_xq = zeros(2,1);
gamma = zeros(2,1);
part1 = zeros(2,2);
part2 = zeros(2,2);
part3 = zeros(2,2);
part4 = zeros(2,2);
part5 = zeros(2,2);
part6 = zeros(2,1);
part7 = zeros(1,1);
part8 = zeros(2,2);
part9 = zeros(2,2);
% Initialize xq
xq = zeros(n+1,2);
xq(1,:) = x_start;
% Initialize gradient storage
g = zeros(n+1,2);
g(1,:) = dfdx(xq(1,:));
% Initialize hessian storage
h = zeros(2,2,n+1);
h(:,:,1) = [1, 0.0; 0.0, 1];
for i = 1:1
    % Compute search direction and magnitude (dx)
    %  with dx = -alpha * inv(h) * grad
    delta_xq = -alpha(i)*linsolve(h(:,:,i),g(i,:)')';
    xq(i+1,:) = xq(i,:) + delta_xq;

    % Get gradient update for next step
    g(i+1,:) = dfdx(xq(i+1,:));

    % Get hessian update for next step
    gamma = g(i+1,i)-g(i,:);
    part1 = gamma'*gamma;
    part2 = gamma'*delta_xq;
    part3 = pinv(part2)*part1;

    part4 = delta_xq'*delta_xq;
    part5 = h(:,:,i)*part4;
    part6 = part5*h(:,:,i);
    part7 = delta_xq*h(:,:,i);
    part8 = part7*delta_xq';
    part9 = part6*(1/part8);
    
    h(:,:,i+1) = h(:,:,i) + part3 - part9;
end

plot(xq(:,1),xq(:,2),'r-o')

% Save the figure as a PNG
saveas(fig,'contour','png')

