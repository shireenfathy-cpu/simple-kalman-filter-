function [volt Px K] = SimpleKalman2(z)
% function to return (state, covariance, and gain)
%
persistent A H Q R 
persistent x P
persistent firstRun
if isempty(firstRun)
  A = 1;
  H = 1;
  
  Q = 0.01;
  R = 16;

  x = 14;
  P =  6;
  
  firstRun = 1;  
end 
xp = A*x;
Pp = A*P*A' + Q;
K = Pp*H'*inv(H*Pp*H' + R);
x = xp + K*(z - H*xp);
P = Pp - K*H*Pp;
volt = x;
Px   = P;