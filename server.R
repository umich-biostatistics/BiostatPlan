
server = function(input, output) {
  
  list_selections_FY1 = eventReactive(input$add_course_FY1, {
    selections$FY1 <<- c(selections$FY1, input$FY1_class)
    print(selections$FY1)
  })
  
  output$selected_FY1 = renderText({
    list_selections_FY1()
  })
  
  # output$report = renderPrint({ report() })
}