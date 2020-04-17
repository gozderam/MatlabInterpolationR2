function [x_cg, y_cg] = center_of_gravity(x_beg, hx, x_end, y_beg, hy, y_end, n, m)
% CENTER_OF_GRAVITY function returns x_cg - column vector of x coordinates and y_cg -
% - column vector of y coordinates of centers of gravity in triangles used
% in interpolation. Input arguments: x_beg - the begginig of horizontal range (parralel to Ox axis), y_beg -
% the begging of vertical range (parralel to Oy axis), hx - distance beetwen two
% subsequent points of horizontal range, hy - distance beetwen two
% subsequent points of vertical range, n - number of x points, m - number of y points. 

% x vector creating
x = x_beg:hx:(x_end-hx); 
x = x + 2/3*hx;
length(x);
x=x';
x_cg = repmat(x, m, 1);

% y vector creating
y = y_beg:hy:(y_end-hy);
y = y + 1/3 * hy;
y = repmat(y, n, 1);
y_cg = y(:);

x = x_beg:hx:(x_end-hx); 
x = x + 1/3*hx;
length(x);
x=x';
x_cg = [x_cg; repmat(x, m, 1)];

y = y_beg:hy:(y_end-hy);
y = y + 2/3 * hy;
y = repmat(y, n, 1);
y_cg = [y_cg; y(:)];


end

