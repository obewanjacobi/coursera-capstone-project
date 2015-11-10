# Analysis

# Count how many times a user has reviewed in a city:

count(travel, c("user_id", "city"))
# error: wrong result size(2), expected 1569264 or 1

full_data <- full_data %>% group_by(user_id,business_id)
#problem: the organization still doesn't change based on user_id. changing the user_id values to factor variables 
#         doesn't help either