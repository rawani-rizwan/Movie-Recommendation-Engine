%predictions are mean user ratings (composite method)
rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
modified_rating_matrix = CompleteSparseMatrixUsingCompositeMeanUserRating(rating_matrix,mean_user_rating );
predicted_ratings  = modified_rating_matrix;
mean_absolute_error = error_calculation( predicted_ratings )