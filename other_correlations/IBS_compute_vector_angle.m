function vec_angle = IBS_compute_vector_angle(V1,V2)
%IBS_compute_vector_angle function to compute angle between 2 vectors
%
% SYNOPSIS: IBS_compute_vector_angle
%
% INPUT 
%       V1, V2 - the two vectors
% OUTPUT 
%
% REMARKS
%
% created with MATLAB ver.: 9.8.0.1359463 (R2020a) Update 1 on Microsoft Windows 10 Pro Version 10.0 (Build 19042)
%
% created by: Atesh
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% normalize to unit length
V1 = V1 - nanmean(V1);
V2 = V2 - nanmean(V2);


V1 = normalize(V1,'norm');
V2 = normalize(V2,'norm');


vec_angle = atand(V2./V1) +45;

vec_angle(vec_angle>90) = 180-vec_angle(vec_angle>90);



vec_angle = abs(vec_angle./90);

end




