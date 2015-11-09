# Note:
# In order for this to work, the data must be downloaded, and in the zipped file must be extracted into the 
# working directory

library(jsonlite)
library(plyr)
library(dplyr)

if (exists('business_data') == FALSE){
  business_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_business.json"))
}

if (exists('review_data') == FALSE){
  review_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_review.json"))
}


if (exists('user_data') == FALSE){
  user_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_user.json"))
}


# Let's Clean it up

users <- user_data[user_data$review_count != 0,] #remove users with 0 reviews
votes <- users$votes$funny + users$votes$useful + users$votes$cool
users <- select(users, review_count, user_id, fans, average_stars)
users <- mutate(users, votes = votes)

businesses <- data.frame(business_data$business_id, business_data$city, business_data$latitude, business_data$longitude)
colnames(businesses) <- c("business_id", "city", "latitude", "longitude")

reviews <- data.frame(review_data$user_id, review_data$review_id, review_data$business_id)
colnames(reviews) <- c("user_id", "review_id", "business_id") 

full_data <- left_join(reviews, businesses, by = "business_id")
full_data <- left_join(full_data, users, by = "user_id")

rm(business_data, businesses, review_data, reviews, user_data)
View(users)
View(full_data)















