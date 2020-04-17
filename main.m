function [TAB, MSE] = main(x_beg, x_end, y_beg, y_end, fun, n, m)
% MAIN function returns two argumetns: TAB and MSE. TAB - matrix with columns: 1 and 2 - x and y coordinates of centers of gravity,
% 3 - values of original function in these points, 4 - values of
% interpolation function in these points, 5 - absolute error of
% interpolation. MSE - the value of mean squared error of interpolation. 
% Input arguments: x_beg - the begginig of horizontal range (parralel to Ox axis),
% x_end - the end of horizontal range (parralel to Ox axis), y_beg -
% the begging of vertical range (parralel to Oy axis), y_end -
% the end of vertical range (parralel to Oy axis), fun - function to
% interpolate, n - number of x points, m - number of y points.

hx = (x_end - x_beg)/n;
hy = (y_end - y_beg)/m;
[x_cg, y_cg] = center_of_gravity(x_beg, hx, x_end, y_beg, hy, y_end, n, m);

TAB = [x_cg, y_cg, fun(x_cg, y_cg), interp_fun(x_cg, y_cg, x_beg, y_beg, hx, hy, fun)];
TAB = [TAB, abs((TAB(:, 3) - TAB(:, 4))./TAB(:, 3))];
MSE = mean_squared_error(TAB(:, 3), TAB(:, 4));

end


