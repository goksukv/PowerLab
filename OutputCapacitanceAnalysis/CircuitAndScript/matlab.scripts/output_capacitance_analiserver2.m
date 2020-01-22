close all, clear all
L=150e-6;
[time1,Vvds1,Vn001] = spicetxtimport('realinduc.txt' ,2, 340);
[time, Vds, Vin ] = resonanceextractor(time1,Vvds1,Vn001);
dt = gradient(time);
Vds_dot = gradient(Vds)./dt;
Vds_int = customintegral(time,Vds);

[peak_point, peak_index] = max(Vds);


for i=1:1:length(time)
C(i)=((Vds_int(peak_index))-Vds_int(i))/(L*Vds_dot(i));
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
xlabel('Vds(V)')
ylabel('Coss(pF)')
grid on
ylim([10 1000])
xlim([0 500])
 samplevalidate(time, Vds_int, Vds_dot , Vds);

%%
% [time2,Vvds2,Vn002] = spicetxtimport('resistance.txt' ,2, 199);
% [time_res, Vds_res, Vin_res ] = resonanceextractor(time2,Vvds2,Vn002);
% dt_res = gradient(time_res);
% Vds_res_dot = gradient(Vds_res)./dt_res;
% Vds_res_int = customintegral(time_res,Vds_res);
% [peak_point_res, peak_res_index] = max(Vds_res);
% for i=1:1:length(time_res)
% C_res(i)=(Vds_res_int(peak_res_index)-Vds_res_int(i))/(L*Vds_res_dot(i));
% end
% C_res=C_res';
% 
% 
% figure
% subplot(3,1,1)
% plot(time_res,Vds_res)
% title('Vds_res')
% subplot(3,1,2)
% plot(time_res, Vds_res_int)
% title('Vds_res integral')
% subplot(3,1,3)
% plot(time_res, Vds_res_dot)
% title('Vds_res derrivative')
% suptitle('Original, Derrivative and Integral Waveforms')
% 
% for j=peak_res_index: 1:length(time_res)
%     Vdss_res(j)=Vds_res(j);
%     Css_res(j)=C_res(j);
% end
% 
% figure
% semilogy(Vdss_res,Css_res*1e12)
% title('Vds_res vs Css')
% xlabel('Vds_res(V)')
% ylabel('Coss_res(pF)')
% grid on
% ylim([100 1000])
% xlim([0 500])
% samplevalidate(time_res, Vds_res_int, Vds_res_dot , Vds_res);
% 
% for k=1:1:length(Css_res)
% [value,idx] = min(abs(Vdss_res(k)-Vdss))
% 
%     Cerror(k)= 100*(Css(idx)- Css_res(k))/Css(idx);
% end
% Cerror = Cerror';
% 
% figure
% plot(Vds_res,Cerror)
% xlim([0 500])
% title('Ressistance and Ideal Condition Comparison');