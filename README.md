## R Client for the Alexa Web Information Services API

[![Build Status](https://travis-ci.org/cloudyr/aws.alexa.svg?branch=master)](https://travis-ci.org/cloudyr/aws.alexa)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/yh856e6cv7uucaj2?svg=true)](https://ci.appveyor.com/project/cloudyr/aws.alexa)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/alexa)](https://cran.r-project.org/package=alexa)
![](http://cranlogs.r-pkg.org/badges/grand-total/alexa)

Find information about domains, including the kind of content that they carry, how popular are they, sites linking to them, among other things.

The package provides access to the [Alexa Web Information Service API](http://docs.aws.amazon.com/AlexaWebInfoService/). 

### Installation

To get the latest version on CRAN:
```r
install.packages("aws.alexa")
```

To get the current development version from GitHub:

```r
# install.packages("devtools")
devtools::install_github("cloudyr/aws.alexa", build_vignettes = TRUE)
```

### Using alexa

To get acquainted with some of the important functions, see the vignette:

```r
# Overview of the package
vignette("introduction", package = "alexa")
```

### License
Scripts are released under the [MIT License](https://opensource.org/licenses/MIT).
