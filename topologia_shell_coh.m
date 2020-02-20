function [ t,t_coh ] = topologia_shell_coh( elements,elem1,elem2,komvoi_8)

% gia ta shell
t=zeros(elements,8);
for nrow=1:1:elem1
    for nline=1:1:elem2   
        elem=(nrow-1)*elem2+nline;
        t(elem,1)=(nrow)*(3*elem2+2)+(nline-1)*2+3;
        t(elem,8)=(nrow)*(3*elem2+2)+(nline-1)*2+2;
        t(elem,4)=(nrow)*(3*elem2+2)+(nline-1)*2+1;
        
        t(elem,5)=(nrow-1)*(3*elem2+2)+2*elem2+1+(nline-1)*1+2;
        t(elem,7)=(nrow-1)*(3*elem2+2)+2*elem2+1+(nline-1)*1+1;
        
        t(elem,2)=(nrow-1)*(3*elem2+2)+(nline-1)*2+3;
        t(elem,6)=(nrow-1)*(3*elem2+2)+(nline-1)*2+2;
        t(elem,3)=(nrow-1)*(3*elem2+2)+(nline-1)*2+1;
    end
end

%RVE %gia ta cohesive shell
% t_coh=zeros(elements,24);
% t_coh(1:elements,1:8)=t;
% 
% t_coh(1:elements,9:16)=t+komvoi_8*ones(elements,8);
% t_coh(1:elements,17:24)=t;

t_coh=zeros(2*elements,24);

t_coh(1:elements,1:8)=t;
t_coh(1:elements,9:16)=t+komvoi_8*ones(elements,8);
t_coh(1:elements,17:24)=t;

t_coh(elements+1:2*elements,1:16)=t_coh(1:elements,1:16)+2*komvoi_8*ones(elements,16);
t_coh(elements+1:2*elements,17:24)=t;

end

