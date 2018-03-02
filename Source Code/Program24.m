% extension of program 20. Matrix Completed using correction term


rating_matrix = createRatingMatrix ;
movie_genre = createMovieGenreMatrix;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_user_genre_rating = getMeanUserGenreRating(rating_matrix,mean_user_rating,movie_genre);
[modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRatingWithCorrectionTerm(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating );
similarity_matrix = createSimilarityMatrixUsingMeanUserGenreRating(modified_rating_matrix,expected_movie_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = predictionUsingModifiedRatingMatrix( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight,modified_rating_matrix );
mean_absolute_error = error_calculation( predicted_ratings )