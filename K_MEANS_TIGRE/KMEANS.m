function [Asignacion]=KMEANS(Centroids,Samples)
%Inicializamos variables
num_samples = size(Samples,1);
K = size(Centroids,1);
Asignacion=zeros(num_samples,1);
Distancias=zeros(num_samples,K);
CentroidesDiferentes=true;

%Mientras los centroides sean diferentes sigue trabajando
while(CentroidesDiferentes)
    
    %Sacamos Asignacion y Distancias
    %Recorremos el num de samples (633)
    for i=1 : num_samples
        %Setteamos un valor alto en distMinima para que tome el primer
        %valor
        distanciaMinima=999999999999;
        
        %Recorremos el num de centroides
        for j=1 : K
            %Calculamos la distancia entre el centroide j y el sample i
            distanciaActual = distancia(Samples, Centroids, i, j);
            Distancias(i,j) = distanciaActual;
            %Al encontrar la distancia minima del centroide j a nuestro sample
            %(puede ocurrir varias veces)
            % cambiamos la asignacion de nuestro sample i
           if(distanciaMinima > distanciaActual )
             distanciaMinima = distanciaActual;
             Asignacion(i,1) = j;
           end  
        end
    end

    %Sacamos CentroidsNew:
    CentroidsNew=zeros(size(Centroids));
    for i=1 : K
        %Conseguimos los indices donde se encuentran asignados los 8 centroides
        indx = find(Asignacion==i);

        %Recorremos todos los indices que encontramos con el K en cuestion
        for j=1 : length(indx)
            %Sumamos en CentroidsNew los samples que le corresponden al
            %centroide (suma de vectores)
            CentroidsNew(i,:)= CentroidsNew(i,:) + Samples (indx(j,:),:);

        end

        %Dividir CentroidsNew entre el numero de Samples que se encontraron
        %para ese centroide
        CentroidsNew(i,:) = CentroidsNew(i,:)/length(indx);
    end

    %Comprobamos si los Centroides han cambiado
    if (Centroids == CentroidsNew)
        CentroidesDiferentes=false;
    end
    %Nos preparamos para otra iteracion en caso de, ya que CentroidsNew
    %albergara los nuevos centroides
    Centroids=CentroidsNew;
end
