function  [x,G_p]=Rice(Pr,K)
    len=1e5;                                  %point density
    x = linspace(0,3.5*len/1e5,len+1);          %set lim and interval
    dt=x(2)-x(1);                                %calculate dt in order to sum up
    f_p=(2.*x.*(K+1))./(Pr).*(exp(-K-((K+1).*x.^2)./Pr)).*besseli(0,2.*x.*sqrt(K.*(K+1)./Pr)); % PDF
    s=length(x);                                %sample length 
    for i = 1:s
        G_p(i)=sum(f_p(1:i))*dt;                % sum up with small interval instead of integrate
    end
end