function mae = error_calculation( predicted_rating )
% This function calculates the prediction errors (MAE) on the test set

rating = load ('data/u1.test');
mae=0;
sum=0;
s=size(predicted_rating);
for i = 1 : length(rating) 
    original_val = rating(i,3);
    if rating(i,1) <= s(1) && rating(i,2) <=s(2)
    predicted_val = predicted_rating(rating(i,1),rating(i,2));
    mae = mae + abs(original_val - predicted_val);
    sum=sum+1;
    end
end

mae = mae / sum ;

end


