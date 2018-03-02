%extension of program 2 . Uses mean user genre rating to complete sparse 
%matrix

rating_matrix = createRatingMatrix ;
movie_genre = createMovieGenreMatrix;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_user_genre_rating = getMeanUserGenreRating(rating_matrix,mean_user_rating,movie_genre);
[modified_rating_matrix,expected_movie_rating] = completeSparseMatrixUsingMeanUserGenereRating(rating_matrix,mean_user_genre_rating,movie_genre,mean_user_rating );
similarity_matrix = createSimilarityMatrix(modified_rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )