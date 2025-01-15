# AWS ApiGateway Is Not Compliant With OpenAPI Specs

So you can import an OpenAPI file to update an existing API definition in API Gateway.  
It supports most of the OpenAPI 2.0 and 3.0 specs, with about [26 exceptions](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-known-issues.html#api-gateway-known-issues-rest-apis).  
Notably:

* API Gateway models are defined using JSON schema draft 4, instead of the JSON schema used by OpenAPI.
* The `example` tag is not supported.
* For input parameters, only the following attributes are supported: `name`, `in`, `required`, `type`, `description`. Other attributes are ignored.
