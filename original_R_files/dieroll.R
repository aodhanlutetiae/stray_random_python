

# roll a six-sided die
dieroll <- function() {
    sample(1:6, 1)
}

# look at the histogram for 60 rolls
hist(replicate(100, dieroll()), breaks=seq(1:7), right=FALSE)

# now look at the histogram for a loaded die
loadedroll <- function() {
    loading = .25 #1/4, should be 1/6
    if (runif(1) < loading) {
        1
    } else {
        sample(2:6, 1)
    }
}

# look at the histogram for 60 rolls of loaded die
hist(replicate(60, loadedroll()), breaks=seq(1:7), right=FALSE)

# look at lots of histograms for 100 rolls
manyrolls <- function(n) {
    par(mfrow = c(3, 3))
    for (i in 1:9) {
        hist(replicate(n, dieroll()), breaks=seq(1:7), right=FALSE, xlab=NULL, ylab=NULL, main=NULL)
    }
    par(mfrow = c(1, 1))
}

# count the number of ways to get each sum of a two-dice roll
count = rep(0, 12)
for (i in 1:6) { 
    for (j in 1:6) {
        sum = i+j
        count[sum] = count[sum] + 1
    }
}
barplot(count)


# roll two six-sided dice and add them
twodieroll <- function() {
    dieroll() + dieroll()
}

# what do we see if we roll two dice 100 times?
rolls = replicate(100, twodieroll())

# look at the histogram for 100 rolls
hist(replicate(100, twodieroll()), breaks=seq(2:14), right=FALSE)

# look at lots of histograms for N rolls
manyrolls2 <- function(n) {
    par(mfrow = c(3, 3))
    for (i in 1:9) {
        hist(replicate(n, twodieroll()), breaks=seq(2:14), right=FALSE, xlab=NULL, ylab=NULL, main=NULL)
    }
    par(mfrow = c(1, 1))
}

manyrolls2(100)
