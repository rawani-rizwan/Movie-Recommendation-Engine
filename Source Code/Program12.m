%program 5 extended using centroid neighbourhood method

rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_movie_rating = getMeanMovieRatings( rating_matrix );
modified_rating_matrix = CompleteSparseMatrixUsingMeanMovieRating( rating_matrix,mean_movie_rating );
similarity_matrix = createSimilarityMatrix(modified_rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhoodModified( similarity_matrix );
predicted_ratings  = predictionUsingModifiedRatingMatrix( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight,modified_rating_matrix );
mean_absolute_error = error_calculation( predicted_ratings )