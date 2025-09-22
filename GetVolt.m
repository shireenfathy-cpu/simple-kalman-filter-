function z = GetVolt()
% Generate a fake voltage measurement
v = 0 + 4*randn ; % random noise, mean 0, std 4
z = 14.4 + v; % true voltage + noise (scalar)