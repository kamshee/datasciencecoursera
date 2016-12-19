## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache
## its inverse.
## Assume that the matrix supplied is always invertible
## Computing the inverse of a square matrix can be done with the solve 
## function in R. For example, if X is a square invertible matrix, 
## then solve(X) returns its inverse.
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y ## Assign the input argument to the x object in the 
                ## parent environment
                m <<- NULL ## Assign the value of NULL to the m object in the 
                ## parent environment
        }
        get <- function() x ## x comes from parent environment
        setinverse <- function(solve) m <<- solve ## use solve function to
                                                ## create inverse matrix
        getinverse <- function() m 
        list(set = set, ## each element in the list is created with 
             get = get, ## an elementName = value syntax
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'

## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix function. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
        m <- x$getinverse
        if(!is.null(m)) { ## If inverse matrix is in cache, inform and use
                message("getting cached data")
                m
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
