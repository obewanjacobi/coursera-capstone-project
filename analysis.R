# Analysis

library(jsonlite)
library(plyr)
library(dplyr)

# Count how many times a user has reviewed in a city:

travel <- travel %>% group_by(user_id, city) %>% mutate(revCount = n()) # revCount is number of times user has reviewed
                                                                        # in that city
travel2 <- travel %>% filter(row_number() == 1)                         # travel2 makes each user unique by city
c <- count(travel2, vars = revCount)


# Let's make a dataframe just with number of cities, distances, and number of reviews
user <- c(0)
cities <- c(0)
distance <- c(0)
reviews <- c(0)
user_travel <- data.frame(user,cities,distance, reviews)
for(i in (1:length(users$user_id))){
    total_cities <- travel2[travel2$user_id == users$user_id[i],]
    user <- users$user_id[i]
    cities <- length(total_cities$city)
    distance <- sqrt(((max(total_cities$latitude)-min(total_cities$latitude))^2)+
      (max(total_cities$latitude)-min(total_cities$latitude))^2)
    reviews <- users$review_count[i]
    temp <- data.frame(user,cities,distance, reviews)
    user_travel <- rbind(user_travel, temp)
}
user_travel = user_travel[-1,]
write.csv(user_travel, file = "./user_travel") #this is because the code takes a long time to run.
#Note: This will work even though the longitude may not match the latitude. Draw graph to think about it.

# View important dataframes

View(users)
View(full_data)
View(travel)
View(travel2)
View(user_travel)













