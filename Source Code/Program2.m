% This program completes the initial sparse matrix using mean ratings of 
% users and then uses this complete matrix to get similarity between 
% users using Pearson corelation and selects the neighbourhood by seleting
% top k neighbours and predicts the unknown ratings using these neighbours.

rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
modified_rating_matrix = CompleteSparseMatrixUsingMeanUserRating( rating_matrix,mean_user_rating );
similarity_matrix = createSimilarityMatrix(modified_rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )