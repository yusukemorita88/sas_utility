data lognormal;
    call streaminit(2020);
    /* specify mean and variance of Y */
    m = 10; 
    v = 10*10;

    phi = sqrt(v + m**2);
    mu    = log(m**2/phi);
    sigma = sqrt(log(phi**2/m**2));
    do i = 1 to 10000;
       x = rand('Normal', mu, sigma);
       y = exp(x);
       output;
    end;
run;

ods select Moments Histogram ParameterEstimates;
proc univariate data=lognormal;
   var y;
   histogram y / lognormal(zeta=EST sigma=EST);
run;
