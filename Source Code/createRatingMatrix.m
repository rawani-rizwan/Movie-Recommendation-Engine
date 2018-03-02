function rating_matrix=createRatingMatrix
% This functin creates the initial rating matrix

rating = load ('data/u1.base');
rating_matrix = NaN([max(rating(:,1)),max(rating(:,2))]);

for i =1:(length(rating)) 
    rating_matrix(rating(i,1),rating(i,2)) = rating(i,3);
end

end