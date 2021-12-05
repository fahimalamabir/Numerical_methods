function y = f(x)
   global intp
    global ho
    k = round(x/ho +0.5);
        y=exp(intp(k))*r(x);

return