
# import packages
library(shiny)
#library(tidyverse)
library(dplyr)
library(purrr)
library(magrittr)
library(DT)
library(shinyjqui)
library(readr)
library(knitr)
library(kableExtra)
library(exdata)

# source server and UI functions
source("global.R")
source("server.R")
source("ui.R")

# launch instance of app
runApp(shinyApp(ui, server), launch.browser = TRUE)
