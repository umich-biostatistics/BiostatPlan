
server = function(input, output) {
  
  showModal(draggableModalDialog(
    title = "Full screen mode recommended on your browser.",
    "Please expand your browser to full screen. The features of this application 
    are difficult to see in small windows.",
    "Click anywhere on the greyed out page to close this window.",
    easyClose = TRUE,
    footer = NULL
  ))
  
  list_selections_FY1 = eventReactive(input$add_course_FY1, {
    selections$FY1 <<- rbind(selections$FY1, filter(classes, Course == input$FY1_class))
    selections$FY1
  })
  
  output$selected_FY1 = renderDataTable({
    list_selections_FY1()
  })
  
  list_selections_SY1 = eventReactive(input$add_course_SY1, {
    selections$SY1 <<- rbind(selections$SY1, filter(classes, Course == input$SY1_class))
    selections$SY1
  })
  
  output$selected_SY1 = renderDataTable({
    list_selections_SY1()
  })
  
  list_selections_FY2 = eventReactive(input$add_course_FY2, {
    selections$FY2 <<- rbind(selections$FY2, filter(classes, Course == input$FY2_class))
    selections$FY2
  })
  
  output$selected_FY2 = renderDataTable({
    list_selections_FY2()
  })
  
  list_selections_SY2 = eventReactive(input$add_course_SY2, {
    selections$SY2 <<- rbind(selections$SY2, filter(classes, Course == input$SY2_class))
    selections$SY2
  })
  
  output$selected_SY2 = renderDataTable({
    list_selections_SY2()
  })
  
  # output$report = renderPrint({ report() })
}