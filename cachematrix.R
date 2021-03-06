## This pair of functions should work together to: 
## 1) create a cacheable matrix (makeCacheMatrix)
## 2) invert the matrix itself (cacheSolve)

## makeCacheMatrix is a creator function used to obtain a matrix that is cacheable for subsequent
## analysis (inversion by the cacheSolve function, that is)

makeCacheMatrix <- function(x = matrix()) {
    inv <<- NULL
    getmatrix <<- function() x
    setinverse <<- function(z) inv <<- z
    getinverse <<- function() inv
}

## cacheSolve is a function that calculates the inverse of the matrix previously
## created by makeCacheMatrix. To avoid unecessary computational efforts, this function
## only performs the matrix inversion calculation if the inverse matrix does not exist

cacheSolve <- function(x, ...) {
    m <- getmatrix()
    if(!is.null(inv)) {
        message("Cached inverse matrix:")
        print(inv)
	return(inv)
    } else {
        data <- getmatrix()
        inv <- solve(data, ...)
        setinverse(inv)
        message("Computed inverse matrix:")
        print(inv)
	return(inv)
    }
}
