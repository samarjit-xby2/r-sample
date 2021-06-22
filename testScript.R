execute <- function(queueName, bucketName, executionId, datasource) {
  library(dplyr)
  library(xby2library)
  con <- getDbConnection(datasource)
  on.exit(DBI::dbDisconnect(con))
  df1 = data.frame(tbl(con, "domestic_property_and_casualty_insurers"))
  persistValidationResults(executionId, queueName, bucketName, "domestic_property_and_casualty_insurers", "name_is_null", df1)
  df2 = data.frame(tbl(con, "average_auto_insurance_rates"))
  persistValidationResults(executionId, queueName, bucketName, "average_auto_insurance_rates", "valid_state_cd", df2)
  return (as.integer(0))
}
