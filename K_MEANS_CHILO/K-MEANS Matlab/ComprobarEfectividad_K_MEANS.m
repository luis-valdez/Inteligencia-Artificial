%Recorrer centroides en Labels para comparacion
for i=1 : K
    %Recorrer centroides en Asignacion para comparacion
    for c=1 : K
        PorcentajeCoincidencia=0;
        mapLabels = SAMPLES_FIXED_Kmeans_Labels==i;
        
        mapAsignacion = Asignacion==c;
        %Indices del centroide de Labels con el que estamos
        %trabajando
        indxLabels = find(SAMPLES_FIXED_Kmeans_Labels==i);
        for j=1 : num_samples
            if(mapLabels(j,1) == 1 && mapAsignacion(j,1) == 1)
                PorcentajeCoincidencia = PorcentajeCoincidencia + 1;          
            end
        end
        EquivalenteAsignacionLabels(i,c) = PorcentajeCoincidencia / length(indxLabels) ;
    end
   efectividad(i,1) = max(EquivalenteAsignacionLabels(i,:));
end
