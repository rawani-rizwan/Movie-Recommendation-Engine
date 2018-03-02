% extension of program 26 with centroid neighbourhood

rating_matrix = createRatingMatrix ;
movie_genre = createMovieGenreMatrix;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_user_genre_rating = getMeanUserGenreRating(rating_matrix,mean_user_rating,movie_genre);
[modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRatingWithCorrectionTerm(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating );
similarity_matrix = createSimilarityMatrixUsingMeanUserGenreRating(modified_rating_matrix,expected_movie_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhoodModified( similarity_matrix );
predicted_ratings  = predictionUsingModifiedRatingMatrixAndMeanUserGenreRating( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight,modified_rating_matrix,expected_movie_rating );
mean_absolute_error = error_calculation( predicted_ratings )