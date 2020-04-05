close all;
clc;

t=scope13(:,1);
u=imp;
z=h;
figure;
plot(t,[u,z]); title('Raspuns la impuls'); ylabel('Tensiune[V]');xlabel('Timp[s]');


 
zsim=lsim(At,Bt,Ct,Dt,u,t,[z(1) 0]);

hold on; plot(t,zsim,'g'); figure; plot(t,zsim);

Empn=norm(z-zsim)/norm(z-mean(z))