function  [x,F_p,sum_F_p]=Rayleigh(sigma)
    len=1e5;                                  %point density
    x = linspace(0,14*len/1e5,len+1);          %set lim and interval
    dt=x(2)-x(1);                               %calculate dt in order to sum up
    f_p=x./(sigma).^2.*(exp(-x.^2./2./(sigma).^2));  % PDF
    s=length(x);                                  %sample length    
    for i = 1:s
        sum_F_p(i)=sum(f_p(1:i))*dt;             % sum up with small interval instead of integrate
    end
    F_p=1-(exp(-x.^2./2./(sigma).^2));          %provided CDF, just use it to validate my sum-up method
end