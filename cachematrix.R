## 'MakeCacheMatrix()' and 'CacheSolve()' are functions that complement eachother and allow to create, cache and return the inverse of a matrix.  

## 'MakeCacheMatrix()' creates a special matrix object that can cache its inverse.        

    makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(ymat) {
            x <<- ymat
            i <<- NULL
        }
        get <- function() x
        setinv <- function(Inverse) i <<- inv
        getinv <- function() i
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
    }  


## The 'CacheSolve()' function returns the inverse of the matrix returned by the function above. If the inverse of the matrix have already been calculated, than it retrieves the cached inverse.     

    cacheSolve <- function(x, ...) {
        i <- x$getinv()
        if(!is.null(i)) {
            message("Retrieving cached data!")
            i
        }
        data <- x$get()
        i <- Inverse(data, ...)
        x$setinv(i)
        i
    }  
    
