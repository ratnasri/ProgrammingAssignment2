## Date: 18th Sep 2014
## Purpose: R programming Assignment week 3
## This file contains 2 functions
## Function1: The following function creates a special matrix, which is really a list containing a function to
## set/get the matrix
## set/get inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
	im <- NULL

	set <- function(y) {
		x <<- y
		im <<- NULL
	}

	get <- function() x
	setinverse <- function(inverse) im <<- inverse
	getinverse <- function() im
	list (set = set, get = get, setinverse = setinverse, 
		getinverse = getinverse)

}


## Function 2
## The following function returns matrix inverse matrix. 
## It attempts to get the inverse from cache.
## If not found, computes inverse and caches now.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	im <- x$getinverse()
	if(!is.null(im)) {
		message("getting cached data")
		return(im)
	}
	m <- x$get()   #Get matrix

	im <- solve(m)
	x$setinverse(im)
	im
}
