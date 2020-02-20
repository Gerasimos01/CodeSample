function [ V_anad,Cons,gp_d1,gp_d2,gp_d3,lines,rows,elements,fdof_8,komvoi_8,dof_8,e2 ] = montelo_shell( elem1,elem2,E,ni )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%eisagwgika
V_anad=[zeros(5,10),eye(5),zeros(5,25);zeros(5,25),eye(5),zeros(5,10);
        zeros(5,5),eye(5),zeros(5,30);zeros(5,30),eye(5),zeros(5,5);
        zeros(5,20),eye(5),zeros(5,15);zeros(5,15),eye(5),zeros(5,20);
        zeros(5,35),eye(5);eye(5),zeros(5,35)];
%selida 194 gia to Cons

% Cons=E*(1-ni)*(1/((1+ni)*(1-2*ni)))*[1,ni/(1-ni),ni/(1-ni),0,0,0;
%                                       ni/(1-ni),1,ni/(1-ni),0,0,0;
%                                       ni/(1-ni),ni/(1-ni),1,0,0,0;
%                                       zeros(3,3),(1-2*ni)*(1/(2*(1-ni)))*eye(3)];
Cons=E*(1/(1-(ni^2)))*[1,ni,0,0,0,0;
                                      ni,1,0,0,0,0;
                                      0,0,0,0,0,0;
                                      zeros(1,3),0.5*(1-ni),zeros(1,2);
                                      zeros(2,4),0.5*(1)*(1-ni)*eye(2)];

%oloklhrwsi Gauss
gp_d1=3;
gp_d2=3;
gp_d3=3;


%Gewmetrika xarakthristika
lines=elem2+1;
rows=elem1+1;
elements=elem1*elem2;

fdof=5*(elem1-1)*(elem2+1);
komvoi=fdof/5;
dof=6*(elem1-1)*(elem2+1);
fdof_8=5*(elem1*(3*elem2+2)+2*elem2+1);
komvoi_8=fdof_8/5;
dof_8=6*komvoi_8;
e2=zeros(3,1);
e2(2,1)=1;



end

