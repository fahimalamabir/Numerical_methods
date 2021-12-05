  function y= phi(x)
    global intp
    global ho
    % x= (k-1)*h+ 0.5*h;
    k = round(x/ho +0.5);
        y=exp(intp(k));
        return