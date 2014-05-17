migration <- function(county, state) {
  # Reads in the data
  inflow <- read.csv("~/Desktop/cleanSOI/countyinflow1011.csv")
  outflow <- read.csv("~/Desktop/cleanSOI/countyoutflow1011.csv")
  
  # Edits the argument to agree with the data
  county <- paste(county, "County")
  
  # Uses inflow to convert args to county, state codes
  codes <- inflow[,3:6]
  code <- subset(codes, County_Name == county & State_Abbrv == state)
  state_code <- code[1,1]
  county_code <- code[1,2]
  
  # Subsets the data
  inflow1 <- subset(inflow, 
                    County_Code_Dest == county_code & 
                    State_Code_Dest == state_code)
  inflow_nocode <- inflow1[,5:9]
  outflow1 <- subset(outflow,
                     County_Code_Origin == county_code &
                     State_Code_Origin == state_code)
  outflow_nocode <- outflow1[,5:9]
  
  # Renames columns to facilitate merge
  names(inflow_nocode) <- c("State", "County", "Returns_In", "Exemptions_In", "Income_In")
  names(outflow_nocode) <- c("State", "County", "Returns_Out", "Exemptions_Out", "Income_Out")
  
  # Merges inflow and outflow
  all_flow <- merge(inflow_nocode, outflow_nocode, all.x=TRUE, all.y=TRUE)
  
  # Converts the NAs to zeroes
  all_flow[is.na(all_flow)] <- 0
  
  #Creates 'net' variables
  all_flow$Net_Returns_In <- all_flow$Returns_In - all_flow$Returns_Out
  all_flow$Net_Exemptions_In <- all_flow$Exemptions_In - all_flow$Exemptions_Out
  all_flow$Net_Income_In <- all_flow$Income_In - all_flow$Income_Out

  # Writes the data to csv
  write.csv(all_flow, file = paste(county,state,"Migration.csv"))  
}
