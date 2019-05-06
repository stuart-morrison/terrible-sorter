# Inefficient ordering

Somewhat inspired by this beautiful video of computer sorting algorithms, I set out to write my own. Knowing full well that I would likely discover a method that performs worse, I leaned into the wind.

My sorting algorithm takes a random arrangement of the integers up to the vector’s length and rearranges the original list in this order, repeating until the list is in order.

On average, this should perform in the order of O(n!)_!_


```
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
```

Using the microbenchmark package, this is, on average, circa 300,000 times slower than the default sort function.

```
library(microbenchmark)

microbenchmark(inefficient_sort(x), sort(x), times = 10)
 
Unit: microseconds
                 expr         min          lq         mean      median           uq          max
 inefficient_order(x) 3454323.589 5831976.813 25708513.570 9451126.667 32137622.969 96802481.587
              sort(x)      48.641      65.599       96.256      96.613      132.982      137.444
 neval
    10
    10
```

Still works though.

