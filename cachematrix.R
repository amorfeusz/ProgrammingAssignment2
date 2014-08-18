## Put comments here that give an overall description of what your
## functions do

## This function takes an input matrix object and caches its inversed

makeCacheMatrix <- function(x = matrix()) {
 cachedmatrix <<- NULL #this will be the cached inverse
 
 get <- function() {x} #retrieves value of original vector
 
 cacheInverse <- function(solve) {   #used to cache
         cachedmatrix <<- solve
         }
 getInverse <- function() { cachedmatrix } #returns cached value
 
 list(get = get, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        cachedmatrix <- x$getInverse()         #retrieves value of inverse matrix
        if(!is.null(cachedmatrix)) {  
                message("getting cached matrix") #sends message to console
                return(cachedmatrix) #returns the cached matrix
        }
        data <- x$get()
        cachedmatrix <- solve(data,...) #since cachedmatrix was null we have to calculate
        x$cacheInverse(cachedmatrix)   #store calculated inverse
        cachedmatrix  #return cached matrix
}
