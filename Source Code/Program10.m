%program 3 modified using centroid neighbourhood method
rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_movie_rating = getMeanMovieRatings( rating_matrix );
modified_rating_matrix = CompleteSparseMatrixUsingMeanMovieRating( rating_matrix,mean_movie_rating );
similarity_matrix = createSimilarityMatrix(modified_rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhoodModified( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )