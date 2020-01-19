close all, clear all
L=5e-6;
[time1,Vvds1,Vn001] = spicetxtimport('ver2.txt' ,2, 340);
[time, Vds, Vin ] = resonanceextractor(time1,Vvds1,Vn001);
dt = gradient(time);
Vds_dot = gradient(Vds)./dt;
Vds_int = customintegral(time,Vds);

[peak_point, peak_index] = max(Vds);


for i=1:1:length(time)
C(i)=(Vds_int(peak_index)-Vds_int(i))/(L*Vds_dot(i));
end
C=C';

figure
subplot(3,1,1)
plot(time,Vds)
title('Vds')
subplot(3,1,2)
plot(time, Vds_int)
title('Vds integral')
subplot(3,1,3)
plot(time, Vds_dot)
title('Vds derrivative')
suptitle('Original, Derrivative and Integral Waveforms')

for i=peak_index: 1:length(time)
    Vdss(i)=Vds(i);
    Css(i)=C(i);
end

figure
semilogy(Vdss,Css*1e12)
title('Vds vs Css')
xlabel('Vds(V')
ylabel('Coss(pF)')
grid on
ylim([100 1000])
xlim([0 500])
samplevalidate(time, Vds_int, Vds_dot , Vds);