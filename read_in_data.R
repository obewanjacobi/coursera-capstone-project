# Note:
# In order for this to work, the data must be downloaded, and in the zipped file must be extracted into the 
# working directory

library(jsonlite)
library(plyr)
library(dplyr)

if (exists('business_data') == FALSE){
  business_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_business.json"))
}

if (exists('checkin_data') == FALSE){
  checkin_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_checkin.json"))
}

if (exists('review_data') == FALSE){
  review_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_review.json"))
}

if (exists('tip_data') == FALSE){
  tip_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_tip.json"))
}

if (exists('user_data') == FALSE){
  user_data <- stream_in(file("./yelp_dataset_challenge_academic_dataset/yelp_academic_dataset_user.json"))
}

# Then View it

View(business_data)
View(checkin_data)
View(review_data)
View(tip_data)

# Let's Clean it up

users <- user_data[user_data$review_count != 0,] #remove users with 0 reviews
votes <- users$votes$funny + users$votes$useful + users$votes$cool
users <- select(users, review_count, user_id, fans, average_stars)
users <- mutate(users, votes = votes)










