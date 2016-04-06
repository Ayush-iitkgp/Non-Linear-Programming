function [SortVertices]=BubbleSort(Vertices,n)
    
    while(n~=0)
        for i=1:n-1
            if(Vertices(i).value<=Vertices(i+1).value)
                continue;
            else
                temp=Vertices(i);
                Vertices(i)=Vertices(i+1);
                Vertices(i+1)=temp;
            end
        end
        n=n-1;          
    end
    SortVertices=Vertices;
    
end
