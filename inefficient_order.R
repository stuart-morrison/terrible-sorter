x <- runif(n = 10)

inefficient_sort <- function(x) {
    
    if (length(x) == 1) {
        return(x)
    }
    
    solve <- x
    in_order <- all(solve[1:(length(x) - 1)] < solve[2:length(x)])
    
    while (!in_order) {
        solve <- x[sample(x = 1:length(x), size = length(x),
                          replace = FALSE)]
        in_order <- all(solve[1:(length(x) - 1)] < solve[2:length(x)])
    }
    
    return(solve)
    
}

inefficient_order(x)

library(microbenchmark)

microbenchmark(inefficient_sort(x), sort(x),
               times = 10)

