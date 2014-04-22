        MakeCacheMatrix <- function(x = matrix()) {
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
            
        CacheSolve <- function(x, ...) {
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
        