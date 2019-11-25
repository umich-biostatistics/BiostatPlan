
ui = fluidPage(
  
  fluidRow(
    headerPanel(h3("biosPlan: the Biostatistics M.S. course planner", style="color: #02169B")),
              div(style = "height:55px;background-color: #F1F1F1;") 
  ),
  
  
  fluidRow(
    splitLayout(
      fluidPage(h4("Fall, Year 1"),
               wellPanel(
                 textOutput("selected_FY1"),
                 selectInput("FY1_class", "Select a class", classes),
                 actionButton("add_course_FY1", "Add Course", 
                              style="color: white; background-color: #02169B; border-color: #2e6da4")
               )
      ),
      fluidPage(h4("Spring, Year 1"),
                wellPanel(
                  actionButton("add_course_SY1", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      )
    )
  ),
  
  fluidRow(
    splitLayout(
      fluidPage(h4("Fall, Year 2"),
                wellPanel(
                  actionButton("add_course_FY2", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      ),
      fluidPage(h4("Spring, Year 2"),
                wellPanel(
                  actionButton("add_course_SY2", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      )
    )
  ),
  
  fluidRow(
    column(width = 3,
      wellPanel(
        actionButton("Submit_form", "Submit Form")
      )
    )
  ),
  
  fluidPage(
    h4("Report:")
  )
  
)
