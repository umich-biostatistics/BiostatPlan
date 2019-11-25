
ui = fluidPage(
  
  tags$head(
    tags$style(HTML("hr {border-top: 3px solid #000000;}"))
  ),
  
  fluidRow(
    headerPanel(h3("biosPlan: the Biostatistics M.S. course planner", style="color: #02169B; font-weight: bold;")),
              div(style = "height:55px; background-color: #F1F1F1;") 
  ),
  
  fluidRow(
    splitLayout(
      fluidPage(h4("Fall, Year 1"),
               wellPanel(
                 dataTableOutput("selected_FY1"),
                 selectInput("FY1_class", "Select a class", classes$Course),
                 actionButton("add_course_FY1", "Add Course", 
                              style="color: white; background-color: #02169B; border-color: #2e6da4")
               )
      ),
      fluidPage(h4("Spring, Year 1"),
                wellPanel(
                  dataTableOutput("selected_SY1"),
                  selectInput("SY1_class", "Select a class", classes$Course),
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
                  dataTableOutput("selected_FY2"),
                  selectInput("FY2_class", "Select a class", classes$Course),
                  actionButton("add_course_FY2", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      ),
      fluidPage(h4("Spring, Year 2"),
                wellPanel(
                  dataTableOutput("selected_SY2"),
                  selectInput("SY2_class", "Select a class", classes$Course),
                  actionButton("add_course_SY2", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      )
    )
  ),
  
  fluidRow(
    column(width = 3,
      wellPanel(
        actionButton("Submit_form", "Submit Form", 
                     style="color: black; background-color: #fcc203; border-color: #2e6da4")
      )
    )
  ),
  hr(),
  
  fluidPage(
    h4("Report:")
  )
  
)
