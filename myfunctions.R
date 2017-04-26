cleanMyString <- function(string){
  string = str_sub(string, start=2, end=-2) # removes the "I" located 1st and last
  string = str_replace(string, " I ", "") # removes the middle "I"
  string = str_trim(string, side = "both")
  #string = str_split(string," I ",2)
  return(string)
}