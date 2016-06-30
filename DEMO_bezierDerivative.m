%TEST_bezierFunction.m
%
% This script tests the use of a bezier curve to represent a vector
% function, rather than an arbitrary space curve
%
clc; clear;

order = 5;
tSpan = [0,2];

P = randn(1,order+1);
[dP, D1] = getBezierDerivative(P,tSpan);
[ddP, D2] = getBezierDerivative(dP,tSpan);

t = linspace(tSpan(1),tSpan(2),250);

P_time = linspace(tSpan(1),tSpan(2),order+1);
dP_time = linspace(tSpan(1),tSpan(2),order);
ddP_time = linspace(tSpan(1),tSpan(2),order-1);

x = bezierCurve(P,t,tSpan);
dx = bezierCurve(dP,t,tSpan);
ddx = bezierCurve(ddP,t,tSpan);

figure(1); clf;

subplot(3,1,1);
plot(t,x); hold on;
plot(P_time,P,'x');
xlabel('t');
ylabel('x');
title('position');

subplot(3,1,2);
plot(t,dx); hold on;
plot(dP_time,dP,'x');
xlabel('t');
ylabel('dx');
title('slope');

subplot(3,1,3);
plot(t,ddx); hold on;
plot(ddP_time,ddP,'x');
xlabel('t');
ylabel('ddx');
title('curvature')


% %%%% sanity check on derivatives:
% h = mean(diff(t));
% tNum = 0.5*(t(1:(end-1)) + t(2:end));
% dxNum = diff(x)/h; 
% ddxNum = diff(dx)/h; 
% 
% subplot(3,1,2); hold on;
% plot(tNum, dxNum,'g.','MarkerSize',10);
% subplot(3,1,3); hold on;
% plot(tNum, ddxNum,'g.','MarkerSize',10);


