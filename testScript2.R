execute <- function(queueName, bucketName, executionId, datasource) {
  library(dplyr)
  library(xby2library)
  con <- getDbConnection(datasource)
  on.exit(DBI::dbDisconnect(con))
  df1 = data.frame(tbl(con, "domestic_property_and_casualty_insurers"))
  persistValidationResults(executionId, queueName, bucketName, "domestic_insurers", "state_is_null", df1)
  df2 = data.frame(tbl(con, "dummy_table"))
  persistValidationResults(executionId, queueName, bucketName, "dummy_table", "incorrect_rate_format", df2)
  return (as.integer(0))
}
