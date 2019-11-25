
server = function(input, output) {
  
  output$selected_FY1 = renderText({
    if(is.null(input$FY1_class) | is.null(input$add_course_FY1))
      return() 
    
    input$FY1_class
    
  })
  
  # output$report = renderPrint({ report() })
}