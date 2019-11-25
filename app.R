
# import packages
library(shiny)

# source server and UI functions
source("global.R")
source("server.R")
source("ui.R")

# launch instance of app
shinyApp(ui, server)
