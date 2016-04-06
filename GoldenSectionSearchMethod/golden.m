%x = [-10:0.01:10];
%y = abs(x.^4-2*x.^2+x-9)-abs(x.^3-x+3);
%plot(x,y)
figure; hold on;

a=-10;                            % start of interval
b=10;                            % end of interval
epsilon=10^-20;              % accuracy value
ratio=double((sqrt(5)-1)/2);      % golden proportion coefficient, around 0.618
 
k = 0;   % iteration counter

fprintf('k=%d a=%f,%f, b=%f,%f\n',k,a,f(a),b,f(b));

plot(a,f(a),'rx');
plot(b,f(b),'rx');


while (abs(b-a)>epsilon)
    k=k+1;
    p(k)=b-ratio*(b-a);
    q(k)=a+ratio*(b-a);
    
    if(f(p(k))>= f(q(k)))
        a = p(k);
        plot(a,f(a),'rx');
    else
        b = q(k);
        plot(b,f(b),'rx')
    end
    fprintf('k=%d a=%f,%f, b=%f,%f\n',k,a,f(a),b,f(b));
end

fprintf('Number of iteration= %d\n',k);

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
