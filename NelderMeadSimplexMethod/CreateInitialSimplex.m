function [Vertices]=CreateInitialSimplex(n)

    ExpectMin=rand((n-1),1).*50;
    Vertices(1).coord=ExpectMin; % expected minima
    Vertices(1).value=f(Vertices(1));
    for i=2:n
        Vertices(i).coord=ExpectMin+50.*rand((n-1),1); %100 is the scale factor
        Vertices(i).value=f(Vertices(i));
    end
    
end