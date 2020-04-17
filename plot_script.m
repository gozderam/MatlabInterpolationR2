% PLOT_SCRIPT is used to plot MSE depending on the n and m number for
% different types of functions

% n = m
n_m = (1:1:100);
x_beg = 1;
x_end = 80;
y_beg = 1;
y_end = 80;

mserr1 = zeros(1, length(n_m));
mserr2 = zeros(1, length(n_m));
mserr3 = zeros(1, length(n_m));
mserr4 = zeros(1, length(n_m));
mserr5 = zeros(1, length(n_m));
mserr6 = zeros(1, length(n_m));

% function definitions
func1 = @(x,y) x.^2 + 2*y.^2 -y -3.*x + 500.*sin(x);
func2 = @(x,y) cos(x+y);
% func3 = @(x,y) x+y;
% func4 = @(x,y) x.^4.*y.^2 + 7*x.^2.*y.^2 + x + y;
% func5 = @(x,y) x.^y - 400*y;
% func6 = @(x,y) log(x) + exp(y);

% calculating the error
for i = 1:length(n_m)
     [~,mserr1(i)] = main(x_beg, x_end, y_beg, y_end, func1, n_m(i), n_m(i)); 
     [~,mserr2(i)] = main(x_beg, x_end, y_beg, y_end, func2, n_m(i), n_m(i)); 
%      [~,mserr3(i)] = main(x_beg, x_end, y_beg, y_end, func3, n_m(i), n_m(i)); 
%      [~,mserr4(i)] = main(x_beg, x_end, y_beg, y_end, func4, n_m(i), n_m(i)); 
%      [~,mserr5(i)] = main(x_beg, x_end, y_beg, y_end, func5, n_m(i), n_m(i)); 
%      [~,mserr6(i)] = main(x_beg, x_end, y_beg, y_end, func6, n_m(i), n_m(i));

end

% plots of MSE
figure;
subplot(1,2,1);
plot(n_m, mserr1);
xlabel("n = m");
ylabel("MSE");
title("f(x,y) = x^2 + 2y^2 - y - 3x + 500sin(x)");
subplot(1,2,2);
plot(n_m, mserr2);
xlabel("n = m");
ylabel("MSE");
title("f(x,y) = cos(x+y)");

% figure;
% subplot(1,2,1);
% plot(n_m, mserr3);
% xlabel("n = m");
% ylabel("MSE");
% title("f(x,y) = x+y");
% subplot(1,2,2);
% plot(n_m, mserr4);
% xlabel("n = m");
% ylabel("MSE");
% title("f(x,y) = x^4y^2 + 7x^2y^2 + x + y");
% 
% figure;
% subplot(1,2,1);
% plot(n_m, mserr5);
% xlabel("n = m");
% ylabel("MSE");
% title("f(x,y) = x^y - 400y");
% subplot(1,2,2);
% plot(n_m, mserr6);
% xlabel("n = m");
% ylabel("MSE");
% title("f(x,y) = log(x) + exp(y)");
