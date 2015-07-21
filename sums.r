# sums.r
# Figuring out the code necessary to calculate the total number of steps
# taken each day.

# Read in the data
data <- read.csv('activity.csv')

# Create a vector which contains the list of unique days in the dataset.
days <- unique(data[,2])

# Transform the vector into character data.
days <- as.character(days)

# Subset the data to just 2012-10-01
sub <- subset(data, date == '2012-10-01')

# Simple for loop, just practicing loops.
# Note, the counter apparently needs to be defined outside the loop.
sums <- vector()

# Creating a counter variable for controlling the loop.
counter <- c(1:length(days))

for (i in counter)
{
  # Subset the data for the day i.
  sub <- subset(data, date == days[i])
  # Calculate the mean of the steps for the day.
  s <- sum(sub[,1])
  sums <- c(sums, s)
}

# Put the resulting data into a dataframe.
result <- data.frame(days, sums)

# Now we know the total steps for each day.
result