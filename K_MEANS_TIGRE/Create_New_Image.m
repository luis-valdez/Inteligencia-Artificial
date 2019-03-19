function [new_image]=Create_New_Image(I, Asignacion, CentroidsDenormalized,num_rows)
new_image = size(I);
x=1;
y=1;
for i = 1 : size(Asignacion)
    %Crear el valor de R G B, para el pixel en el que nos encontremos
    R = CentroidsDenormalized(Asignacion(i), 3);
    G = CentroidsDenormalized(Asignacion(i), 4);
    B = CentroidsDenormalized(Asignacion(i), 5);
    %Asignamos ese valor a cada una de las capas de nuestra nueva imagen
    new_image(y,x,1) = R;
    new_image(y,x,2) = G;
    new_image(y,x,3) = B;
    
    y=y+1;
    if(mod(i,num_rows)==0)
        x=x+1;
        y=1;
    end
end