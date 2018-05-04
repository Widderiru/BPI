function [dist] = distance(x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(x)
    dist = (x(i)-y(i))^2;
end
dist = sqrt(dist);
end

