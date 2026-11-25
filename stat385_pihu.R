library(randomForest)

set.seed(123)

rf.q2 <- randomForest(
  Biodegradable ~ .,
  data = train_data,
  ntree = 500,
  importance = TRUE
)

# Variable importance plot
varImpPlot(rf.q2)

# Extract importance values
imp <- importance(rf.q2)

imp.df <- data.frame(
  Descriptor = rownames(imp),
  MeanDecreaseAccuracy = imp[, "MeanDecreaseAccuracy"],
  MeanDecreaseGini = imp[, "MeanDecreaseGini"]
)

# Top descriptors by MeanDecreaseAccuracy
imp.df[order(-imp.df$MeanDecreaseAccuracy), ][1:10, ]

# Top descriptors by MeanDecreaseGini
imp.df[order(-imp.df$MeanDecreaseGini), ][1:10, ]
