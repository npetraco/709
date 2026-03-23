# Question of interest: Could the two sets of glass shards be from the same window ? 

# NULL HYPOTHESIS:        RI1 == RI2 (Side question: Problem here?)
# ALTERNATIVE HYPOTHESIS: RI1 != RI2

# RIs of shards from glass pane 1
RI1 <- c(1.53419, 1.53275, 1.53345, 1.53267, 1.53292, 1.53332, 1.53464, 1.53299, 1.53430, 1.53550)

# RIs of shards from glass pane 2
RI2 <- c(1.53577, 1.53606, 1.53602, 1.53544, 1.53618, 1.53604, 1.53551, 1.53572, 1.53580, 1.53567)

# It helps to look at a box-and-whiskers plot for two-sample tests:
boxplot(RI1, RI2)

# ****Check to see if (H0) variances of the two samples equal = 1 
# (i.e. evidence that vars are not equal??):
var.test(RI1, RI2)

# Two sample two sided hypothesis test for equivalence between means:
t.test(RI1, RI2, var.equal = FALSE, alternative = "two.sided", conf.level = 0.95)