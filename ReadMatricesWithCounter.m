function [ Matrices ] = ReadMatricesWithCounter( count_start,string_name1,count_end,string_name2,dimension2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

file_extension='.txt';
dimension=count_end-count_start+1;
Matrices=cell(dimension,1);

i2=count_start;
for i1=1:1:dimension
    
%count_start:1:count_end

str1=strcat(string_name1,num2str(i2),string_name2,file_extension);
% a=load( str1);
% Matrices{i1,1} = spconvert(a);


Matrices{i1,1} =read_matrix_from_msolve_output( str1,dimension2 );
i2=i2+1;
end

end

