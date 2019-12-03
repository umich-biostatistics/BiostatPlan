
ui = fluidPage(
  tags$head(
    tags$style(HTML("hr {border-top: 3px solid #000000;}"))
  ),
  # tags$footer(
  #   tags$style(HTML("hr {border-top: 3px solid #000000;}"))
  # ),
  
  fluidRow(
    headerPanel(h3("BiostatPlan: the Biostatistics M.S. course planner", style="color: #02169B; font-weight: bold;")),
              div(style = "height:72px; background-color: #F1F1F1;") 
  ),
  tags$br(), tags$br(),
  fluidRow(
    column(width = 7,
    wellPanel(
      h3(tags$b("Instructions")),
      hr(),
      h4("Use the `Select Courses` section to build your course plan. If a course is not available in the dropdown
         menu, use the `Create Course` section to add it."),
      h4("Once your course plan is finished, complete the `Submit Form` section to generate your report. Please
         download your report results before exiting the app or your progress will be lost."),
      h4("Note that the app is not comprehensive. Ensure that you and your advisor independenly validate your plan.")
    )
    )
  ),
  tags$br(), tags$br(), tags$br(),
  hr(), 
  h3(tags$b("Select Courses")),
  fluidRow(
    column(width = 7,
         h4("You can use the `Select a class` dropdown menu to scroll through classes. Alternatively, click the box
            and type to search for a class.")),
    column(width = 5)
  ),
  fluidRow(
    splitLayout(
      fluidPage(h4("Fall, Year 1"),
               wellPanel(
                 dataTableOutput("selected_FY1"),
                 selectInput("FY1_class", "Select a class", classes$Course),
                 actionButton("add_course_FY1", "Add Course", 
                              style="color: white; background-color: #02169B; border-color: #2e6da4"),
                 actionButton("remove_course_FY1", "Remove", 
                              style="color: white; background-color: #02169B; border-color: #2e6da4")
               )
      ),
      fluidPage(h4("Winter, Year 1"),
                wellPanel(
                  dataTableOutput("selected_SY1"),
                  selectInput("SY1_class", "Select a class", classes$Course),
                  actionButton("add_course_SY1", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4"),
                  actionButton("remove_course_SY1", "Remove", 
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
                               style="color: white; background-color: #02169B; border-color: #2e6da4"),
                  actionButton("remove_course_FY2", "Remove", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      ),
      fluidPage(h4("Winter, Year 2"),
                wellPanel(
                  dataTableOutput("selected_SY2"),
                  selectInput("SY2_class", "Select a class", classes$Course),
                  actionButton("add_course_SY2", "Add Course", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4"),
                  actionButton("remove_course_SY2", "Remove", 
                               style="color: white; background-color: #02169B; border-color: #2e6da4")
                )
      )
    )
  ),
  tags$br(), tags$br(), tags$br(),
  hr(),
  h3(tags$b("Create Course")),
  fluidRow(
    column(width = 6,
           h4("Use the 'Select a class' dropdown menus above to select classes. If the desired class is not in our limited database, 
        add it to the dropdown options here. Note that we do not check whether the class you enter is approved."),
           tags$br(),
           h4("Classes entered this way will be lost when you exit the app. Make sure you download your results
              before exiting.")
    ),
    column(
      width = 6,
      inputPanel(
        inputPanel(
          h5("Course ID"),
          textInput("Course_ID_text", "", width = '90%')
        ),
        inputPanel(
          h5("Course Name"),
          textInput("Course_Name_text", "", width = '90%')
        ),
        inputPanel(
          h5("# credit hours"),
          textInput("Course_hours_text", "", width = '90%')
        ),
        actionButton("add_new_course", "Add", 
                     style="color: white; background-color: #02169B; border-color: #2e6da4"),
        uiOutput("add_class_error")
      )
    ),
    column(width = 6)
  ),
  tags$br(), tags$br(), tags$br(),
  hr(),
  h3(tags$b("Submit Form")),
  fluidRow(
    column(width = 6,
           h4("The `Generate report` button will check for errors and download the report as a webpage.
              Click the on the downloaded file to open it in a web browser."),
           tags$br(),
           h4("If your web browser prevents the download, you may have to change the download settings to 
              allow downloads from this site.")
    ),
    column(width = 3,
      wellPanel(
        downloadButton("report", "Generate report", 
                     style="color: black; background-color: #fcc203; border-color: #2e6da4")
      )
    )
  ), 
  tags$br(), tags$br(), tags$br(),
  fluidRow(
    HTML('<footer> 
          <div class="col-sm-12" style="height:55px; background-color: #F1F1F1; margin: 0; overflow: hidden; padding: 0"></div>
       </footer>')
    )
  
)
