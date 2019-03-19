function [CentroidsDenormalized]=DenormalizeCentroids(Centroids, Features)
CentroidsDenormalized=zeros(size(Centroids));
for i=1 : size(Centroids,2)
    Xmax = max(Features(:,i));
    Xmin = min(Features(:,i));
        for j=1 : size(Centroids,1)
            X = Centroids(j,i);
            CentroidsDenormalized(j,i) = (X * (Xmax - Xmin)) + Xmin;
        end
end