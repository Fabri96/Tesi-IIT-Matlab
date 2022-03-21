clear all
close all

load('V_data.mat')
load('f_data.mat')

V([11 13 15 20 23],:)=[];
f([ 11 13 15 20 23],:) = [];

f=f(:,1:19769);
V=V(:,1:19769);

k=3; % subintervals in the signal

% vec= [1 5000 10000 15000 19769];
vec= [1 6600 13000  19769];

V_peaks=[];
f_peaks=[];

for i=1:size(V,1)

    for j=1:k
        clear p

      curr_V=V(i,vec(j):vec(j+1));
     p=findpeaks(curr_V,MinPeakHeight=mean(curr_V)+2*std(curr_V));
     if(isempty(p))
         i
     end
     

     V_avg = mean(p);
     V_peaks = [V_peaks V_avg];
    end
end

for i=1:size(f,1)

    for j=1:k
        clear pp

     curr_f = f(i,vec(j):vec(j+1));
     pp=findpeaks(curr_f,MinPeakHeight=mean(curr_f)+2*std(curr_f));
     if(isempty(pp))
         i
     end

     f_avg = mean(pp);
     f_peaks = [f_peaks f_avg];
    end
end


% for i=1:size(V,1)
% 
%     clear p
% 
%      curr_V = V(i,:);
%      p=findpeaks(curr_V,MinPeakHeight=mean(curr_V)+2*std(curr_V));
%      V_avg = mean(curr_V);
%      V_peaks = [V_peaks V_avg];
% 
% end
% 
% for i=1:size(f,1)
% 
%   
%         clear pp
% 
%      curr_f = f(i,:);
%      pp=findpeaks(curr_f,MinPeakHeight=mean(curr_f)+2*std(curr_f));
%      
% 
%      f_avg = mean(curr_f);
%      f_peaks = [f_peaks f_avg];
%     
% end
indices=find(f_peaks <0.2);
plot(V_peaks,f_peaks,'ro','MarkerSize',9)
xlabel('AP')
ylabel('\DeltaF/F')
title('AP peaks vs Ca peaks')
set(gca,'FontSize',15)