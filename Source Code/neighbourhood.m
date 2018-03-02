function [neighbourhood_matrix,neighbour_weight] = neighbourhood( similarity_matrix )
% This function generates the neighbourhood of users (top k neighbours)

tmp = similarity_matrix;
neighbourhood_matrix = zeros(length(tmp),25);
neighbour_weight = zeros(length(tmp),25);
for i =1:length(tmp)
    for j =1:25
        [c,index] = max(tmp(i,:));
        neighbourhood_matrix(i,j)=index;
        neighbour_weight(i,j)=c;
        tmp(i,index)=-inf;
        
    end
end

end

