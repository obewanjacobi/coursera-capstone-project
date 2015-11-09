# business_data & checkin have 'type' & 'business id'

# business & review have 'stars', 'type', 'business id'
# checkin & review have 'business id' and 'type'

# tip and review have 'user id' & 'text' & 'business id' & 'date' & 'type'
# tip has a lot of things in common with others

# user data seems to be the outcast, whereas the others are combined by business id among other things

# type is defined as what category of data, ie.: 'business', 'checkin', 'review', etc.

# business id's and user id's are consistent

# Will probably mostly use user_data, will make a new dataframe to answer the question of whether or not frequent users
# give better reviews. Could compare their reviews of places to nonfrequent users who went to the same companies.

# We will look at reviews, not tips, as we can assume that tips are for people who aren't as dedicated, so they just use
# yelp every so often.

