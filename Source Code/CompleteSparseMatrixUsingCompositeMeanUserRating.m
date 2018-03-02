function modified_rating_matrix = CompleteSparseMatrixUsingCompositeMeanUserRating(rating_matrix,mean_user_rating )
% This function completes the initial sparse  rating matrix
% using the corresponding mean user ratings along with a correction
% term. 
modified_rating_matrix = rating_matrix;
s = size (rating_matrix);
for i = 1 : s(1)
    for j = 1 : s(2)
        if isnan(rating_matrix(i,j))
            sum =0;
            count =0;
            for k = 1 : s(1)
                if ~isnan(rating_matrix(k,j))
                    correction_k = rating_matrix(k,j) - mean_user_rating(k);
                    count = count + 1 ;
                    sum = sum + correction_k;
                end
            end
            if count == 0
                modified_rating_matrix(i,j) = mean_user_rating(i);
            else
                modified_rating_matrix(i,j) = mean_user_rating(i) + (sum/count);
            end
        end
    end
end

end

