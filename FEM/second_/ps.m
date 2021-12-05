        function y= ps(x)
           global intp
    global ho
    k = round(x/ho +0.5);
        y= exp(intp(k))*q(x);
            return