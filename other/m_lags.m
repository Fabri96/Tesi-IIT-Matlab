function mm_lags = m_lags(data1,data2,data3,data4,alpha)
mm_lags=0;
for i=1:60
    max_lag = i;
    [F1,c_v1] = granger_cause(data1,data2,alpha,max_lag);
    [F2,c_v2] = granger_cause(data3,data4,alpha,max_lag);
    if (F1>c_v1 && F2<c_v2 )
        mm_lags=i;
    end
end
