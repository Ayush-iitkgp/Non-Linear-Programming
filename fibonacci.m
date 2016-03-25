figure; hold on;

a=-10;                            % start of interval
b=10;                            % end of interval
epsilon=10^-20;              % accuracy value
k=0;                           % number of iterations


fprintf('k=%d a=%f,%f, b=%f,%f\n',k,a,f(a),b,f(b));

plot(a,f(a),'rx');
plot(b,f(b),'rx');

i=1;
F=1;
while F<=(b-a)/epsilon
    F=fib(i);
    i=i+1;
end

%Initialize values
n=i-1;
k = 1;

while (k<=n)
    
    p(k)=b-(f(n-k)/f(n-k+1))*(b-a);
    q(k)=a+(f(n-k)/f(n-k+1))*(b-a);
    
    if(f(p(k))>= f(q(k)))
        a = p(k);
        plot(a,f(a),'rx');
    else
        b = q(k);
        plot(b,f(b),'rx')
    end
    fprintf('k=%d a=%f,%f, b=%f,%f\n',k,a,f(a),b,f(b));
    k=k+1;
end

fprintf('Number of iteration= %d\n',n);



%fprintf('Number of iteration= %d\n',k);

% chooses minimum point
if(f(a)<f(b))
    fprintf('x_min= %f\n', a);
    fprintf('f(x_min)=%f\n', f(a));
    plot(a,f(a),'ro');
else
    fprintf('x_min=%f\n', b);
    fprintf('f(x_min)=%f\n', f(b));
    plot(b,f(b),'ro');
end
