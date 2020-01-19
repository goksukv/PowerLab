
function [time,Vds,Vin] = resonanceextractor(time1, Vvds1, Vn001)
index_of_res_start = min(find((Vn001<0.1)));
dummyVds = Vvds1;
[blabla,max_index] = max(dummyVds);
for i=1:1:max_index
dummyVds(i) = 10.00;
end
[blabla, index_of_res_down] = min(abs(dummyVds-0.000));
time = zeros(index_of_res_down-index_of_res_start+1,1);
Vds = zeros(index_of_res_down-index_of_res_start+1,1);
Vin = zeros(index_of_res_down-index_of_res_start+1,1);
for i=index_of_res_start:1:index_of_res_down
    time(i-index_of_res_start+1)=time1(i);
    Vds(i-index_of_res_start+1)=Vvds1(i);
    Vin(i-index_of_res_start+1)=Vn001(i); 
end
end
