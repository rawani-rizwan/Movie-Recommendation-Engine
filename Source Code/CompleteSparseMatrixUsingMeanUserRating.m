function modified_rating_matrix = CompleteSparseMatrixUsingMeanUserRating( rating_matrix,mean_user_rating )
% This function completes the sparse rating matrix using corresponding mean
% user ratings.

modified_rating_matrix = rating_matrix;
s= size (rating_matrix);
for i = 1 : s(1)
    for j = 1 : s(2)
        if isnan(rating_matrix(i,j))
            modified_rating_matrix(i,j) = mean_user_rating(i);
        end
    end
end


end

