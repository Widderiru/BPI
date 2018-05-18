clc
clear all
amount_req = [7000, 15000, 23112, 6000, 10000,2500, 19000, 5000,13000,35000,5000,7500,6000,6500,25000,10000,7800,8500,17000,3000];
case_duration = [0.29309,28.43964,0.000532,0.048206,12.95023,0.021134,19.78213,29.51885,0.515625,19.74352,7.612419,0.489861,6.503808,0.002049,21.14506,0.000799,19.1099,0.000486,0.01375,6.955382];
total_activities = [6,74,3,25,26,7,45,46,10,88,25,11,22,6,41,3,52,3,12,15];
c1 = [50000, 1.5, 6];
c2 = [10000, 0.7, 10];
c3 = [30000, 4, 26];


change = 100000;
k = 0;
while k < 3
    clust1x = [];
    clust1y = [];
    clust1z = [];
    clust2x = [];
    clust2y = [];
    clust2z = [];
    clust3x = [];
    clust3y = [];
    clust3z = [];
    for i = 1:length(amount_req)
        data = [amount_req(i),case_duration(i),total_activities(i)];
        distc1(i) = distance(data,c1);
        distc2(i) = distance(data,c2);
        distc3(i) = distance(data,c3);
        
        minimum = min([distc1(i),distc2(i),distc3(i)]);
        if (distc1(i) == minimum)
            clust1x = [ clust1x , amount_req(i)];
            clust1y = [ clust1y , case_duration(i)];
            clust1z = [ clust1z , total_activities(i)];
            c(i) = 1; 
        elseif(distc2(i) == minimum)
            clust2x = [ clust2x , amount_req(i)];
            clust2y = [ clust2y , case_duration(i)];
            clust2z = [ clust2z , total_activities(i)];
            c(i) = 2; 
        else
            clust3x = [ clust3x , amount_req(i)];
            clust3y = [ clust3y , case_duration(i)];
            clust3z = [ clust3z , total_activities(i)];
            c(i) = 3; 
        end
    end
    c
    c1new = centroidrandom([clust1x;clust1y;clust1z]);
    c2new = centroidrandom([clust2x;clust2y;clust2z]);
    c3new = centroidrandom([clust3x;clust3y;clust3z]);
    change = distance(c1,c1new) + distance(c2,c2new) + distance(c3,c3new);
    c1 = c1new;
    c2 = c2new;
    c3 = c3new;
    k = k + 1;
%     namen = {'distance_to_cluster_1','distance_to_cluster_2','distance_to_cluster_3'};
%     T = table(distc1',distc2',distc3','VariableNames',namen);
%     filename = 'Question1.xlsx';
%     writetable(T,filename,'Sheet',k,'Range','A1')
%     namen2 = {'centroid_1','centroid_2','centroid_3'};
%     T = table(c1',c2',c3','VariableNames',namen2);
%     filename = 'Question1centroids.xlsx';
%     writetable(T,filename,'Sheet',k,'Range','A1')
end
c1
c2
c3

k

% namen3 = {'amount_req','case_duration','total_activities'};
% T = table(clust1x',clust1y',clust1z','VariableNames',namen3);
% filename = 'Question1cluster1.xlsx';
% writetable(T,filename,'Sheet',1,'Range','A1')
% 
% namen4 = {'amount_req','case_duration','total_activities'};
% T = table(clust2x',clust2y',clust2z','VariableNames',namen4);
% filename = 'Question1cluster2.xlsx';
% writetable(T,filename,'Sheet',1,'Range','A1')
% namen5 = {'amount_req','case_duration','total_activities'};
% T = table(clust3x',clust3y',clust3z','VariableNames',namen5);
% filename = 'Question1cluster3.xlsx';
% writetable(T,filename,'Sheet',1,'Range','A1')
