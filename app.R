
# import packages
library(shiny)
library(tidyverse)
library(DT)

# source server and UI functions
source("global.R")
source("server.R")
source("ui.R")

# launch instance of app
shinyApp(ui, server)
