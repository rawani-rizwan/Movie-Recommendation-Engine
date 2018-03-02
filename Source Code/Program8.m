% Extended program 1 using centroid neighbourhood method

rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
similarity_matrix = createSimilarityMatrix(rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhoodModified( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )