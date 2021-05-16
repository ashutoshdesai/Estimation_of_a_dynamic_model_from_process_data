load STHID-data.txt
idplot(STHID_data)
cd=detrend(STHID_data, 'constant');
figure;idplot(cd)
figure;
[ir, r, cl]=cra(cd);
nn=struc(2,2,4:8);
v1=arxstruc(cd,cd,nn);
v1
nn=struc(1:3,1:3,6);
v2=arxstruc(cd,cd,nn);
v2
for i=1:9
    parameter_plot(i)=v2(2,i)+v2(3,i);
end
figure;
plot(parameter_plot(1:9),v2(1,1:9),'+');
mod=arx(cd,[2,3,6]);
present(mod)
figure;
resid(cd,mod,'corr')

comp_data=compare(cd,mod,inf);
figure;
plot(cd(:,1)); 
hold;
plot(comp_data,'r');
figure; plot(cd(:,1),comp_data,'*');
hold;
plot([-8 8],[-8 8],'k');