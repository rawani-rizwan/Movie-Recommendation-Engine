function mean_user_rating = getMeanUserRatings( rating_matrix )
% This function calculates the mean ratings given by users

s=size(rating_matrix);
mean_user_rating = zeros(s(1),1);

for i = 1 : s(1)
    sum=0;
    count =0;
    for j = 1 : s(2)
        if ~isnan(rating_matrix(i,j)) 
          sum=sum+  rating_matrix(i,j);
          count =count+1;
        end
    end
    mean_user_rating(i) = sum/count;
end



end

