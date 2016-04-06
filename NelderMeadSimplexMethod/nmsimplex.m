function [z,k] = nmsimplex(x,eps)

%initial simplex
z=zeros(500,4);
temp = repmat(x,2,1)+eye(2);
x0 = [x;temp];
k=1;

%value of initial simplex
val = zeros(3,1);
for i=1:3
    val(i) = f1(x0(i,1:2));
end


while (dist(x0)>eps&&k<500)
   
    t=[x0;x0(1,:)];
    plot(t(:,1),t(:,2));
    pause(0.1);
    k=k+1;
    %sorting functional values
    [val, index] = sort(val);
    l=index(1);h=index(3);

    %centroid and worst vetrex
    yb=x0(l,1:2);
    yw=x0(h,1:2);
    z(k,1:3)=[yb,f1(yb)];
    yc=sum(x0);
    yc=(yc-yw)/2;

    yr=yc+(yc-yw);
    fr=f1(yr);

    %reflection
    if(val(1)<=fr && fr<val(2))
        z(k,4)=1;
        x0(h,1:2)=yr;
    end

    %expansion
    if(fr<val(1))
        ye=yc+2*(yc-yb);
        fe=f1(ye);
        if(fe<=fr)
            z(k,4)=2;
            x0(h,1:2)=ye;
        else
            z(k,4)=1;
            x0(h,1:2)=yr;
        end
        continue;
    end
    
    %contraction
    if(fr>=val(2))
        %Outside
        if(fr<val(3))
            yoc=yc+0.5*(yc-yb);
            foc=f1(yoc);
            if(foc<fr)
                z(k,4)=3;
                x0(h,1:2)=yoc;

            else
                %srink
                z(k,4)=5;
                t=x0(l,1:2);
                temp = 0.5*(repmat(t,2,1)-x0(2:3,1:2));
                x0 = [t;temp];
            end
        end

        %Inside
        if(fr>=val(3))
            yic=yc+0.5*(yw-yc);
            fic=f1(yic);
            if(fic<val(3))
                z(k,4)=4;
                x0(h,1:2)=yic;
            else
                %srink
                z(k,4)=5;
                t=x0(index(1),1:2);
                temp = 0.5*(repmat(t,2,1)-x0(2:3,1:2));
                x0 = [t;temp];            
            end
        end
    end
        val = zeros(3,1);
        for i=1:3
            val(i) = f1(x0(i,1:2));
        end
end

end