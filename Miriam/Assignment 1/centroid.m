function [centroi] = centroid(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
len = size(x);
len = len(1);
for i=1:len
    centroi(i) =  sum(x(i))/length(x(i));
end
end

