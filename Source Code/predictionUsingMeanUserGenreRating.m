function [ predicted_ratings ] = predictionUsingMeanUserGenreRating( rating_matrix, mean_rating, neighbourhood_index, neighbourhood_weight,expected_movie_rating )
% This funcion predits the ratings of unrated items (equation modified to incorporate movie genre information)

predicted_ratings = rating_matrix ;
s = size(predicted_ratings);
sz = size(neighbourhood_index);

for i = 1 : s(1)
    for j = 1 : s(2)
        if(isnan(rating_matrix(i,j)))
            sum1=0;
            sum2=0;
            for k = 1 : sz(2)
                index = neighbourhood_index(i,k);
                if(~isnan(rating_matrix(index,j)))
                    sum2 = sum2 + abs(neighbourhood_weight(i,k));
                    sum1 = sum1 + (rating_matrix(index,j) - expected_movie_rating(index,j)) * neighbourhood_weight(i,k);
                end
            end
            if sum2 == 0
                predicted_ratings(i,j) = expected_movie_rating(i,j) ;
            else
                predicted_ratings(i,j) = expected_movie_rating(i,j) + sum1/sum2 ;
            end
        end
    end
end

predicted_ratings = round(predicted_ratings);

end

