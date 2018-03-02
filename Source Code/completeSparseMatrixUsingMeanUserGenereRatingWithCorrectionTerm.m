function [modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRatingWithCorrectionTerm(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating )
% This function completes the sparse rating matrix with expected ratings
% (calculated using movie genre information and mean genre ratings of that
% user) along with a correction term

modified_rating_matrix = rating_matrix;
expected_movie_rating = rating_matrix;
s1 = size(mean_user_genre_rating);
s2 = size (movie_genre);

for i = 1: s1(1)
    for j=1:s2(1)
        sum=0;
        count=0;
        for k=1:s2(2)
            if movie_genre(j,k)==1
                sum=sum+mean_user_genre_rating(i,k);
                count=count+1;
            end
        end
        if count==0
            expected_movie_rating(i,j)= mean_user_rating(i);
          
        else
            expected_movie_rating(i,j)=sum/count;
           
       
        end
        
    end
end

                
s = size (rating_matrix);
for i = 1 : s(1)
    for j = 1 : s(2)
        if isnan(rating_matrix(i,j))
            sum =0;
            count =0;
            for k = 1 : s(1)
                if ~isnan(rating_matrix(k,j))
                    correction_k = rating_matrix(k,j) - expected_movie_rating(k,j);
                    count = count + 1 ;
                    sum = sum + correction_k;
                end
            end
            if count == 0
                modified_rating_matrix(i,j) = expected_movie_rating(i,j);
            else
                modified_rating_matrix(i,j) = expected_movie_rating(i,j) + (sum/count);
            end
        end
    end
end

end

