function Firing_corr = firing_correlation(a,b,T,dt)

Na = sum(a);

Nb = sum(b); 

Nab = 0;

for i = 2:size(a,1)
    if(a(i)==1)
        Nab = Nab + b(i-1)+b(i)+b(i+1);
    end
end

Firing_corr = (Nab*T)/(Na*Nb*2*dt);