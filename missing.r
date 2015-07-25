# missing.r
# Figuring out the code necessary to solve the time series problems.

# Read in the data
data <- read.csv('activity.csv')

# Find the number of NA values.
vector <- data[,1]
sum(is.na(vector))

# I'm going to fill in missing values with the mean for that time slice.

  # First, caluculate the mean of each time slice.
    # Create a vector which contains the list of unique days in the dataset.
    days <- unique(data[,2])
    
    # Creating a counter variable for controlling the loop.
    counter <- c(1:length(days))
    
    # Setup a dataframe to use for the value.
    ss <- subset(data, date == days[1])
    vector <- ss[,1]
    rows <- c(1:length(vector))
    df <- data.frame(rows)
    
    # Loop through values to fill the data frame.
    # Each row is one time slice.
    # Each column is the observation for the given time slice each day.
    for (i in counter)
    {
      ss <- subset(data, date == days[i])
      vector <- ss[,1]
      df <- cbind(df, vector)
    }
    
    # Now find the mean of each row.
    means <- vector()
    
    for (i in rows)
    {
      t <- df[i,]
      t <- as.integer(t)
      m <- mean(t, na.rm = TRUE)
      means <- append(means, m)
    }

# Now that we know the mean for each time slice, parst through each time
# slice and replace any N/A with the mean of that slice.

for (r in rows)
{
    for (c in (counter + 1))
    {
        if (is.na(df[r, c]) == TRUE)
        {
            df[r, c] <- means[r]
        }
    }
}

