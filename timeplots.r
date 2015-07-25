# timeplots.r
# The code necessary to solve part 2 of assignment #.

# Read in the data
data <- read.csv('activity.csv')

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

# Read the data into a time series (not sure what that is)
ts <- ts(means, start=, end=, frequency=288)

# Plot the time series (this doesn't work yet)
plot(ts, type = 'l')
