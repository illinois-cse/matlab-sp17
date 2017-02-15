function [ y ] = fallingObject( t, y0, v0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

y = 0.5*(-9.81)*t.^2 + v0*t + y0;

%
y(y<0) = 0;

end