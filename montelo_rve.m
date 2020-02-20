function [ Cons_disp,t_disp,gp_d1_disp,gp_d2_disp,gp_d3_disp,o_x_rve,t_u_rve,t_x_rve,f_komvoi_rve,p_komvoi_rve,V_anad_hexa,Dq,komvoi_rve ] = montelo_rve( cycles,E_disp,ni_disp,L01,L02,L03,hexa1,hexa2,hexa3 )



V_anad_hexa=[zeros(3,6),eye(3),zeros(3,15);zeros(3,3),eye(3),zeros(3,18);
        zeros(3,9),eye(3),zeros(3,12);eye(3),zeros(3,21);
        zeros(3,18),eye(3),zeros(3,3);zeros(3,15),eye(3),zeros(3,6);
        zeros(3,21),eye(3);zeros(3,12),eye(3),zeros(3,9)];

Cons_disp=E_disp*(1-ni_disp)*(1/((1+ni_disp)*(1-2*ni_disp)))*[1,ni_disp/(1-ni_disp),ni_disp/(1-ni_disp),0,0,0;
                                      ni_disp/(1-ni_disp),1,ni_disp/(1-ni_disp),0,0,0;
                                      ni_disp/(1-ni_disp),ni_disp/(1-ni_disp),1,0,0,0;
                                      zeros(3,3),(1-2*ni_disp)*(1/(2*(1-ni_disp)))*eye(3)];


gp_d1_disp=3;
gp_d2_disp=3;
gp_d3_disp=3;


komvoi_rve=(hexa1+1)*(hexa2+1)*(hexa3+1);
o_x_rve=zeros(3*komvoi_rve,1);

%suxnoi tupoi
kuvos=(hexa1-1)*(hexa2-1)*(hexa3-1);
endiam_plaka=2*(hexa1+1)+2*(hexa2-1);
katw_plaka=(hexa1+1)*(hexa2+1);

%sumplhrwsh suntetagmenwn rve
for h1=1:1:(hexa1+1)
for h2=1:1:(hexa2+1)
for h3=1:1:(hexa3+1)

[arith]=topol_rve(h1,h2,h3,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);

o_x_rve(3*(arith-1)+1,1)=-0.5*L01+(h1-1)*(L01/hexa1);  %(h1-1)*(L01/hexa1); dn xrhsimo/kan
o_x_rve(3*(arith-1)+2,1)=-0.5*L02+(h2-1)*(L02/hexa2);  %(h2-1)*(L02/hexa2);
o_x_rve(3*(arith-1)+3,1)=-0.5*L03+(h3-1)*(L03/hexa3);  %(h3-1)*(L03/hexa3); 

end
end
end

%sundesmologia rve me arithmhsh elements kata tous axones
t_disp=zeros(hexa1*hexa2*hexa3,8); 

for h1=1:1:(hexa1)
for h2=1:1:(hexa2)
for h3=1:1:(hexa3)

n_hexa=h1+(h2-1)*hexa1+(h3-1)*(hexa1)*hexa2;

t_disp(n_hexa,1)=topol_rve(h1+1,h2+1,h3+1,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);
t_disp(n_hexa,2)=topol_rve(h1,h2+1,h3+1,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);    
t_disp(n_hexa,3)=topol_rve(h1,h2,h3+1,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);    
t_disp(n_hexa,4)=topol_rve(h1+1,h2,h3+1,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);
t_disp(n_hexa,5)=topol_rve(h1+1,h2+1,h3,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);
t_disp(n_hexa,6)=topol_rve(h1,h2+1,h3,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);    
t_disp(n_hexa,7)=topol_rve(h1,h2,h3,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);    
t_disp(n_hexa,8)=topol_rve(h1+1,h2,h3,hexa1,hexa2,hexa3,kuvos,endiam_plaka,katw_plaka);

end
end
end

f_komvoi_rve=kuvos;
p_komvoi_rve=komvoi_rve-f_komvoi_rve;

t_u_rve=zeros(3*komvoi_rve,cycles+1);
t_x_rve=zeros(3*komvoi_rve,cycles+1);
t_x_rve(:,1)=o_x_rve;

% Dq=zeros(6,3*p_komvoi_rve);
% for j1=1:1:p_komvoi_rve
%     komvos=f_komvoi_rve+j1;
%     Dq(1:6,(3*(j1-1)+1):(3*(j1-1)+3))=0.5*[2*o_x_rve(3*(komvos-1)+1,1),  0,  0;
%                                                   0,    2*o_x_rve(3*(komvos-1)+2,1),    0;
%                                                   0,    0,  2*o_x_rve(3*(komvos-1)+3,1);
%                                                   o_x_rve(3*(komvos-1)+2,1),    o_x_rve(3*(komvos-1)+1,1),    0;
%                                                   0,    o_x_rve(3*(komvos-1)+3,1),    o_x_rve(3*(komvos-1)+2,1);
%                                                   o_x_rve(3*(komvos-1)+3,1),0,o_x_rve(3*(komvos-1)+1,1)];                                                  
% end
Dq=zeros(9,3*p_komvoi_rve);
for j1=1:1:p_komvoi_rve
    komvos=f_komvoi_rve+j1;
    Dq(1:9,(3*(j1-1)+1):(3*(j1-1)+3))=[o_x_rve(3*(komvos-1)+1,1),  0,  0;
                                       0,    o_x_rve(3*(komvos-1)+2,1),    0;
                                       0,    0,  o_x_rve(3*(komvos-1)+3,1);
                                       o_x_rve(3*(komvos-1)+2,1),  0,  0;
                                       0,    o_x_rve(3*(komvos-1)+3,1),    0;
                                       0,    0,  o_x_rve(3*(komvos-1)+1,1);
                                       o_x_rve(3*(komvos-1)+3,1),  0,  0;
                                       0,    o_x_rve(3*(komvos-1)+1,1),    0;
                                       0,    0,  o_x_rve(3*(komvos-1)+2,1)];
                                                                                                    
end

end
