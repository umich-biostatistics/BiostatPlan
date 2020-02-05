
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


server = function(input, output, session) {

  FY1_reactive = 
    reactiveValues(
      "selected_FY1" = classes %>% filter(Course == 'BIOSTAT 601' | Course == 'BIOSTAT 650') # set required courses here
    )
  SY1_reactive = 
    reactiveValues(
      "selected_SY1" = classes %>% filter(Course == 'BIOSTAT 602' | Course == 'BIOSTAT 651')  # set required courses here
    )
  FY2_reactive = 
    reactiveValues(
      "selected_FY2" = classes %>% filter(Course == 'BIOSTAT 653') # set required courses here
    )
  SY2_reactive = 
    reactiveValues(
      "selected_SY2" = classes %>% filter(Course == 'BIOSTAT 699') # set required courses here
    )
  
  
  observeEvent(input$add_course_FY1, {
    FY1_reactive$selected_FY1 = 
      rbind(FY1_reactive$selected_FY1, 
            filter(classes, Course == input$FY1_class))
            
  })
  
  observeEvent(input$remove_course_FY1, {
    FY1_reactive$selected_FY1 =
      filter(FY1_reactive$selected_FY1, Course != input$FY1_class)
  })
  
  output$selected_FY1 = 
    renderDataTable({
      if(!purrr::is_empty(FY1_reactive$selected_FY1)) {
        FY1_reactive$selected_FY1 %>% select(Course, Credits, Title, Usual_Term)
      }
    })
  
  
  observeEvent(input$add_course_SY1, {
    SY1_reactive$selected_SY1 = 
      rbind(SY1_reactive$selected_SY1, 
            filter(classes, Course == input$SY1_class))
  })
  
  observeEvent(input$remove_course_SY1, {
    SY1_reactive$selected_SY1 =
      filter(SY1_reactive$selected_SY1, Course != input$SY1_class)
  })
  
  output$selected_SY1 = 
    renderDataTable({
      if(!purrr::is_empty(SY1_reactive$selected_SY1)) {
        SY1_reactive$selected_SY1 %>% select(Course, Credits, Title, Usual_Term)
      }
    })
  
  
  observeEvent(input$add_course_FY2, {
    FY2_reactive$selected_FY2 = 
      rbind(FY2_reactive$selected_FY2, 
            filter(classes, Course == input$FY2_class))
  })
  
  observeEvent(input$remove_course_FY2, {
    FY2_reactive$selected_FY2 =
      filter(FY2_reactive$selected_FY2, Course != input$FY2_class)
  })
  
  output$selected_FY2 = 
    renderDataTable({
      if(!purrr::is_empty(FY2_reactive$selected_FY2)) {
        FY2_reactive$selected_FY2 %>% select(Course, Credits, Title, Usual_Term)
      }
    })
  
  
  observeEvent(input$add_course_SY2, {
    SY2_reactive$selected_SY2 = 
      rbind(SY2_reactive$selected_SY2, 
            filter(classes, Course == input$SY2_class))
  })
  
  observeEvent(input$remove_course_SY2, {
    SY2_reactive$selected_SY2 =
      filter(SY2_reactive$selected_SY2, Course != input$SY2_class)
  })
  
  output$selected_SY2 = 
    renderDataTable({
      if(!purrr::is_empty(SY2_reactive$selected_SY2)) {
        SY2_reactive$selected_SY2 %>% select(Course, Credits, Title, Usual_Term)
      }
    })
  
  output$add_class_error = 
    renderUI({
      if(search_class(input$Course_ID_text, classes)) {
        p("Error: Attempted to add a class that is already in the database.")
      }
    })
  
  observeEvent(input$add_new_course, {
    
    shiny::validate(
      need(search_class(input$Course_ID_text, classes) == FALSE, "")
    )
    
    classes = rbind(classes, rep(NA, ncol(classes)))
    N = nrow(classes)
    classes$Course[N] = input$Course_ID_text
    classes$Credits[N] = as.numeric(input$Course_hours_text)
    classes$Title[N] = input$Course_Name_text
    classes <<- classes
      
    updateSelectInput(
      session, "FY1_class",
      label = "Select a class",
      choices = classes$Course
    )
      
    updateSelectInput(
      session, "SY1_class",
      label = "Select a class",
      choices = classes$Course
    )
      
    updateSelectInput(
      session, "FY2_class",
      label = "Select a class",
      choices = classes$Course
    )
      
    updateSelectInput(
      session, "SY2_class",
      label = "Select a class",
      choices = classes$Course
    )
      
    updateTextInput(
      session, "Course_ID_text",
      value = ""
    )
      
    updateTextInput(
      session, "Course_Name_text",
      value = ""
    )
      
    updateTextInput(
      session, "Course_hours_text",
      value = ""
    )
    
  })
  
  output$report = 
    downloadHandler(
      filename = "report.html",
      content = function(file) {
        tempReport = file.path(tempdir(), "Report.Rmd")
        file.copy("Report.Rmd", tempReport, overwrite = TRUE)
        plan = list('FY1' = FY1_reactive$selected_FY1,
                    'SY1' = SY1_reactive$selected_SY1,
                    'FY2' = FY2_reactive$selected_FY2,
                    'SY2' = SY2_reactive$selected_SY2)
        if(input$HDS_choice == 'Yes') { HDS <<- 'Yes' }
        else { HDS <<- 'No' }
        checks = check(plan)
        params = list(plan = plan,
                      checks = checks)
        rmarkdown::render(tempReport, 
                          output_file = file,
                          params = params,
                          envir = new.env(parent = globalenv())
        )
      }
    )
  
}
