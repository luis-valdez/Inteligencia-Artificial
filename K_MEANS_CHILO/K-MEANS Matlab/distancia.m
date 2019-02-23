function [dist]=distancia(SAMPLES2, Centroids, numSample, numCentroide)
dist=0;
for i=1 : size(SAMPLES2,2)
        dist = dist + ( SAMPLES2(numSample,i) - Centroids(numCentroide,i) )^2;
end