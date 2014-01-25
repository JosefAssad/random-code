best <- function(state, outcome) {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    filepath <- "~/Documents/R/outcome-of-care-measures.csv"
    data <- read.csv(filepath, colClasses="character")
    if( !(state %in% data$State) ) stop("invalid state")
    filtered <- data[ which( as.character(data$State) == state ), ]
    namecol <- filtered$Hospital.Name
    if(outcome == "heart attack") {
        ratecol <- filtered$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack
    } else if(outcome == "heart failure") {
        ratecol <- filtered$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure
    } else if(outcome == "pneumonia") {
        ratecol <- filtered$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia
    } else {
        stop("invalid outcome")
    }
    ratecol <- as.numeric(ratecol)
    lastmx <- data.frame(namecol, ratecol)
    best_hospital <- lastmx[which.min(lastmx[,2]),]
    return(as.character(best_hospital$namecol))
}
