# aws.alexa

## ARCHIVED

**This package is archived.** The Amazon Alexa Web Information Service (AWIS) was permanently shut down by AWS:

- Alexa.com retired: May 1, 2022
- AWIS API retired: December 15, 2022
- [Official AWS End-of-Life Announcement](https://aws.amazon.com/data-exchange/resources/end-of-life-of-alexa-web-information-service/)

The API endpoint (`awis.amazonaws.com`) no longer resolves, and AWS documents no
replacement service. Every function in this package issues a request against
that endpoint, so none of them can succeed.

The package remains on CRAN as 0.1.8 (published 2020-11-10) and is left
installable so existing analyses stay reproducible. It is not maintained and
will not be fixed, because there is nothing left to call.

---

## Historical Documentation

This package provided an R client for the Alexa Web Information Service API to
find information about domains, including the kind of content that they carry,
how popular they were (rank and traffic history), sites linking to them, among
other things. AWS has taken the API reference down along with the service, so
there is no longer a documentation URL to link to.

### Code Examples

```r
vignette("introduction", package = "aws.alexa")
```

### License

Scripts are released under the [MIT License](https://opensource.org/licenses/MIT).

---
[![cloudyr project logo](http://i.imgur.com/JHS98Y7.png)](https://github.com/cloudyr)
