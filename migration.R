inflow <- read.csv("~/Desktop/cleanSOI/countyinflow1011.csv")
outflow <- read.csv("~/Desktop/cleanSOI/countyoutflow1011.csv")
codes <- inflow[,3:6]

migration <- function(county, state) {
  county <- paste(county, "County")
  code <- subset(codes, County_Name == county & State_Abbrv == state)
  state_code <- code[1,1]
  county_code <- code[1,2]
  inflow1 <- subset(inflow, 
                    County_Code_Dest == county_code & 
                    State_Code_Dest == state_code)
  inflow_nocode <- inflow1[,5:9]
  outflow1 <- subset(outflow,
                     County_Code_Origin == county_code &
                     State_Code_Origin == state_code)
  outflow_nocode <- outflow1[,5:9]
  write.csv(inflow_nocode, file = "FILTEREDinflow.csv")
  write.csv(outflow_nocode, file = "FILTEREDoutflow.csv")
}
print("Run migration() on your county-state pair of interest (e.g., migration("Jefferson", "AL")), then check the repo for your new files!")