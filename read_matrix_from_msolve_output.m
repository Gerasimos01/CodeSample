function [ Data_Msolve ] = read_matrix_from_msolve_output( file_nam,n_columns )
%[ Data_Msolve ] = read_matrix_from_msolve_output( file_nam,n_columns )
%   Detailed explanation goes here

string1='%f ';
string2='%f ';
for j1=1:1:n_columns-1
    string2=strcat(string2,string1);
end


fileID = fopen(file_nam);
DATA_res=textscan(fileID,string2);
fclose(fileID);

Data_Msolve=zeros(size(DATA_res{1,1},1),size(DATA_res,2));

for j1=1:1:size(DATA_res,2)
    %Data(:,j1)=DATA_res{1,j1};
    Data_Msolve(1:size(DATA_res{1,j1},1),j1)=DATA_res{1,j1};
end

end

