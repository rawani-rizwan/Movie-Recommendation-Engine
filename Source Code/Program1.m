% This program uses the initial sparse matrix to get similarity between 
% users using Pearson corelation and selects the neighbourhood by seleting
% top k neighbours and predicts the unknown ratings using these neighbours.
% It actually implements the most basic colaborative filtering algorithm.

rating_matrix = createRatingMatrix ;
mean_user_rating=getMeanUserRatings(rating_matrix);
similarity_matrix = createSimilarityMatrix(rating_matrix,mean_user_rating );
[neighbourhood_index,neighbourhood_weight] = neighbourhood( similarity_matrix );
predicted_ratings  = prediction( rating_matrix, mean_user_rating, neighbourhood_index, neighbourhood_weight );
mean_absolute_error = error_calculation( predicted_ratings )