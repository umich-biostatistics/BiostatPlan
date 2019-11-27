
server = function(input, output) {
  
  selections_reactive =
    list(
      FY1_reactive = 
        reactiveValues(
          "FY1" = data.frame()
        ),
      SY1_reactive = 
        reactiveValues(
          "SY1" = data.frame()
        ),
      FY2_reactive = 
        reactiveValues(
          "FY2" = data.frame()
        ),
      SY2_reactive = 
        reactiveValues(
          "SY2" = data.frame()
        )
    )
  
  list_selections_FY1 = eventReactive(input$add_course_FY1, {
    selections_reactive$FY1_reactive$FY1 <- rbind(selections_reactive$FY1_reactive$FY1, filter(classes, Course == input$FY1_class) %>% 
                                                              select(Course, Credits, Title, Usual_Term))
  })
  
  remove_selections_FY1 = eventReactive(input$remove_course_FY1, {
    selections_reactive$FY1_reactive$FY1 <- filter(selections_reactive$FY1_reactive$FY1, Course != input$FY1_class) %>%
                                      select(Course, Credits, Title, Usual_Term)
  })
  
  output$selected_FY1 = renderDataTable({
    selections_reactive$FY1_reactive$FY1
  })
  
  output$selected_FY1 = renderDataTable({
    selections_reactive$FY1_reactive$FY1
  })
  
  
  # list_selections_SY1 = eventReactive(input$add_course_SY1, {
  #   selections$SY1 <<- rbind(selections$SY1, filter(classes, Course == input$SY1_class) %>% 
  #                                            select(Course, Credits, Title, Usual_Term))
  #   selections$SY1
  # })
  # 
  # output$selected_SY1 = renderDataTable({
  #   list_selections_SY1()
  # })
  # 
  # list_selections_FY2 = eventReactive(input$add_course_FY2, {
  #   selections$FY2 <<- rbind(selections$FY2, filter(classes, Course == input$FY2_class) %>% 
  #                                                            select(Course, Credits, Title, Usual_Term))
  #   selections$FY2
  # })
  # 
  # output$selected_FY2 = renderDataTable({
  #   list_selections_FY2()
  # })
  # 
  # list_selections_SY2 = eventReactive(input$add_course_SY2, {
  #   selections$SY2 <<- rbind(selections$SY2, filter(classes, Course == input$SY2_class) %>% 
  #                                                   select(Course, Credits, Title, Usual_Term))
  #   selections$SY2
  # })
  # 
  # output$selected_SY2 = renderDataTable({
  #   list_selections_SY2()
  # })
  
  # output$report = renderPrint({ report() })
}
