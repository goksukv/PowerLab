function [integral] = customintegral(respect_to,inputwave)
%Calculates the inputwave's integral with respect to 'respec_to' waveform.

for i=1:1:length(respect_to)
    for j=1:1:i
    dummyinputwave(j)= inputwave(j);
    dummyrespect_to(j) = respect_to(j);
    end
    dummyinputwave_dt = dummyinputwave.*gradient(dummyrespect_to);
    inputwave_int(i) = trapz(dummyinputwave_dt);
end
integral = inputwave_int';
end

