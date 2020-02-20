%    load_and_calculate_data

%load('discretization_data.mat');

% general_path='RVE_database\rve_no_1\generated_ox_sunol_vecs\';
% general_path='C:\Users\acivi\Documents\notes_elegxoi\REFERENCE_kanonikh_gewmetria_fe2_post_dg\2d_alteHSTAM\';
path_setup
general_path=[example_path '\input_matlab\geometry_model\generated_ox_sunol_vecs\'];

addpath(general_path) %input
fileID = fopen([example_path '\input_matlab\geometry_model\generated_ox_sunol_vecs\extracted_data2.txt']);
montelo_graphene_generated
[ o_xsunol_gs ] = ReadMatricesWithCounter( 1 ,[general_path 'o_xsunol_generated_gs_'],2,'',1 ); %input 

[Cons_disp,t_disp,gp_d1_disp,gp_d2_disp,gp_d3_disp,o_x_rve,t_u_rve,t_x_rve,f_komvoi_rve,p_komvoi_rve,V_anad_hexa,Dq,komvoi_rve ] = montelo_rve( cycles,E_disp,ni_disp,L01,L02,L03,hexa1,hexa2,hexa3 );
% string_tlk=[string1,'REF_o_xsunol_gs_MATLAB.mat'];
% load(string_tlk)
n_graphene_sheets=size(o_xsunol_gs,1);
kuvos=(hexa1-1)*(hexa2-1)*(hexa3-1);
endiam_plaka=2*(hexa1+1)+2*(hexa2-1);
katw_plaka=(hexa1+1)*(hexa2+1);



elem1=elem1*ones(n_graphene_sheets,1); %
elem2=elem2*ones(n_graphene_sheets,1); %
elements=zeros(n_graphene_sheets,1);
komvoi_8=zeros(n_graphene_sheets,1);
% lines=zeros(n_graphene_sheets,1);
% rows=zeros(n_graphene_sheets,1);

% tk_1=tk(1,1);
% tk=cell(n_graphene_sheets,1);
% for i1=1:1:n_graphene_sheets
% tk{i1,1} = tk_1*ones(elem1(i1,1)*(3*elem2(i1,1)+2)+2*elem2(i1,1)+1,1);
% end

%create_random_data_for_geom  %TYXAIA DEDOMENA
%EXEI GINEI COPY PARAKATW

% copy apo to kyriws arxeio apla gia upologismo elements kai loipa
for i1=1:1:n_graphene_sheets
[ ~,~,~,~,~,~,~,elements(i1,1),~,komvoi_8(i1,1),~,~ ] = montelo_shell( elem1(i1,1),elem2(i1,1),E,ni );
%[ V_anad,Cons,gp_d1,gp_d2,gp_d3,lines,rows,elements,fdof_8,komvoi_8,dof_8,e2 ] = montelo_shell( elem1,elem2,E,ni );
end


%-----------1 Gewmetries kai t sundesmologies shell -----------------------
%copy diastaseis apo topologia shell coh
t_gs=cell(n_graphene_sheets,1);
for i1=1:1:n_graphene_sheets
[ t_gs{i1,1},~ ]= topologia_shell_coh( elements(i1,1),elem1(i1,1),elem2(i1,1),komvoi_8(i1,1) );
%[ t_gs(:,:,i1),t_coh ]= topologia_shell_coh( elements,elem1,elem2,komvoi_8 );
end
