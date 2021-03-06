function [value]=f(V) %Write your function in matrix form
%in case of any of the three trial functions un comment two lines   
    x=V.coord(1); y=V.coord(2);  %Rosenbrock's Function
    value=(1-x)^2+100*(y-x^2)^2;
    
%    x1=V.coord(1);x2=V.coord(2);x3=V.coord(3);x4=V.coord(4); %Powell's Quadratic Function
%    value=(x1+10*x2)^2+5*(x3-x4)^2+(x2-2*x3)^4+10*(x1-x4)^4;
      
%    x1=V.coord(1); x2=V.coord(2); x3=V.coord(3); %Fletcher and Powell's Helical Valley Function
%     theta=atan2(x1,x2);
%     value=100*(x3-10*theta)^2+(sqrt(x1^2+x2^2)-1)^2+x3^2;
    
%   value=([1,-1;0,1]*V.coord-[4;1])'*V.coord; %f(x,y)=x^2-4*x+y^2-y-x*y;
%   value=([1,0,-1;0,1,0;1,0,1]*V.coord-[3;10;-7])'*V.coord; %f(x,y,z)=x^2+y^2+z^2-3*x-10*y+7
    
end