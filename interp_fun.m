function [v] = interp_fun(xx, yy, x_beg, y_beg, hx, hy, fun)
% INTERP_FUN function returns v - the scalar value of interpolation
% for function fun(fun: R^2->R) in point (xx, yy). Other input arguments mean as
% follow: x_beg - the begginig of horizontal range (parralel to Ox axis), y_beg -
% the begging of vertical range (parralel to Oy axis), hx - distance beetwen two
% subsequent points of horizontal range, hy - distance beetwen two
% subsequent points of vertical range.

% localization of (xx, yy) point
col = ceil((xx-x_beg)./hx);
if( col==0) 
     col = 1;
end

row = ceil((yy-y_beg)./hy);
if( row==0) 
      row= 1;
end

% upper triangle
if(yy>=(hy/hx)*(xx) + (y_beg + row*hy) - (hy/hx)*(x_beg+col*hx)) 
    x0=x_beg+(col-1)*hx;     y0=y_beg+(row-1)*hy;
    x1=x_beg+(col)*hx;       y1=y_beg+(row)*hy;
    x2=x_beg+(col-1)*hx;     y2=y_beg+row*hy;
% lower triangle
else                        
    x0=x_beg+(col-1)*hx;     y0=y_beg+(row-1)*hy;
    x1=x_beg+(col)*hx;       y1=y_beg+(row-1)*hy;
    x2=x_beg+(col)*hx;       y2=y_beg+(row)*hy;
end 

% interpolation 
d = (x1-x2).*(y0-y2) - (y1-y2).*(x0-x2);
fi_0 = @(x, y) ((y2-y1).*x+(x1-x2).*y+x2.*y1-y2.*x1)./d;
fi_1 = @(x, y) ((y0-y2).*x+(x2-x0).*y+x0.*y2-y0.*x2)./d;
fi_2 = @(x, y) ((y1-y0).*x+(x0-x1).*y+x1.*y0-y1.*x0)./d;
v = fun(x0, y0).*fi_0(xx,yy) + fun(x1,y1).*fi_1(xx,yy) + fun(x2,y2).*fi_2(xx,yy);

end


