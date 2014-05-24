

## This set of functions are designed to cache a matrix and calculate
## and cache its inverse.

## Because this is focused on matricies and their inverses, the function 
## only works on square matricies

## The makeCacheMatrix has getter and setter methods
## for getting and setting both the matrix as well the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  
  m <- NULL
  
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() {
    x
  }
  
  setinverse <- function(inverse) {
    m <<- inverse
  }
  
  getinverse <- function() {
    m
  }
  
  
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## The cache solve matrix function first checks
## if an inverse matrix has been calculated
## If so, it returns the matrix.  If not, it calculates
## the inverse, stores it in the cache, and returns it.

cacheSolve <- function(x, ...) {

  ## Return a matrix that is the inverse of 'x'
  
  m <- x$getinverse()
  
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
