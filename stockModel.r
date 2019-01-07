>#import data:
>
>LUV <- read.csv(".../575 Project/data/LUV sorted.csv")
>
>#name variable:
>y <- LUV$Adj.Close
>
>#time series plot:
>plot.ts(y, main="time series plot of Southwest Airlines stock price", xlab="Time", ylab="Stock price for >Southwest Airlines")
>
>#sample size:
>length(y) 
[1] 1256

> # define t
> i=c(1:1256)
> t <- i/1256
> 
> # sample correlation
> cor(y, t)
[1] 0.7349729
>
> #linear regression of y on t with intercept
> summary(lm(y ~ t))

Call:
lm(formula = y ~ t)

Residuals:
    Min      1Q  Median      3Q     Max 
-6.6993 -1.6443 -0.4241  1.8492  7.7813 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)   8.7954     0.1427   61.65   <2e-16 ***
t                   9.4787     0.2470   38.38   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 2.527 on 1254 degrees of freedom
Multiple R-squared: 0.5402,	Adjusted R-squared: 0.5398 
F-statistic:  1473 on 1 and 1254 DF,  p-value: < 2.2e-16 

#linear regression of stock price on a fifth-order polynomial
> t2 <- t^2
> t3 <- t^3
> t4 <- t^4
> t5 <- t^5
> poly <- lm(y ~ t + t2 + t3 + t4 + t5)
> summary(poly)

Call:
lm(formula = y ~ t + t2 + t3 + t4 + t5)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.6229 -1.2313 -0.2208  1.0478  5.4320 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)     5.7026     0.3049  18.702   <2e-16 ***
t              66.0259     6.1481  10.739   <2e-16 ***
t2           -374.4336    38.0304  -9.846   <2e-16 ***
t3            998.4921    96.3048  10.368   <2e-16 ***
t4          -1086.4874   106.0649 -10.244   <2e-16 ***
t5            403.8344    42.1801   9.574   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.789 on 1250 degrees of freedom
Multiple R-squared: 0.7703,	Adjusted R-squared: 0.7694 
F-statistic: 838.4 on 5 and 1250 DF,  p-value: < 2.2e-16

> # Forward algorithm
> # step 1

> summary(lm(y ~ t))

Call:
lm(formula = y ~ t)

Residuals:
    Min      1Q      Median      3Q     Max 
-6.6993 -1.6443 -0.4241   1.8492   7.7813 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)   8.7954     0.1427   61.65   <2e-16 ***
t                   9.4787     0.2470   38.38   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 2.527 on 1254 degrees of freedom
Multiple R-squared: 0.5402,	Adjusted R-squared: 0.5398 
F-statistic:  1473 on 1 and 1254 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t2))

Call:
lm(formula = y ~ t2)

Residuals:
    Min      1Q       Median      3Q     Max 
-6.8690 -2.3602   -0.0936   2.1266  8.5226 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)  10.9527     0.1236   88.58   <2e-16 ***
t2                  7.7482     0.2762   28.05   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 2.921 on 1254 degrees of freedom
Multiple R-squared: 0.3856,	Adjusted R-squared: 0.3851 
F-statistic:   787 on 1 and 1254 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t3))

Call:
lm(formula = y ~ t3)

Residuals:
   Min     1Q     Median     3Q    Max 
-6.560 -2.873   -0.020  2.434  8.968 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)  11.8547     0.1204   98.48   <2e-16 ***
t3                 6.7246     0.3180   21.14   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 3.199 on 1254 degrees of freedom
Multiple R-squared: 0.2628,	Adjusted R-squared: 0.2622 
F-statistic: 447.1 on 1 and 1254 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t4))

Call:
lm(formula = y ~ t4)

Residuals:
    Min      1Q         Median      3Q     Max 
-6.1078    -3.0628   0.0895  2.6652  9.1647 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)  12.3573     0.1191  103.76   <2e-16 ***
t4                  5.8944     0.3567   16.53   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 3.376 on 1254 degrees of freedom
Multiple R-squared: 0.1789,	Adjusted R-squared: 0.1782 
F-statistic: 273.1 on 1 and 1254 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t5))

Call:
lm(formula = y ~ t5)

Residuals:
    Min      1Q      Median      3Q     Max 
-5.8777 -3.0090  0.0186  2.8960  9.2197 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)  12.6716     0.1181  107.25   <2e-16 ***
t5                  5.1888     0.3910   13.27   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 3.489 on 1254 degrees of freedom
Multiple R-squared: 0.1231,	Adjusted R-squared: 0.1224 
F-statistic: 176.1 on 1 and 1254 DF,  p-value: < 2.2e-16 

# step 2

> summary(lm(y ~ t + t2))

