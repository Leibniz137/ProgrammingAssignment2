test.examples <- function() {
  input <- makeCacheMatrix(x = matrix(c(1,2,3,4), nrow=2, ncol=2))
  expected <- matrix(c(-2, 1, 1.5, -0.5), nrow=2, ncol=2)
  cacheSolve(input)
  checkEquals(input$getinverse(), expected)
}
