% extension of program 6 by centroid neighbourhood method
 
rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
modified_rating_matrix = CompleteSparseMatrixUsingCompositeMeanUserRating(rating_matrix,mean_user_rating );
similarity_matrix = createSimilarityMatrix(modified_rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhoodModified( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )