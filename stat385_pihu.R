# Q2
# Which molecular descriptors are most important
# for predicting biodegradability?

library(randomForest)

set.seed(123)

# Fit Random Forest model
rf.q2 <- randomForest(
  Biodegradable ~ .,
  data = train_data,
  ntree = 500,
  importance = TRUE
)

# Variable importance plot
varImpPlot(rf.q2)

# Get variable importance values
importance.rf <- importance(rf.q2)

importance.df <- data.frame(
  Descriptor = rownames(importance.rf),
  MeanDecreaseAccuracy = importance.rf[, "MeanDecreaseAccuracy"],
  MeanDecreaseGini = importance.rf[, "MeanDecreaseGini"]
)

# Top 10 variables by Mean Decrease Accuracy
top.accuracy <- importance.df[
  order(-importance.df$MeanDecreaseAccuracy),
][1:10, ]

top.accuracy

# Top 10 variables by Mean Decrease Gini
top.gini <- importance.df[
  order(-importance.df$MeanDecreaseGini),
][1:10, ]

top.gini
