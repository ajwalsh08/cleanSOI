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
  
  # Outputs the data in two csv files
  write.csv(inflow_nocode, file = paste(county,state,"inflow.csv"))
  write.csv(outflow_nocode, file = paste(county,state,"outflow.csv"))
  
  # Uses tapply to generate state summary tables
  inflow_states <- subset(inflow_nocode, State_Abbrv != state)
  summary <- with(inflow_states, tapply(Exmpt_Num, State_Abbrv, sum))
  inflow_summary <- data.frame(value=summary)
  write.csv(inflow_summary, file = paste(county,state,"inflow by state.csv"))
  
  outflow_states <- subset(outflow_nocode, State_Abbrv != state)
  summary <- with(outflow_states, tapply(Exmpt_Num, State_Abbrv, sum))
  outflow_summary <- data.frame(value=summary)
  write.csv(outflow_summary, file = paste(county,state,"outflow by state.csv"))
}