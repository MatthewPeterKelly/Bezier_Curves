function [Q, D] = getBezierDerivative(P,tSpan)
% [Q, D] = getBezierDerivative(P, tSpan)
%
% Suppose that a bezier curve is defined by the control points P. Then the
% derivative of that curve is defined by the control points in Q. The
% secondary output of the function returns the differentiation matrix, such
% that: Q = (D*P')'
%
% INPUTS:
%   P = [nCurve x nPoint] = control points
%   tSpan = [1 x 2] = tSpan(1) <= t <= tSpan(2)   
%       --> default tSpan is [0,1]
%
% OUTPUTS:
%   Q = [nCurve x (nPoint-1)] = control points for derivative
%   D = [(nPoint-1) x nPoint] = differentiation matrix:   Q = (D*P')'
% 
%

if nargin == 1
    tSpan = [0,1];
end

h = tSpan(2)-tSpan(1);

n = size(P,2);  % Number of control points
D = zeros(n-1,n);
for i=1:(n-1)
    D(i,i+1) = 1;
    D(i,i) = -1;
end
D = (n-1)*D/h;
Q = (D*P')';

end