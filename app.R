
# import packages
library(shiny)
library(tidyverse)
library(DT)
library(shinyjqui)

# source server and UI functions
source("global.R")
source("server.R")
source("ui.R")

# launch instance of app
runApp(shinyApp(ui, server), launch.browser = TRUE)

# https://shiny.rstudio.com/articles/generating-reports.html <- rmarkdown and shiny