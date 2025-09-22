function volt = SimpleKalman(z)
% simple KF for 1d signal
persistent A H Q R % system matrices
persistent x P  % state and covariance
persistent firstRun % to init once


if isempty(firstRun)
  A = 1;% state transition
  H = 1; % measurement matrix
  Q = 0.01;% process noise
  R = 16;% measurement noise
% initial guess
  x = 14;  
  P =  6;% initial error
  
  firstRun = 1;  
end

% Kalman algorithm  
xp = A*x;           % I. Prediction of estimate
Pp = A*P*A' + Q;    %    Prediction of error cov

K = Pp*H'*inv(H*Pp*H' + R); % II. Computation of Kalman gain

x = xp + K*(z - H*xp); % III. Comp. of state estimate
P = Pp - K*H*Pp;       % IV. Comp. of error cov.


volt = x;