Call:
lm(formula = y ~ t + t2)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.6962 -1.5278  0.0967  1.5534  6.4687 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   5.7653     0.1810   31.86   <2e-16 ***
t            27.6303     0.8352   33.08   <2e-16 ***
t2          -18.1372     0.8081  -22.45   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 2.135 on 1253 degrees of freedom
Multiple R-squared: 0.672,	Adjusted R-squared: 0.6715 
F-statistic:  1284 on 2 and 1253 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t + t3))

Call:
lm(formula = y ~ t + t3)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.4517 -1.4269  0.1295  1.4166  6.1535 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   6.1456     0.1532   40.12   <2e-16 ***
t            21.3855     0.4971   43.02   <2e-16 ***
t3          -13.2123     0.5056  -26.13   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 2.034 on 1253 degrees of freedom
Multiple R-squared: 0.7024,	Adjusted R-squared: 0.7019 
F-statistic:  1478 on 2 and 1253 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t + t4))

Call:
lm(formula = y ~ t + t4)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.5995 -1.3589  0.1159  1.3466  5.9904 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   6.4039     0.1386   46.22   <2e-16 ***
t            19.0315     0.3837   49.60   <2e-16 ***
t4          -11.9197     0.4147  -28.75   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.962 on 1253 degrees of freedom
Multiple R-squared: 0.7229,	Adjusted R-squared: 0.7225 
F-statistic:  1635 on 2 and 1253 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t + t5))

Call:
lm(formula = y ~ t + t5)

Residuals:
    Min      1Q  Median      3Q     Max 
-4.8325 -1.2846  0.0833  1.2839  5.9421 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   6.6102     0.1300   50.85   <2e-16 ***
t            17.6620     0.3281   53.82   <2e-16 ***
t5          -11.4312     0.3762  -30.38   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.918 on 1253 degrees of freedom
Multiple R-squared: 0.7352,	Adjusted R-squared: 0.7348 
F-statistic:  1740 on 2 and 1253 DF,  p-value: < 2.2e-16 

# step 3

> summary(lm(y ~ t + t5 + t2))

Call:
lm(formula = y ~ t + t5 + t2)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.3349 -1.1084 -0.1586  1.1193  5.8609 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   7.8496     0.1896  41.393  < 2e-16 ***
t             6.8402     1.2760   5.361 9.87e-08 ***
t5          -19.3455     0.9747 -19.848  < 2e-16 ***
t2           16.4744     1.8810   8.758  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.862 on 1252 degrees of freedom
Multiple R-squared: 0.7505,	Adjusted R-squared: 0.7499 
F-statistic:  1256 on 3 and 1252 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t + t5 + t3))

Call:
lm(formula = y ~ t + t5 + t3)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.3732 -1.1152 -0.1609  1.0956  5.9317 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   7.6029     0.1683  45.172   <2e-16 ***
t            11.1599     0.7964  14.013   <2e-16 ***
t5          -25.6987     1.6429 -15.642   <2e-16 ***
t3           18.5486     2.0825   8.907   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.861 on 1252 degrees of freedom
Multiple R-squared: 0.751,	Adjusted R-squared: 0.7504 
F-statistic:  1259 on 3 and 1252 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t + t5 + t4))

Call:
lm(formula = y ~ t + t5 + t4)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.3523 -1.1174 -0.1553  1.0921  5.9973 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   7.4154     0.1582  46.874   <2e-16 ***
t            12.9736     0.6388  20.309   <2e-16 ***
t5          -42.2963     3.6610 -11.553   <2e-16 ***
t4           33.4202     3.9442   8.473   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.866 on 1252 degrees of freedom
Multiple R-squared: 0.7496,	Adjusted R-squared: 0.749 
F-statistic:  1249 on 3 and 1252 DF,  p-value: < 2.2e-16

# step 4

> summary(lm(y ~ t + t5 + t3 + t2))

Call:
lm(formula = y ~ t + t5 + t3 + t2)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.3746 -1.1133 -0.1598  1.0911  5.9362 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   7.5852     0.2532  29.956  < 2e-16 ***
t            11.4492     3.1930   3.586 0.000349 ***
t5          -26.0792     4.3862  -5.946 3.57e-09 ***
t3           19.7033    12.5140   1.575 0.115623    
t2           -1.0567    11.2919  -0.094 0.925461    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.861 on 1251 degrees of freedom
Multiple R-squared: 0.751,	Adjusted R-squared: 0.7502 
F-statistic: 943.4 on 4 and 1251 DF,  p-value: < 2.2e-16 

> summary(lm(y ~ t + t5 + t3 + t4))

