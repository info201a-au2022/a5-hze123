---
title: "Introduction"
author: "Zhien He"
date: "2022-12-09"
output: html_document
---


```r
source("app_server.R")
```

```
## Warning in file(filename, "r", encoding = encoding): cannot open file 'app_server.R': No such file or
## directory
```

```
## Error in file(filename, "r", encoding = encoding): cannot open the connection
```

## Introduction

This project is on the annual production-based emissions of carbon dioxide in  Africa and United States.

### The minimum emission of CO2 in United States


```r
US_lowest_co2
```

```
##    min_co2
## 0.253
```
According to the data, we can see the highest emission of CO2 in China is ***0.253 million tonnes***.

### The average emission in United States


```r
avg_co2_US
```

```
##    ave_co2
## 1900
```
According to the data, the average of CO2 emission in United States is ***1900 million tonnes***.

### The latest co2 emission in Africa


```r
max_co2_africa
```

```
## [1] 1450.796
```

According to the data, the latest CO2 emission in Africa is ***1450.796 million tonnes***. Compared with the average emission of US, it is a little bit lower.
