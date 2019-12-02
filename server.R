
server = function(input, output, session) {

  FY1_reactive = 
    reactiveValues(
      "selected_FY1" = data.frame()
    )
  SY1_reactive = 
    reactiveValues(
      "selected_SY1" = data.frame()
    )
  FY2_reactive = 
    reactiveValues(
      "selected_FY2" = data.frame()
    )
  SY2_reactive = 
    reactiveValues(
      "selected_SY2" = data.frame()
    )
  
  
  observeEvent(input$add_course_FY1, {
    FY1_reactive$selected_FY1 = 
      rbind(FY1_reactive$selected_FY1, 
            filter(classes, Course == input$FY1_class) %>% 
            select(Course, Credits, Title, Usual_Term))
  })
  
  observeEvent(input$remove_course_FY1, {
    FY1_reactive$selected_FY1 =
      filter(FY1_reactive$selected_FY1, Course != input$FY1_class) %>%
      select(Course, Credits, Title, Usual_Term)
  })
  
  output$selected_FY1 = 
    renderDataTable({
      FY1_reactive$selected_FY1
    })
  
  
  observeEvent(input$add_course_SY1, {
    SY1_reactive$selected_SY1 = 
      rbind(SY1_reactive$selected_SY1, 
            filter(classes, Course == input$SY1_class) %>% 
              select(Course, Credits, Title, Usual_Term))
  })
  
  observeEvent(input$remove_course_SY1, {
    SY1_reactive$selected_SY1 =
      filter(SY1_reactive$selected_SY1, Course != input$SY1_class) %>%
      select(Course, Credits, Title, Usual_Term)
  })
  
  output$selected_SY1 = 
    renderDataTable({
      SY1_reactive$selected_SY1
    })
  
  
  observeEvent(input$add_course_FY2, {
    FY2_reactive$selected_FY2 = 
      rbind(FY2_reactive$selected_FY2, 
            filter(classes, Course == input$FY2_class) %>% 
              select(Course, Credits, Title, Usual_Term))
  })
  
  observeEvent(input$remove_course_FY2, {
    FY2_reactive$selected_FY2 =
      filter(FY2_reactive$selected_FY2, Course != input$FY2_class) %>%
      select(Course, Credits, Title, Usual_Term)
  })
  
  output$selected_FY2 = 
    renderDataTable({
      FY2_reactive$selected_FY2
    })
  
  
  observeEvent(input$add_course_SY2, {
    SY2_reactive$selected_SY2 = 
      rbind(SY2_reactive$selected_SY2, 
            filter(classes, Course == input$SY2_class) %>% 
              select(Course, Credits, Title, Usual_Term))
  })
  
  observeEvent(input$remove_course_SY2, {
    SY2_reactive$selected_SY2 =
      filter(SY2_reactive$selected_SY2, Course != input$SY2_class) %>%
      select(Course, Credits, Title, Usual_Term)
  })
  
  output$selected_SY2 = 
    renderDataTable({
      SY2_reactive$selected_SY2
    })
  
  
  
  observeEvent(input$add_new_course, {
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
    
    
    observeEvent(input$Submit_form, {
      
    })
    
  })
  
  # output$report = renderPrint({ report() })
  
}
