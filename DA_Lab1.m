% FK IK Analysis Lab 1 - Human Leg
% This is the program which generates all possible values of the end
% effector given the range of joint parameters 

clc;
clear all;
L = 0.48; % Average Length between hip and knee joint (in metres)
basex = 0;
basey = 0;
basez = 0;


theta1min = -15;
theta1max = 30;
theta2min = -35;
theta2max = 10;
theta3min = -15;
theta3max = 30;
theta4min = 0;
theta4max = 45;

results1 = containers.Map('KeyType','int32','ValueType','any');
results2 = containers.Map('KeyType','int32','ValueType','any');

count = 0;
maxx = 0;
maxy = 0;
maxz = 0;
base = [basex; basey; basez; 1];
for i=theta1min:theta1max
    for j = theta2min:theta2max
        for k = theta3min:theta3max
            for l = theta4min:theta4max
                T01 = [cosd(i) -sind(i) 0 0; sind(i) cosd(i) 0 0; 0 0 1 0; 0 0 0 1];
                T12 = [cosd(j) -sind(j) 0 0; 0 0 -1 0; sind(j) cosd(j) 0 0; 0 0 0 1];
                T23 = [cosd(k) -sind(k) 0 0; 0 0 1 0; -sind(k) -cosd(k) 0 0; 0 0 0 1];
                T34 = [cosd(l) -sind(l) 0 L; 0 0 -1 0; sind(l) cosd(l) 0 0; 0 0 0 1];
                T04 = T01*T12*T23*T34;
                endeffector = T04*base;
                results1(count) = [i; j; k; l];
                results2(count) = round(endeffector,4);
                count = count + 1;
            end
        end
    end
end