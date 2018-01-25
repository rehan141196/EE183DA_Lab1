clc;
clear all;
digits(4);
L = 0.48;
basex = 0;
basey = 0;
basez = 0;
% %FK
% theta1 = 5;
% theta2 = 5;
% theta3 = 5;
% theta4 = 5;
% 
% T01 = [cosd(theta1) -sind(theta1) 0 0; sind(theta1) cosd(theta1) 0 0; 0 0 1 0; 0 0 0 1];
% T12 = [cosd(theta2) -sind(theta2) 0 0; 0 0 -1 0; sind(theta2) cosd(theta2) 0 0; 0 0 0 1];
% T23 = [cosd(theta3) -sind(theta3) 0 0; 0 0 1 0; -sind(theta3) -cosd(theta3) 0 0; 0 0 0 1];
% T34 = [cosd(theta4) -sind(theta4) 0 L; 0 0 -1 0; sind(theta4) cosd(theta4) 0 0; 0 0 0 1];
% 
% T04 = T01*T12*T23*T34;
% 
% base = [basex; basey; basez; 1];
% 
% endeffector = T04*base;

theta1min = -10;
theta1max = 10;
theta2min = -10;
theta2max = 10;
theta3min = -10;
theta3max = 10;
theta4min = 0;
theta4max = 10;

results1 = containers.Map('KeyType','int32','ValueType','any');
results2 = containers.Map('KeyType','int32','ValueType','any');

% results1(0) = [1, 2, 3];
% results2(0) = [4, 5, 6];
% results1(1) = [3, 6, 9];
% results2(1) = [0.1, 0.4, 0.5];
% check = [0.1, 0.4, 0.5];
% ans = 12345;
% k = keys(results2);
% val = values(results2);
%  for i = 1:length(results1)
%      if results2(k{i}) == check
%          ans = k{i};
%      end
%  end
% done = results1(ans)

count = 0;
for i=theta1min:theta1max
    for j = theta2min:theta2max
        for k = theta3min:theta3max
            for l = theta4min:theta4max
                T01 = [cosd(i) -sind(i) 0 0; sind(i) cosd(i) 0 0; 0 0 1 0; 0 0 0 1];
                T12 = [cosd(j) -sind(j) 0 0; 0 0 -1 0; sind(j) cosd(j) 0 0; 0 0 0 1];
                T23 = [cosd(k) -sind(k) 0 0; 0 0 1 0; -sind(k) -cosd(k) 0 0; 0 0 0 1];
                T34 = [cosd(l) -sind(l) 0 L; 0 0 -1 0; sind(l) cosd(l) 0 0; 0 0 0 1];
                T04 = T01*T12*T23*T34;
                base = [basex; basey; basez; 1];
                endeffector = T04*base;
                results1(count) = [i; j; k; l];
                results2(count) = round(endeffector,4);
                count = count + 1;
            end
        end
    end
end

finalpos = [0.4709; 0.0832; 0.0417; 1];
k = keys(results2);
val = values(results2);
index = -1;
% multiples = {};
 for i = 1:length(results2)
     lookup = round(results2(k{i}), 4);
     if lookup == finalpos
         index = k{i};
%          multiples = [multiples, results1(index)];
         break;
     end
 end
config = results1(index);