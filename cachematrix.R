# The following functions can be used to cache potentiall costly computations
# of matrix inverses in a special "cache matrix"

# Returns a special "matrix", which is really a list containing a function to:
  # 1. set the value of the matrix
  # 2. get the value of the matrix
  # 3. set the value of the inverse
  # 4. get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get, getinverse = getinverse, setinverse = setinverse)
}


# Calculates the inverse of the special "matrix" created with makeCacheMatrix
# First checks cache for solution
# If solution is missing from cache, computes it and adds it to the cache
cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}
