# R Client for the Alexa Web Information Services API

Use the [Alexa Web Information Service API](https://docs.aws.amazon.com/AlexaWebInfoService/latest/) to find information about domains, including the kind of content that they carry, how popular are they---rank and traffic history, sites linking to them, among other things.

To use the package, you will need an AWS account and enter your credentials into R. Your keypair can be generated on the [IAM Management Console](https://aws.amazon.com/) under the heading *Access Keys*. Note that you only have access to your secret key once. After it is generated, you need to save it in a secure location. New keypairs can be generated at any time if yours has been lost, stolen, or forgotten.

By default, all **cloudyr** packages look for the access key ID and secret access key in environment variables. You can also use this to specify a default region. For example:

```R
Sys.setenv("AWS_ACCESS_KEY_ID" = "mykey",
           "AWS_SECRET_ACCESS_KEY" = "mysecretkey",
           "AWS_DEFAULT_REGION" = "us-east-1")
```

These can alternatively be set on the command line or via an `Renviron.site` or `.Renviron` file ([see here for instructions](https://cran.r-project.org/package=httr/vignettes/api-packages.html)).

## Code Examples

To get acquainted with some of the important functions, see the [vignette](vignettes/overview.md). Or launch the vignette within R:

```r
# Overview of the package
vignette("introduction", package = "aws.alexa")
```

## License

Scripts are released under the [MIT License](https://opensource.org/licenses/MIT).

## Installation

[![Build Status](https://travis-ci.org/cloudyr/aws.alexa.svg?branch=master)](https://travis-ci.org/cloudyr/aws.alexa)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/yh856e6cv7uucaj2?svg=true)](https://ci.appveyor.com/project/cloudyr/aws.alexa)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/aws.alexa)](https://cran.r-project.org/package=aws.alexa)
![](https://cranlogs.r-pkg.org/badges/grand-total/aws.alexa)
[![codecov.io](https://codecov.io/github/cloudyr/aws.alexa/coverage.svg?branch=master)](https://codecov.io/github/cloudyr/aws.alexa?branch=master)

This package is not yet on CRAN. To install the latest development version you can install from the cloudyr drat repository:

```R
# latest stable version
install.packages("aws.alexa", repos = c(getOption("repos"), "http://cloudyr.github.io/drat"))
```

Or, to pull a potentially unstable version directly from GitHub:

```R
if(!require("ghit")){
    install.packages("ghit")
}
ghit::install_github("cloudyr/aws.alexa")
```


---
[![cloudyr project logo](http://i.imgur.com/JHS98Y7.png)](https://github.com/cloudyr)
