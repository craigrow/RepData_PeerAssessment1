# stime.r
# Figuring out the code necessary to solve the time series problems.

# Read in the data
data <- read.csv('activity.csv')

# Create a subset from data for a single day
ss <- subset(data, date == '2012-10-04')

# Read the steps data into a vector
vector <- data[,1]
vector <- ss[,1]

# Read the data into a time series (not sure what that is)
ts <- ts(vector, start=, end=, frequency=288)

# Plot the time series (this doesn't work yet)
plot(ts)

# Create a vector which contains the list of unique days in the dataset.
days <- unique(data[,2])

# Creating a counter variable for controlling the loop.
counter <- c(1:length(days))

# Loop through all of the data.
# I think this plots each day together on the same plot.
for (i in counter)
{
  ss <- subset(data, date == days[i])
  vector <- data[,1]
  ts <- ts(vector, start=, end=, frequency=288)
  plot(ts, type='l')
}

# ==========================================
# The above is close but not what we're looking for.
# We want a time series of the average for each interval over all days.

ss <- subset(data, date == '2012-10-04')
vector <- ss[,1]
df <- data.frame(vector)
ss <- subset(data, date == '2012-10-05')
vector <- ss[,1]
df <- c(df, ss)
df[,'next'] <- c(vector)

df <- data.frame()

# Loop through the data to create a table where each row is a day of
# observations.
# Note this is wrong, we need a column for each day so we have a row 
# for each observation interval. That will make finding means easier.

  # Setup a dataframe to use for the value.
  ss <- subset(data, date == days[1])
  vector <- ss[,1]
  rows <- c(1:length(vector))
  df <- data.frame(rows)

  # Loop through values to fill the data frame.
  for (i in counter)
  {
    ss <- subset(data, date == days[i])
    vector <- ss[,1]
    df <- cbind(df, vector)
  }

# Loop through the data to find the mean of each interval's observations.
for (i in counter)
{
  means <- c(means, mean(df[i,], na.rm = TRUE))
}
# =============================================
# Just practicing creating a df and adding rows to it.

df <- data.frame()
v1 <- c(1, 2, 3)
v2 <- c(3, 4, 5)
df <- rbind(df,v1)
df <- rbind(df,v2)
df
