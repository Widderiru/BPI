function [centroi] = centroid(x)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
len = size(x);
instancesize = len(1);
if instancesize == 0
    centroi = (-10000) * ones(1,3);
else
    for i=1:instancesize
        centroi(i) =  sum(x(i,:))/len(2);
    end
end    
end

