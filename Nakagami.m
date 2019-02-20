function  [x,F_p]=Nakagami(Pr,m)
    len=1e5;                                  %point density
    x = linspace(0,3.5*len/1e5,len+1);          %set lim and interval
    dt=x(2)-x(1);                               %calculate dt in order to sum up
    f_p=(2.*m.^m.*x.^(2.*m-1))./(gamma(m).*Pr^m).*exp(-m.*x.^2/Pr); % PDF
    s=length(x);                                %sample length 
    for i = 1:s
        F_p(i)=sum(f_p(1:i))*dt;                % sum up with small interval instead of integrate
    end
end