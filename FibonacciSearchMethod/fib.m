function y=fib(n)
%Generates fibonacci numbers
z(1)=1;z(2)=1;
for k=3:n
    z(k)=z(k-1)+z(k-2);
end
y=z(n);