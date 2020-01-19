function [output] = samplevalidate(time, integral, derrivative , original)
%% Validation 
% This plot integrates the derrivative and differentiates the integral and
% Checks if the signal can be constructed back. This is a must test to see
% if the sampling rate is enoug. 
integral_check = gradient(integral)./gradient(time);
integral_error = 100.00*(original - integral_check)/original;

figure
subplot(2,1,1)
plot(time, integral_check, time, original)
title('Reconstructed Signal')
legend('Reconstructed', 'Original')

subplot(2,1,2)
plot(time, integral_error)
title('Error(%)')
suptitle('Integral Reconstruct')



derrivative_check = customintegral(time,derrivative);
derrivative_error = 100*(original - derrivative_check)./original;

figure
subplot(2,1,1)
plot(time, derrivative_check,time, original)
title('Reconstructed Signal')
legend('Reconstructed', 'Original')

subplot(2,1,2)
plot(time, derrivative_error)
title('Error(%)')
suptitle('Derrivative Reconstruct')

output=1;
end

