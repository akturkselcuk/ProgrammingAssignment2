## This R script is meant for calculating inverse of an (invertible) matrix
## It mainly uses the "Solve" function.
## However, it caches data, which will come handy for large data sets.



makeCacheMatrix <- function(x = matrix()) {
    ## This fucntion creates the cache of the matrix
    m_inv <- NULL
    set <- function(y){
        x <<- y
        m_inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) m_inv <<- solve
    getinv <- function() m_inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)    
}



cacheSolve <- function(x, ...) {
    ## This function finds the reverse, by looking for cache values first
    m_inv <- x$getinv()
    if(!is.null(m_inv)) {
        message("getting cached data")
        return(m_inv)
    }
    data <- x$get()
    m_inv <- solve(data, ...)
    x$setinv(m_inv)
    m_inv    
    
}
