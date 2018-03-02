function mean_movie_rating = getMeanMovieRatings( rating_matrix )
% Function to calculate mean ratings of movies

s=size(rating_matrix);
mean_movie_rating = zeros(s(2),1);

for i = 1 : s(2)
    sum=0;
    count =0;
    for j = 1 : s(1)
        if ~isnan(rating_matrix(j,i)) 
          sum = sum +  rating_matrix(j,i);
          count = count+1;
        end
    end
    mean_movie_rating(i) = sum/count;
end



end


