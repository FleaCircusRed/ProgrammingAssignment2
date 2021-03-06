## Put comments here that give an overall description of what your
## functions do

## Takes a matrix and returns a list containing four functions,
##get - returns the matrix, 
##set - set the matrix, 
##getinverse - get the inverse of the matrix, 
##setinverse - set the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inverseArg) inverse <<- inverseArg
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## takes the list generated by makeCacheMatrix and returns the inverse of 
## the matrix contained within and caches the result for future calls

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
  }
  matrix <- x$get()
  inverse <- solve(matrix, ...)
  x$setinverse(inverse)
  inverse
}
