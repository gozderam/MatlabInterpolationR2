function [mse] = mean_squared_error(w, g)
% MEAN_SQUARED_ERROR function returns a scalar mse which is the value of
% mean squared error for w and v - column vectors.
mse = sum((w-g).^2)/length(w);

end

