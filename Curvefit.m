%% Simple Exponential Fit
% Suppose that you have observation time data |xdata| and observed response
% data |ydata|, and you want to find parameters $x(1)$ and $x(2)$ to  fit a
% model of the form
%
% $$ \hbox{ydata} = x(1)\exp\left(x(2)\hbox{xdata}\right).$$
%%
% Input the observation times and responses.

% Copyright 2015 The MathWorks, Inc.

xdata = ...
 [0.9 1.5 13.8 19.8 24.1 28.2 35.2 60.3 74.6 81.3];
ydata = ...
 [455.2 428.6 124.1 67.3 43.2 28.1 13.1 -0.4 -1.3 -1.5];
%%
% Create a simple exponential decay model.
fun = @(x,xdata)x(1)*(((exp(-x(2)*xdata) + xdata^x(3))*(1 - exp(-x(8)*xdata)))+(((xdata*exp(1-(xdata/(x(4)*((0.001^x(7))*exp(x(6)/323))))))/(x(4)*((0.001^x(7))*exp(x(6)/323))))-((exp(-x(2)*xdata) + xdata^x(3))*(1 - exp(-x(8)*xdata))))*exp((log((exp(x(6)/323))) - x(5))*xdata))*((0.001^x(7))*exp(x(6)/323));
%%
% Fit the model using the starting point |x0 = [100,-1]|.
x0 = [4,1,1,0.002,10,1100,0.06,11];
x = lsqcurvefit(fun,x0,xdata,ydata)
%%
% Plot the data and the fitted curve.
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ko',times,fun(x,times),'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')