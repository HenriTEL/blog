# AWS ApiGateway Is Not Compliant With OpenAPI Specs

So you can import an OpenAPI file to update an existing API definition in API Gateway.  
It supports most of the OpenAPI 2.0 and 30.0 specification, with about [26 exceptions](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-known-issues.html#api-gateway-known-issues-rest-apis).  
Notably:

* API Gateway models are defined using JSON schema draft 4, instead of the JSON schema used by OpenAPI.
* The `example` tag is not supported.
