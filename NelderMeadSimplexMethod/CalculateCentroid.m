function [Centroid]=CalculateCentroid(Vertices,n)
    
    Sum=zeros((n-1),1);
    for i=1:n-1
        Sum=Sum+Vertices(i).coord;
    end
    Centroid.coord=Sum./(n-1);
    Centroid.value=f(Centroid);
    
end