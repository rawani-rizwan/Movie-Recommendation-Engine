function  modified_rating_matrix = CompleteSparseMatrixUsingMeanMovieRating( rating_matrix,mean_movie_rating )
% This function completes the sparse rating matrix with mean movie ratings
modified_rating_matrix = rating_matrix;
s = size (rating_matrix);
for i = 1 : s(2)
    for j = 1 : s(1)
        if isnan(rating_matrix(j,i))
            modified_rating_matrix(j,i) = mean_movie_rating(i);
        end
    end
end

end

