
ui = fluidPage(
  
  fluidRow(
    headerPanel(h3("Biostatistics M.S. Course Planner", style="color: #02169B")),
              div(style = "height:55px;background-color: #F1F1F1;") 
  ),
  
  
  fluidRow(
    splitLayout(
      fluidPage(h4("Fall, Year 1"),
               wellPanel(
                 submitButton("Add Course")
               )
      ),
      fluidPage(h4("Spring, Year 1"),
                wellPanel(
                  submitButton("Add Course")
                )
      )
    )
  ),
  
  fluidRow(
    splitLayout(
      fluidPage(h4("Fall, Year 2"),
                wellPanel(
                  submitButton("Add Course")
                )
      ),
      fluidPage(h4("Spring, Year 2"),
                wellPanel(
                  submitButton("Add Course")
                )
      )
    )
  ),
  
  fluidRow(
    column(width = 3,
      wellPanel(
        submitButton("Submit")
      )     
    )
  ),
  
  fluidPage(
    h4("Report:")
  )
  
)
