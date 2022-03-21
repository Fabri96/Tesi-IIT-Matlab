function y = voltage_stimulus(t1, t2, t3, t, V1, V2, Veq)
%
if ((t > t1) & (t <=t2))
   y = V1;
elseif ((t > t2) & (t <=t3))
   y = V2;
else
   y = Veq;
end
%
return