Call:
lm(formula = y ~ t + t5 + t3 + t4)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.3526 -1.1297 -0.1685  1.0935  5.7651 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   7.9473     0.2101  37.828  < 2e-16 ***
t             7.4041     1.5901   4.656 3.56e-06 ***
t5           18.7735    16.3928   1.145 0.252332    
t3           63.5248    16.6258   3.821 0.000140 ***
t4          -85.6131    31.3995  -2.727 0.006489 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.856 on 1251 degrees of freedom
Multiple R-squared: 0.7525,	Adjusted R-squared: 0.7517 
F-statistic: 950.9 on 4 and 1251 DF,  p-value: < 2.2e-16

# step 5

> summary(lm(y ~ t + t5 + t3 + t4 + t2))

Call:
lm(formula = y ~ t + t5 + t3 + t4 + t2)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.6229 -1.2313 -0.2208  1.0478  5.4320 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)     5.7026     0.3049  18.702   <2e-16 ***
t              66.0259     6.1481  10.739   <2e-16 ***
t5            403.8344    42.1801   9.574   <2e-16 ***
t3            998.4921    96.3048  10.368   <2e-16 ***
t4          -1086.4874   106.0649 -10.244   <2e-16 ***
t2           -374.4336    38.0304  -9.846   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.789 on 1250 degrees of freedom
Multiple R-squared: 0.7703,	Adjusted R-squared: 0.7694 
F-statistic: 838.4 on 5 and 1250 DF,  p-value: < 2.2e-16 

>#import data:
> XOM <- read.csv("…575 Project/data/XOM sorted.csv")
>
>#name variable:
> p <- XOM$Adj.Close
>
>#time series plot:
> plot.ts(p, main="time series plot of Exxon Mobil Corporation stock price", xlab="Time", ylab="Exxon Mobil Corporation stock price")
>
>#correlation:
> cor(y, p)
[1] 0.7885062
>
>#linear regression of y on p along with fifth-order polynomial of time:
>summary(lm(y ~ p + t + t2 + t3 + t4 + t5))

Call:
lm(formula = y ~ p + t + t2 + t3 + t4 + t5)

Residuals:
    Min      1Q  Median      3Q     Max 
-5.0529 -1.2152 -0.2388  1.1609  5.6388 

Coefficients:
              Estimate Std. Error t value Pr(>|t|)    
(Intercept)   -1.63986    0.77571  -2.114   0.0347 *  
p              0.36853    0.03605  10.223  < 2e-16 ***
t             48.79823    6.14401   7.942 4.39e-15 ***
t2          -303.73558   37.19591  -8.166 7.74e-16 ***
t3           821.77197   94.14988   8.728  < 2e-16 ***
t4          -892.48021  103.68044  -8.608  < 2e-16 ***
t5           331.31095   41.15131   8.051 1.90e-15 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 1.719 on 1249 degrees of freedom
Multiple R-squared: 0.788,	Adjusted R-squared: 0.787 
F-statistic:   774 on 6 and 1249 DF,  p-value: < 2.2e-16

>#define variable r:
>
> j <- c(2:1256)
> k <- c(1:1255)
> r <- y[j]/y[k] – 1
>
>#time series plot of Southwest Airlines stock return:
>
> plot.ts(r, main="time series plot of Southwest Airlines stock return", xlab="Time", ylab="Southwest Airlines stock return")

> #import data: 
> MSFT <- read.csv("…/575 Project/data/MSFT sorted.csv")
> GSPC <- read.csv("…/575 Project/data/^GSPC sorted.csv")
>
> #name variables:
> x1 <- p[j]/p[k] - 1
> x2 <- MSFT$Adj.Close[j]/MSFT$Adj.Close[k] - 1
> x3 <- GSPC$Adj.Close[j]/GSPC$Adj.Close[k] – 1
> library(car)
> scatterplotMatrix(~ r + x1 + x2 + x3)
> d <- data.frame(r, x1, x2, x3)
> cor(d)
           r                 x1            x2               x3
r  1.0000000 0.1230200 0.2759393 0.4461090
x1 0.1230200 1.0000000 0.2102218 0.3947396
x2 0.2759393 0.2102218 1.0000000 0.6579161
x3 0.4461090 0.3947396 0.6579161 1.0000000

# linear regression of r on x1, x2 and x3: 
> summary(lm(r ~ x1 + x2 + x3 - 1))

Call:
lm(formula = r ~ x1 + x2 + x3 - 1)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.195871 -0.014328  0.000323  0.015560  0.116080 

Coefficients:
   Estimate Std. Error t value Pr(>|t|)    
x1 -0.10172    0.04368  -2.329   0.0200 *  
x2 -0.03545    0.03407  -1.040   0.2983    
x3  1.02299    0.07396  13.831   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 0.0254 on 1252 degrees of freedom
Multiple R-squared: 0.2028,	Adjusted R-squared: 0.2009 
F-statistic: 106.1 on 3 and 1252 DF,  p-value: < 2.2e-16 

