A <- c(13.2, 8.2, 10.9, 14.3, 10.7, 6.6, 9.5, 10.8, 8.8, 13.3)
B <- c(14.0, 8.8, 11.2, 14.2, 11.8, 6.4, 9.8, 11.3, 9.3, 13.6)

boxplot(A,B, names = c("A", "B"), ylab="wear amt")
plot(1:10, A, xlab="subject", ylab="wear amt")
points(1:10, B, pch=16)

t.test(A, B)
t.test(A, B, paired = T)
t.test(A-B, mu = 0) # This works for testing paired samples too
