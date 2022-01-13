% Developed by Fabrizio Bernardi 

% Correlation index between two neurons
% 
% INPUT --> Two binary vectors representing activity of two neurons, time
% interval dt to be considered for simultaneous activations, sampling
% frequency fs
% 
% OUTPUT --> Correlation index between two vectors obtained by formula

function c_index= corr_index(N1,N2,dt,fs)

T=length(N1)*fs;
N_AB =0;
for i=1:length(N1)
         
        N_A = sum(N1);

        N_B = sum(N2);
        
        if(i==1 && N1(1)==1 && N2(1)==1)
            N_AB = N_AB+1;
        end
        

        if(i==length(N1) && N1(end)==1 && N2(end)==1)
            N_AB = N_AB+1;
        end

        
            if(i+2 <= length(N1))
            if(N1(i+1) == 1 && N2(i)==1)
                N_AB = N_AB+1;
            end
             if(N1(i+1) == 1 && N2(i+2)==1)
                N_AB = N_AB+1;
             end
              if(N1(i+1) == 1 && N2(i+1)==1)
                N_AB = N_AB+1;
              end
            end
            
end
if(N_A*N_B ~= 0)

        c_index = (N_AB*T)/(N_A*N_B*2*dt);

else
      c_index = 0;
end

    
end
                




