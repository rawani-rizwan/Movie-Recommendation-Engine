function [modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRating(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating )
% This function completes the initial rating matrix with expexted ratings
% of movies based on their genres and mean genre ratings by that user.

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
            if isnan(rating_matrix(i,j))
                modified_rating_matrix(i,j)= mean_user_rating(i);
            end
        else
            expected_movie_rating(i,j)=sum/count;
            if isnan(rating_matrix(i,j))
                modified_rating_matrix(i,j)=sum/count;
            end
       
        end
        
    end
end

                


end

