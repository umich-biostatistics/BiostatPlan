
server = function(input, output) {
  
  list_selections_FY1 = eventReactive(input$add_course_FY1, {
    selections$FY1 <<- rbind(selections$FY1, filter(classes, Course == input$FY1_class))
    selections$FY1
  })
  
  output$selected_FY1 = renderDataTable({
    list_selections_FY1()
  })
  
  # output$report = renderPrint({ report() })
}