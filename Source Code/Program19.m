%extension of program 17 . Similarity coefficient modified using mean user
%genre rating


rating_matrix = createRatingMatrix ;
movie_genre = createMovieGenreMatrix;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_user_genre_rating = getMeanUserGenreRating(rating_matrix,mean_user_rating,movie_genre);
[modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRating(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating );
similarity_matrix = createSimilarityMatrixUsingMeanUserGenreRating(modified_rating_matrix,expected_movie_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )