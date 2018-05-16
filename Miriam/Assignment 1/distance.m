    function [dist] = distance(x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
dist = 0;
for i=1:length(x)
    dist = dist + (x(i)-y(i))^2;
end
dist = sqrt(dist);


end

