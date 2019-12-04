
# global objects shared between UI and server

# List of all available classes
classes = read_csv("data/catalog.csv")

#' plan = list(
#'   'FYI' = classes[1:3,],
#'   #'SYI' = classes[17:20,],
#'   #'FY2' = classes[7,],
#'   'SY2' = classes[11:16,]
#' )
#' 
#' plan_df = do.call(rbind, plan)
#' 
#' check_funs$num_credits(plan)
#' check_funs$core_courses(plan_df)
#' check_funs$epid_requirement(plan_df)

check_funs = 
  list(
    'num_credits' = function(plan_df) {
      pass = sum(plan_df$Credits) >= 48
      if(!pass) { 'You have fewer than the required number of credits. 
                        48 credits are required.' }
      else{ NULL }
    },
    'core_courses' = function(plan_df) {
      core = filter(classes, Required == TRUE)$Course
      pass = all(core %in% plan_df$Course)
      if(!pass) { 'Your plan is missing at least one of the following core
        courses: BIOSTAT 601, BIOSTAT 602, BIOSTAT 650, BIOSTAT 651, BIOSTAT 653, BIOSTAT 699' }
      else{ NULL }
    },
    'epid_requirement' = function(plan_df) {
      course_names = plan_df$Course
      pass = any(c('PUBHLTH 512', 'EPID 601', 'EPID 621', 'EPID 516') %in% course_names)
      if(!pass) { 'Plan failed the Epidemiology requirement: 
        The epidemiology requirement may be satisfied in any one of the following four ways: 
        1. Taking and passing the Public Health 512 exemption examination. 
        2. Completing Epidemiology 601 (4 credits) or Public Health 512  (3 credits).
        3. Completing Epidemiology 516 and any necessary prerequisites to that course (3-6 credits).
        4. Completing Epidemiology 621 (3 credits) (This option can only be used to satisfy requirements for
        students funded by the Training Program in Cancer Research).' }
      else{ NULL }
    },
    'PH_requirement' = function(plan_df) {
      pass = FALSE
      if(!pass) { 'Reminder: Public Health Requirement (0 credit hours) All MS students 
        must complete Foundations of Public Health, an online non-credit course covering 
        12 foundational learning objectives required by the Council on Education in Public 
        Health CEPH. Students must pass the course exam with a cumulative score of 80% or 
        better to fulfill this degree requirement. Students with a prior MPH degree from a 
        CEPH-accredited program do not need to complete this course. ' }
      else{ NULL }
    },
    'biostat_electives' = function(plan_df) {
      chosen_electives = 
        plan_df %>% 
        filter(Required == FALSE)
      chosen_electives = 
        chosen_electives %>% 
          filter(Department == 'Biostatistics' | Department == 'Statistics') %>%
          filter(Credits >= 2)
      chosen_electives_biostat = 
        chosen_electives %>% filter(Department == 'Biostatistics') %>%
        filter(Number >= 600)
      chosen_electives_stat = 
        chosen_electives %>% filter(Department == 'Statistics') %>%
        filter(Number >= 500)
      chosen_electives = rbind(chosen_electives_biostat, chosen_electives_stat)
      pass = chosen_electives$Credits >= 12
      if(!pass) { 'Error: (12 credit hours) At least 12 credit hours of Biostatistics or 
        Statistics courses are required in addition to the core courses. Each course must be 
        ≥2 credit hours and may be selected from Biostatistics at the 600/800 level or from 
        Statistics at the 500/600 level, including special topic courses (BIOS 664 or BIOS 830). 
        One-credit seminars and journal clubs (e.g., BIOS 600, BIOS 605, BIOS 606, and BIOS 803) 
        do not count as electives.' }
      else{ NULL }
    },
    'open_electives' = function(plan_df) {
      pass = FALSE
      if(!pass) { 'Reminder: Open Electives (8-11 credit hours) MS students will 
        complete their required 48 credit hours with "open elective" courses, 
        including additional electives in biostatistics (600+ level) and statistics (500+ level), 
        Math 451, courses in public health or other areas to which biostatistics can be applied, 
        and courses in computational methods. All approved courses are on a list maintained by the 
        department and accessible to current Biostatistics students via Google Drive 
        document (goo.gl/GbbRw7). ' }
      else{ NULL }
    }
  )

# Generate list of check results
check = 
  function(plan) {
    plan_df = do.call(rbind, plan)
    results = map(check_funs, function(f) {f(plan_df)})
    return(results)
  }

search_class = 
  function(class_ID, classes) {
    return(class_ID %in% classes$Course)
  }
