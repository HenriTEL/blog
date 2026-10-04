## Terraform

Changes are often hidden in plan because they depend on other values that will only be known at execution time.

## Community Modules Issues
Can’t destroy security group -> that’s because it takes a long time for aws to allow the removal of the underlying eni (interfaces) -> still it should not recreate the security group
Can’t ignore image_uri changes in lambda
