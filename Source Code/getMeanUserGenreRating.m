function mean_user_genre_rating = getMeanUserGenreRating(rating_matrix,mean_user_rating,movie_genre)
% This function calculates the mean genre ratings of various genres by the
% various users

s1=size(movie_genre);
s2=size(mean_user_rating);
mean_user_genre_rating = zeros(s2(1),s1(2));
for i = 1:s2(1)
    for j = 1:s1(2)
        sum=0;
        count=0;
        for k = 1 : s1(1)
            if ~isnan(rating_matrix(i,k))
                if movie_genre(k,j)==1
                    sum=sum+rating_matrix(i,k);
                    count=count+1;
                end
            end
        end
        if count ==0
            mean_user_genre_rating(i,j) = mean_user_rating(i);
        else
            mean_user_genre_rating(i,j) = sum/count;
        end
    end
end



end

