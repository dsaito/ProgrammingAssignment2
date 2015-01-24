## This pair of functions should work together to: 
## 1) create a cacheable matrix (makeCacheMatrix)
## 2) invert the matrix itself (cacheSolve)

## makeCacheMatrix is a creator function used to obtain a matrix that is cacheable for subsequent
## analysis (inversion by the cacheSolve function, that is)

makeCacheMatrix <- function(x = matrix()) {
    inv <<- NULL
    getmatrix <- function() x
    setinverse <- function(z) inv <<- z
    getinverse <- function() inv
}

## cacheSolve is a function that calculates the inverse of the matrix previously
## created by makeCacheMatrix

cacheSolve <- function(x, ...) {
    m <- getinverse()
    if(!is.null(inv)) {
        message("Cached inverse matrix:")
        print(inv)
    } else {
        data <- l$get()
        inv <- solve(data, ...)
        setinverse(inv)
        message("Computed inverse matrix:")
        print(inv)
    }
}