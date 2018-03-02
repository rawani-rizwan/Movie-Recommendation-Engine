%extension of program 21 . Matrix completed with correction term


rating_matrix = createRatingMatrix ;
movie_genre = createMovieGenreMatrix;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_user_genre_rating = getMeanUserGenreRating(rating_matrix,mean_user_rating,movie_genre);
[modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRatingWithCorrectionTerm(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating );
similarity_matrix = createSimilarityMatrixUsingMeanUserGenreRating(modified_rating_matrix,expected_movie_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = predictionUsingMeanUserGenreRating( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight,expected_movie_rating );
mean_absolute_error = error_calculation( predicted_ratings )