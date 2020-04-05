close all;
clc;

t=scope12(:,1);
u=trp;
z=y;
figure;
plot(t,[u,z]);title('Raspuns la treapta'); ylabel('Tensiune[V]');xlabel('Timp[s]');


 
zsim=lsim(Ai,Bi,Ci,Di,u,t,[z(1) 0]);

hold on; plot(t,zsim,'g'); figure; plot(t,zsim);

Empn=norm(z-zsim)/norm(z-mean(z))