function [Features]=Create_Features(num_elems,num_rows,Red,Blue,Green)
Features=zeros(num_elems,5);
x=1;
y=1;
%Llenar x y R G B
for i=1 : num_elems
    Features(i,1) = x;
    Features(i,2) = y;
    Features(i,3) = Red(i);
    Features(i,4) = Green(i);
    Features(i,5) = Blue(i);
    y=y+1;
    if(mod(i,num_rows)==0)
        x=x+1;
        y=1;
    end
end