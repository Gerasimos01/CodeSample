%    Print_subdomains_proxeiro_1_display_all_v2 %proelefsi HSTAM updated
%    gia git Controled version
% string1=['RVE_database\rve_no_',num2str(1),'\'];
% addpath(string1)
load_and_calculate_data % OR


shellSubdomains=read_matrix_from_msolve_output([example_path '\input_matlab\subdomain_elements\subdomainShellElements.txt'],1 );
hexaSubdomains=read_matrix_from_msolve_output( [example_path '\input_matlab\subdomain_elements\subdomainHexas.txt'],1 );
extrahexaSubdomains=read_matrix_from_msolve_output( [example_path '\input_matlab\subdomain_elements\subdomainNeedsHexas.txt'],1 );
coheSubdomains=read_matrix_from_msolve_output( [example_path '\input_matlab\subdomain_elements\subdomainCohesiveElements.txt'],1 );


%reconstruct Subdomain data from files
nSubdomains=0;
position=1;
while(position<=size(hexaSubdomains,1))
nSubdomains=nSubdomains+1;
position=position+hexaSubdomains(position,1)+1;
end
subdHexaIds=cell(nSubdomains,1);
position=1;
SubdomainID=1;
while(position<=size(hexaSubdomains,1))

nSubElements=hexaSubdomains(position,1);
if (nSubElements==0)
subdHexaIds{SubdomainID,1}=zeros(1,2);
else
subdHexaIds{SubdomainID,1}=zeros(nSubElements,1);
for i1=1:1:nSubElements
subdHexaIds{SubdomainID,1}(i1,1)=hexaSubdomains(position+i1,1);
end
end

position=position+hexaSubdomains(position,1)+1;
SubdomainID=SubdomainID+1;
end

%extra hexa
nSubdomainsNeed=0;
position2=1;
while(position2<=size(extrahexaSubdomains,1))
nSubdomainsNeed=nSubdomainsNeed+1;
position2=position2+extrahexaSubdomains(position2,1)+1;
end
subdNeedsHexaIds=cell(nSubdomainsNeed,1);
position2=1;
SubdomainID=1;
while(position2<=size(extrahexaSubdomains,1))

nSubElements=extrahexaSubdomains(position2,1);
if (nSubElements==0)
subdNeedsHexaIds{SubdomainID,1}=zeros(1,2);
else
subdNeedsHexaIds{SubdomainID,1}=zeros(nSubElements,1);
for i1=1:1:nSubElements
subdNeedsHexaIds{SubdomainID,1}(i1,1)=extrahexaSubdomains(position2+i1,1);
end
end

position2=position2+extrahexaSubdomains(position2,1)+1;
SubdomainID=SubdomainID+1;
end

%shell elements
nShellSubdomains=0;
position=1;
while(position<=size(shellSubdomains,1))
nShellSubdomains=nShellSubdomains+1;
position=position+shellSubdomains(position,1)+1;
end
subdShell_Ids=cell(nShellSubdomains,1);
position=1;
SubdomainID=1;
while(position<=size(shellSubdomains,1))

nSubElements=shellSubdomains(position,1);
if (nSubElements==0)
subdShell_Ids{SubdomainID,1}=zeros(1,2);
else
subdShell_Ids{SubdomainID,1}=zeros(nSubElements,1);
for i1=1:1:nSubElements
subdShell_Ids{SubdomainID,1}(i1,1)=shellSubdomains(position+i1,1);
end
end

position=position+shellSubdomains(position,1)+1;
SubdomainID=SubdomainID+1;
end

initial_config=figure;
printSubdomainID=0;
hexaSubdomainID=0;
printSubd=true(size(subdHexaIds,1),1); printSubd(41,1)=true;
for subd=1:1:size(subdHexaIds,1)
printSubdomainID=printSubdomainID+1;
hexaSubdomainID=hexaSubdomainID+1;

if(printSubd(hexaSubdomainID,1))
    

%Print hexa subdomain elements

%ekkentrothta e.1
areHexaNodesUsed=zeros(komvoi_rve,1);
nUsedHexaNodes=0;

faces=zeros(4*size(subdHexaIds{hexaSubdomainID,1},1),4);
for i1=1:1:size(subdHexaIds{hexaSubdomainID,1},1)
hexaID=subdHexaIds{hexaSubdomainID,1}(i1,1);
[p1]=t_disp(hexaID,1);
[p2]=t_disp(hexaID,2);
[p3]=t_disp(hexaID,3);
[p4]=t_disp(hexaID,4);
[p5]=t_disp(hexaID,5);
[p6]=t_disp(hexaID,6);
[p7]=t_disp(hexaID,7);
[p8]=t_disp(hexaID,8);

faces(4*(i1-1)+1:4*(i1-1)+4,:)=[p1,p2,p3,p4; p5,p6,p7,p8; p4,p3,p7,p8; p1,p2,p6,p5];

%e.2
if areHexaNodesUsed(p1,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p1,1)=1; end
if areHexaNodesUsed(p2,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p2,1)=1; end
if areHexaNodesUsed(p3,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p3,1)=1; end
if areHexaNodesUsed(p4,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p4,1)=1; end
if areHexaNodesUsed(p5,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p5,1)=1; end
if areHexaNodesUsed(p6,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p6,1)=1; end
if areHexaNodesUsed(p7,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p7,1)=1; end
if areHexaNodesUsed(p8,1)==0; nUsedHexaNodes=nUsedHexaNodes+1; areHexaNodesUsed(p8,1)=1; end

end

if size(subdNeedsHexaIds{hexaSubdomainID,1},2)==1
faces=[faces;zeros(4*size(subdNeedsHexaIds{hexaSubdomainID,1},1),4)];
initial_size=4*size(subdHexaIds{hexaSubdomainID,1},1);

for i1=1:1:size(subdNeedsHexaIds{hexaSubdomainID,1},1)
hexaID=subdNeedsHexaIds{hexaSubdomainID,1}(i1,1);
[p1]=t_disp(hexaID,1);
[p2]=t_disp(hexaID,2);
[p3]=t_disp(hexaID,3);
[p4]=t_disp(hexaID,4);
[p5]=t_disp(hexaID,5);
[p6]=t_disp(hexaID,6);
[p7]=t_disp(hexaID,7);
[p8]=t_disp(hexaID,8);

faces(initial_size+4*(i1-1)+1:initial_size+4*(i1-1)+4,:)=[p1,p2,p3,p4; p5,p6,p7,p8; p4,p3,p7,p8; p1,p2,p6,p5];



end    




end

%e.3
usedHexasXYZ=zeros(nUsedHexaNodes,3);
thesi=1;
for i1=1:1:komvoi_rve
if areHexaNodesUsed(i1,1)==1    
usedHexasXYZ((thesi-1)+1,:)=o_x_rve(3*(i1-1)+1:3*(i1-1)+3,1)';    
thesi=thesi+1;
end
end
patch_ekk=1.5*mean(usedHexasXYZ);

Faces=faces;
rve_patch.Faces=Faces;

% dhmiourgia display gia undeformed
rve_patch.Vertices=zeros(komvoi_rve,3);
for i1=1:1:komvoi_rve
rve_patch.Vertices(i1,:)=o_x_rve(3*(i1-1)+1:3*(i1-1)+3,1)'+patch_ekk;
end

rve_patch.FaceColor = 'green';
rve_patch.Facealpha=0;
rve_patch.EdgeColor = 'black';
rve_patch.Edgealpha=0.3;

%initial_config=figure;
%patch(rve_patch);

rve_patch.FaceColor = 'green';
rve_patch.Facealpha=0;
rve_patch.EdgeColor = 'black';
rve_patch.Edgealpha=0.3;

%initial_config=figure;
patch(rve_patch);

%------------------------Perioxh Print shell-------------------------------
%--------------------------------------------------------------------------
if size(subdShell_Ids{printSubdomainID,1},2)==1

ShellElements=elem1(1,1)*elem2(1,1);
GrShElements=3*ShellElements;
hexaElements=hexa1*hexa2*hexa3;


subdShellsPerGrSh=zeros(n_graphene_sheets,1); %arithmos shell element ths subdomain ana GrSh

for i1=1:1:size(subdShell_Ids{printSubdomainID,1},1)
shellElemID=subdShell_Ids{printSubdomainID,1}(i1,1);
nGrSh=fix((shellElemID-hexaElements)/GrShElements)+1;
%nShell=shellElemID-hexaElements-(nGrSh-1)*GrShElements;

subdShellsPerGrSh(nGrSh,1)=subdShellsPerGrSh(nGrSh,1)+1;
end

faces_data=cell(n_graphene_sheets,1); %sundesmologia tewn shell element ths subdomain ana GrSh
for i1=1:1:n_graphene_sheets
faces_data{i1,1}=zeros(subdShellsPerGrSh(i1,1),8);
end

faces_data_thesi= ones(n_graphene_sheets,1); %vothitikos deikths gia gemisma twn stoixeiwn tou faces_data
for i1=1:1:size(subdShell_Ids{printSubdomainID,1},1)
shellElemID=subdShell_Ids{printSubdomainID,1}(i1,1);
nGrSh=fix((shellElemID-hexaElements)/GrShElements)+1;
nShell=shellElemID-hexaElements-(nGrSh-1)*GrShElements;
%IdentifyShelli
faces_data{nGrSh,1}(faces_data_thesi(nGrSh,1),1:8)=t_gs{nGrSh,1}(nShell,[1,5,2,6,3,7,4,8]);
faces_data_thesi(nGrSh,1)=faces_data_thesi(nGrSh,1)+1;
end

GrSh_patch.FaceColor = 'green';
GrSh_patch.Facealpha=0.35;
for i1=1:1:n_graphene_sheets
GrSh_patch.Vertices=zeros(size(o_xsunol_gs{i1,1},1)/6,3);
for i2=1:1:size(o_xsunol_gs{i1,1},1)/6
GrSh_patch.Vertices(i2,:)=o_xsunol_gs{i1,1}(6*(i2-1)+1:6*(i2-1)+3,1)'+patch_ekk;
end
GrSh_patch.Faces=faces_data{i1,1};
%IdentifyFailedElementLow
patch(GrSh_patch)
%faces_data{i1,1}=zeros(subdShellsPerGrSh(i1,1),8);
end

end
end
end %all subdomains

