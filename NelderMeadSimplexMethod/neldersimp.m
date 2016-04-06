function [y,val] = nmsimplex(x,eps)

%initial simplex
temp = eye(2);
for i=1:2
    temp(i,1:2) = temp(i,1:2) + 0.5*x;
end
x0 = [x;temp];

%value of initial simplex
val = zeros(3,1);
for i=1:3
    val(i) = f1(x0(i,1:2));
end

%sorting functional values
[val, index] = sort(val);

%centroid and worst vetrex
yc=zeros(1,2);
yr=y(index,1:2);
for i=1:3
    
end

end
