I1=imread('tigre.jpg');
s=size(I1);
I=zeros(s(1), s(2), 3);
% Convertir la imagen a modo matriz 3D
I(:,:,1)= I1(:,:,1);
I(:,:,2)= I1(:,:,2);
I(:,:,3)= I1(:,:,3);

s=size(I);
new_image=zeros(s);
num_rows= s(1); 
num_cols=s(2);
num_elems = num_rows * num_cols;

%Convertir a vector la matriz con la imagen
A = I(:);
%Hacer un vector para cada color
Red = A(1:num_elems);
Green = A(num_elems+1 : num_elems*2);
Blue = A( (num_elems*2 + 1) : num_elems*3 );

Features = Create_Features(num_elems,num_rows,Red,Blue,Green);

Centroids=init_centroids(Feature_Norm, K, num_elems);
Asignacion = KMEANS(Centroids,Feature_Norm);


