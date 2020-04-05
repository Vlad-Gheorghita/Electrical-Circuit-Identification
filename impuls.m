close all
clc;

t=scope12(:,1);
u=scope12(:,2);
imp=u;
h=scope12(:,3);

figure;
plot(t,[u,h]); xlabel('Timp[s]'); ylabel('Tensiune[V]');title('Raspunsul la impuls');

i1=446; i2=497;
hst=mean(h(i1:i2));
ust=mean(u(i1:i2));
k=hst/ust
% hold on; plot(t,hst*ones(1,length(t)));

i3=36; i4=107; i5=170; 
 
sigma=sum(abs(h(i4:i5)-hst))/sum(abs(h(i3:i4)-hst))
zeta=-log(sigma)/sqrt(pi^2+log(sigma)^2)

i6=64; i7=132;
Tosc=(t(i7)-t(i6))*2
wosc=2*pi/Tosc;
wn=wosc/sqrt(1-zeta^2)

Ai=[0 1;-wn^2 -2*zeta*wn]; Bi=[0;k*wn^2]; Ci=[1 0]; Di=0;
hsim=lsim(Ai,Bi,Ci,Di,u,t,[h(1) 0]);
imp_init=h(1);
hold on; plot(t,hsim,'g'); figure; plot(t,hsim);

Empn=norm(h-hsim)/norm(h-mean(h))