function[StdVal]=CalculateStd(Vertices,n) % this is the tolerance value, the standard deviation of the converging values
    
    for i=1:n
        ValueArray(i)=Vertices(i).value;
    end
    StdVal=std(ValueArray,1);
    
end