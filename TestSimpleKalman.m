clear all


dt = 0.2; % time step (s)
t  = 0:dt:10;

Nsamples = length(t);% No. of samples
% to save kalman outputs
Xsaved = zeros(Nsamples, 1); 
% to save measurments
Zsaved = zeros(Nsamples, 1);

for k=1:Nsamples
  z = GetVolt(); % to get noisy measurement
  volt = SimpleKalman(z); %to apply KF
  
  Xsaved(k) = volt;
  Zsaved(k) = z;
end


figure
plot(t, Xsaved, 'o-','linewidth',4)
hold on
plot(t, Zsaved, 'r:*','markersize',10,'linewidth',2) 
xlabel('time (s)'); ylabel('voltage (V)')
title('Voltage')
legend('Kalman Filter', 'Measurements')
set(gca,'fontsize',18); grid on