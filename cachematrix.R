## These functions create a vector that contains functions to work with
## a matrix. In particular it performs the following functions
## 1) set the values of the matrix from the input parameter, a matrix
## 2) get the matrix (returns the matrix)
## 3) set the inverse of the matrix (calculates the inverse matrix)
## 4) get the inverse matrix (return the inverse matrix)
## Regarding the inverse matrix computing, it is performed only once
## and stored in cache

## This function creates a vector that contains functions to work with
## a matrix. In particular it stores the set, get, set inverse, and
## get inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  xinv <- NULL
  set <- function(y) {
    x <<- y
    xinv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) xinv <<- solve
  getinv <- function() xinv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## This functions calculates the inverse matrix for the input matrix
## In case the inverse has already been calculated, it does not
## calculate it again, it only returns the cached inverse matrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  xinv <- x$getinv()
  if(!is.null(xinv)) {
    message("getting cached data")
    return(xinv)
  }
  data <- x$get()
  xinv <- solve(data)
  x$setinv(xinv)
  xinv		
}
