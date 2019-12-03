
# global objects shared between UI and server

# List of all available classes
classes = read_csv("data/catalog.csv")

check_funs = 
  list(
    'num_credits' = function(plan) {
      do.call(function(x) sum(x$Credits))
    }
  )

# Generate list of check results
check = 
  function(plan) {
    results = vector(mode = "list", length = 50L)
    
    return(results)
  }

search_class = 
  function(class_ID, classes) {
    return(class_ID %in% classes$Course)
  }