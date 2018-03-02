% This program completes the initial sparse matrix using mean ratings of 
% movies and then uses this complete matrix to get similarity between 
% users using Pearson corelation and selects the neighbourhood by seleting
% top k neighbours and predicts the unknown ratings using these neighbours.
% It is an extension of program 3 as it calculates predictions 
% using the modified rating matrix.

rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
mean_movie_rating = getMeanMovieRatings( rating_matrix );
modified_rating_matrix = CompleteSparseMatrixUsingMeanMovieRating( rating_matrix,mean_movie_rating );
similarity_matrix = createSimilarityMatrix(modified_rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = predictionUsingModifiedRatingMatrix( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight,modified_rating_matrix );
mean_absolute_error = error_calculation( predicted_ratings )