
## Below are two functions that are used to create a
## special object that stores a matrix and caches its inverse.

## This function creates a special "matrix" object
## that can cache its inverse. It returns a list containing 4
## functions: 1.set the value of the matrix, 
## 2.get the value of the matrix,
## 3.set the value of the inverse, 4.get the value of the inverse.

makeCacheMatrix <- function(x = matrix()){

        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }

        get <- function() {
                 x
        }

        setinverse <- function(inverse) {
                i <<- inverse
        }

        getinverse <- function() {
                i
        }

        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## The following function calculates the inverse of the special "matrix"
## created with the above function. It first checks to see if the
## inverse has already been calculated. If so, it `get`s the inverse from the
## cache and skips the computation. Otherwise, it calculates the inverse of
## the data and sets the value of the inverse in the cache via the `setinverse`
## function.

casheSolve <- function(x, ...){
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}
