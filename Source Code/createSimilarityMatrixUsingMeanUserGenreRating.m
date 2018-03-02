function similarity_matrix = createSimilarityMatrixUsingMeanUserGenreRating(rating_matrix,expected_movie_rating )
% This function creates matrix to store similarity betwwen users 
% (our method incorporating movie genre information)

s=size(rating_matrix);
similarity_matrix = zeros(s(1));

for i = 1 : s(1)
    for j= i+1 : s(1)
        sum1=0;
        sum2=0;
        sum3=0;
        for k = 1:s(2)
            if ~isnan(rating_matrix(i,k)) && ~isnan(rating_matrix(j,k))
                deviation_i = rating_matrix(i,k) - expected_movie_rating(i,k);
                deviation_j = rating_matrix(j,k) - expected_movie_rating(j,k);
                sum1 = sum1 + deviation_i*deviation_j;
                sum2=sum2 + deviation_i*deviation_i;
                sum3=sum3 + deviation_j*deviation_j;
            end
        end
      similarity_matrix(i,j)=(sum1)/sqrt(sum2*sum3)  ;
      similarity_matrix(j,i)= similarity_matrix(i,j)  ;
      
    end
end



end

