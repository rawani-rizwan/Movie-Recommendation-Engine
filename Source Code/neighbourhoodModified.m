function [neighbourhood_matrix,neighbour_weight] = neighbourhoodModified( similarity_matrix )
% This function generates the neighbourhood using aggregate neighbourhood
% method


neighbourhood_matrix = zeros(length(similarity_matrix),25);
neighbour_weight = zeros(length(similarity_matrix),25);

for i =1:length(similarity_matrix)
    tmp = similarity_matrix;
    [c,index] = max(tmp(i,:));
    neighbourhood_matrix(i,1)=index;
    neighbour_weight(i,1)=c;
    tmp(i,index)=-inf;
    tmp(index,i)=-inf;
    centroid = [tmp(i,:);tmp(index,:)];
    for j =2:25
          
        [c,index] = max(mean(centroid));
        neighbourhood_matrix(i,j)=index;
        neighbour_weight(i,j)= tmp(i,index);
        centroid(1,index)=-inf;
        tmp(index,i)=-inf;
        tmp(i,index)=-inf;
        for k=2:j
            centroid(k,index) = -inf;
            tmp(index,neighbourhood_matrix(i,k-1))=-inf;
            tmp(neighbourhood_matrix(i,k-1),index)=-inf;
        end
        
        centroid = [centroid;tmp(index,:)];
            
    end
    
end

end

