%predictions are mean user ratings
rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
modified_rating_matrix = CompleteSparseMatrixUsingMeanUserRating( rating_matrix,mean_user_rating );
predicted_ratings  = modified_rating_matrix;
mean_absolute_error = error_calculation( predicted_ratings )