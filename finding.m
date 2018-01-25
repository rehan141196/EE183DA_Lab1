% FK IK Analysis Lab 1 - Human Leg
% This program uses the computed FK values to implement Inverse Kinematics
% Given the final position of the end effector we look up the table of
% values generated previosuly to determine which joint parameters give us
% the desired final position

finalpos = [0.42; -0.14; -0.18; 1];
k = keys(results2);
val = values(results2);
index = -1;
 for i = 1:length(results2)
     lookup = round(results2(k{i}), 2);
     if lookup == finalpos
         index = k{i};
     end
 end
 
 if index == -1
     disp('Not found')
 else
     config = results1(index)
 end