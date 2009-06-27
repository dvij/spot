function varargout = minres(A,b,varargin)
%MINRES   Minimum Residual Method.
%
%   See help of MINRES function provided by Matlab.

%   Copyright 2009, Ewout van den Berg and Michael P. Friedlander
%   http://www.cs.ubc.ca/labs/scl/sparco
%   $Id$

if (size(A,1) ~= size(A,2)) || norm(abs(A*b-A'*b),inf) > 1e-14*norm(b,inf)
   error('Operator A must be symmetric.');
end

% Set up multiplication function
fun = @(x) (A*x);

if nargout == 0
   minres(fun,b,varargin{:});
elseif nargout <= 6
   varargout = cell(1,nargout);
   [varargout{:}] = minres(fun,b,varargin{:});
else
   error('Too many output arguments.');
end
