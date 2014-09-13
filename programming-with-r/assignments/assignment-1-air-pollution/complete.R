complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  allFiles <- list.files(path = directory, full.names = TRUE)
  selectedData <- data.frame()
  completeCases <- data.frame()
  nobs <- data.frame();
  for (i in id) { 
    selectedData <- (read.csv(allFiles[i],header=TRUE))
    nobs <- sum(complete.cases(selectedData))
    completeCases <- rbind(completeCases, data.frame(i,nobs))
  }
  completeCases
}