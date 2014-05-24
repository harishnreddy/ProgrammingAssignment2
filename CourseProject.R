
#RPROGRAMMING
#PROGRAMMING ASSIGNMENT #2

source("cachematrix.R")

myCachedMatrix <- makeCacheMatrix(matrix(c(0, -5, -4, 0), nrow=2, ncol=2, byrow=TRUE))

myCachedMatrix$get()    

myCachedMatrix$getinverse()

cacheSolve(myCachedMatrix)

myCachedMatrix$getinverse() 

myCachedMatrix$get() %*% myCachedMatrix$getinverse()

cacheSolve(myCachedMatrix)

myCachedMatrix$set(matrix(c(0, -3, -2, 0), nrow=2, ncol=2, byrow=TRUE))

myCachedMatrix$get()

myCachedMatrix$getinverse()

cacheSolve(myCachedMatrix) 

myCachedMatrix$get() %*% myCachedMatrix$getinverse()
