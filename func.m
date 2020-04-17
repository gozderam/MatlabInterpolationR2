function [ret] = func(x,y)
% FUNC function is used to test results of interpolation for different
% types of fucntions. It takes two row or column vectors x and y and
% returns vector ret which is the result.

%ret = x.^2 + 2*y.^2 -y -3.*x + 500.*sin(x);
ret = cos(x+y);
%ret = x+y;
%ret = x.^5;
%ret = y.^5;
end

