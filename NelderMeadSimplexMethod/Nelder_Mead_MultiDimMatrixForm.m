%value of n should be modified; n= no of independent variables +1

function [Minima]=Nelder_Mead_MultiDimMatrixForm()
clc;

StdVal=10; %any value for convergence

n=3; %value of N+1
P=1; %reflection coefficient
Chi=2; %expansion coefficient
Gamma=0.5; %contraction coefficient
Sig=0.5; %shrink coefficient

SortVertices = CreateInitialSimplex(n);
tic;
i=1;
minmas=0;
while(StdVal >= 0.00001)
   
    SortVertices = BubbleSort(SortVertices,n);
    Centroid = CalculateCentroid(SortVertices,n);
    StdVal = CalculateStd(SortVertices,n);
    minmas(i)=SortVertices(1).value; i=i+1;
%     Simplex_2D(SortVertices); drawnow; 
    
    Reflect.coord = (1+P).*Centroid.coord - P.*SortVertices(n).coord; %Reflect
    Reflect.value = f(Reflect);
     
    if(SortVertices(1).value <= Reflect.value && Reflect.value < SortVertices(n-1).value)
        SortVertices(n)=Reflect;
        continue; %if the above criterion is sattisfied, then terminate the iteration
    end
    
    if(Reflect.value < SortVertices(1).value) %Expand
        
        Expand.coord = (1-Chi).*Centroid.coord+Chi.*Reflect.coord;
        Expand.value = f(Expand);
        
        if(Expand.value < Reflect.value)
            
            SortVertices(n) = Expand;
            continue;
        else
            SortVertices(n) = Reflect;
            continue;
        end 
    end
    
    if(SortVertices(n-1).value <= Reflect.value) %Contract
                  
            ContractOut.coord = (1-Gamma).*Centroid.coord + Gamma.*Reflect.coord; %Contract Outside
            ContractOut.value = f(ContractOut);
            
            ContractIn.coord = (1-Gamma).*Centroid.coord + Gamma.*SortVertices(n).coord;  %Contract Inside
            ContractIn.value= f(ContractIn);
            
            if(SortVertices(n-1).value <= Reflect.value && Reflect.value < SortVertices(n).value && ContractOut.value <= Reflect.value)
                SortVertices(n) = ContractOut;
                continue;
            elseif(SortVertices(n).value <= Reflect.value && ContractIn.value < SortVertices(n).value) %Contract Inside
                SortVertices(n) = ContractIn;
                continue;
            else
                for i=2:n
                    SortVertices(i).coord = (1-Sig).*SortVertices(1).coord + Sig.*SortVertices(i).coord;
                    SortVertices(i).value = f(SortVertices(i));   
                end
            end
    end    
end
toc
Minima=SortVertices(1);
% plot(minmas);
% a=text(50,250, strcat('No: of iterations =  ', num2str(i)));
% set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 18, 'Color', 'red');
% xlabel('iterations');
% ylabel('error');
% title('Error Vs Iterations');
end

