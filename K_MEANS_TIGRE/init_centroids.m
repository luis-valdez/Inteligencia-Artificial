function [Centroids]=init_centroids(Feature_Norm, K, num_elems)
Randoms = randperm(num_elems,K);
Centroids = zeros(K,size(Feature_Norm,2));
for i=1 : K
    Centroids(i,:) = Feature_Norm(Randoms(i),:);
end