> #AIC: 
>
> m1 <- lm(r ~ -1)
> m2 <- lm(r ~ x1 - 1)
> m3 <- lm(r ~ x2 - 1)
> m4 <- lm(r ~ x3 - 1)
> m5 <- lm(r ~ x1 + x2 - 1)
> m6 <- lm(r ~ x1 + x3 - 1)
> m7 <- lm(r ~ x2 + x3 - 1)
> m8 <- lm(r ~ x1 + x2 + x3 - 1)
>
> p <- 2
> n <- length(r)
>
>#AIC:
>
> extractAIC(m1)
[1]     0.000 -8937.911
> extractAIC(m2)
[1]     1.000 -8955.222
> extractAIC(m3)
[1]     1.000 -9035.783
> extractAIC(m4)
[1]     1.000 -9214.112
> extractAIC(m5)
[1]     2.000 -9039.864
> extractAIC(m6)
[1]     2.00 -9217.22
> extractAIC(m7)
[1]     2.00 -9212.88
> extractAIC(m8)
[1]     3.000 -9216.305
>
>#selected model:
> summary(m6)

Call:
lm(formula = r ~ x1 + x3 - 1)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.195334 -0.014675  0.000343  0.015626  0.116206 

Coefficients:
   Estimate Std. Error t value Pr(>|t|)    
x1 -0.09851    0.04357  -2.261   0.0239 *  
x3  0.97376    0.05685  17.128   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 0.0254 on 1253 degrees of freedom
Multiple R-squared: 0.2021,	Adjusted R-squared: 0.2008 
F-statistic: 158.7 on 2 and 1253 DF,  p-value: < 2.2e-16 
>
>#BIC:
>
> extractAIC(m1, k=log(n))
[1]     0.000 -8937.911
> extractAIC(m2, k=log(n))
[1]     1.000 -8950.087
> extractAIC(m3, k=log(n))
[1]     1.000 -9030.648
> extractAIC(m4, k=log(n))
[1]     1.000 -9208.977
> extractAIC(m5, k=log(n))
[1]     2.000 -9029.594
> extractAIC(m6, k=log(n))
[1]     2.00 -9206.95
> extractAIC(m7, k=log(n))
[1]     2.000 -9202.611
> extractAIC(m8, k=log(n))
[1]     3.0 -9200.9
>
># selected model m4:
>
> summary(m4)

Call:
lm(formula = r ~ x3 - 1)

Residuals:
      Min        1Q    Median        3Q       Max 
-0.195227 -0.015402  0.000606  0.015949  0.116202 

Coefficients:
   Estimate Std. Error t value Pr(>|t|)    
x3  0.92303    0.05232   17.64   <2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 

Residual standard error: 0.02544 on 1254 degrees of freedom
Multiple R-squared: 0.1988,	Adjusted R-squared: 0.1982 
F-statistic: 311.2 on 1 and 1254 DF,  p-value: < 2.2e-16 
>
> #investigating why AIC and BIC choose different models:
> n*log(sum((m4$residuals)^2)/n)
[1] -9216.112
> n*log(sum((m6$residuals)^2)/n)
[1] -9221.22
> log(n)
[1] 7.134891


>#2003
>
> # import data
> LUV.2003 <- read.csv("…/575 Project/data/LUV 2003.csv")
> GSPC.2003 <- read.csv("…/575 Project/data/GSPC 2003.csv")
>
> # define variables
> length(LUV.2003$Adj.Close)
[1] 252
> h = c(2:252)
> l = c(1:252)
> z3 <- GSPC.2003$Adj.Close[h]/GSPC.2003$Adj.Close[l] – 1
> r2003 <- LUV.2003$Adj.Close[h]/LUV.2003$Adj.Close[l] - 1
> rhat <- 0.92303 * z3
>
> length(r2003)
[1] 251
> m <- 251
> #ASPE in 2003:
> ASPE2003 <- (1/m)*sum((r2003-rhat)^2)
> ASPE2003
[1] 0.0003170422
>
> #2011
>
> # import data
> LUV.2011 <- read.csv("…/575 Project/data/LUV 2011.csv")
> GSPC.2011 <- read.csv("…/575 Project/data/GSPC 2011.csv")
>
> # define variables
>  length(LUV.2011$Adj.Close)
[1] 252
> # note that because m in 2011 is the same as m in 2003, so we can use the same indices h and l as before
> z3_2011 <- GSPC.2011$Adj.Close[h]/GSPC.2011$Adj.Close[l] - 1
> rhat_2011 <- 0.92303 * z3_2011
>
>#ASPE in 2011: 
> ASPE2011 <- (1/m)*sum((r2011-rhat_2011)^2)
> ASPE2011
[1] 0.0002598885
