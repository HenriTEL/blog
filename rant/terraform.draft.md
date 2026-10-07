# I Hate Terraform

> Some of the reasons that makes terraform a pain to use.

Changes are often hidden in plan because they depend on other values that will only be known at execution time.

## You need to learn a framework, a language and a cli at the same time

Working with terraform means learning the Hashicorp Configuration Language.   
It also means learning the types of files, their format, naming conventions.  

## Modules are a mess

**They are inconsistent between each other**  

Because most modules are community provided, everybody has its own structure and naming scheme for it.  
What this means is that no matter how many modules you've used in the past, you'll have to look at the specifications for the next one you want to use.  
Sometimes it’s subnets, sometimes vpc_subnet_ids


Their documentation is bad. You usually have the list of all defined variables for a module, but if the variable is a `map`, well it's a map.
Exemples help but you'll have to dig into the code to know the exact format, to know what keys are optional and their default values for example.

Mismatch compared to the way you’d configure the same resource using the provider’s tooling

Support legacy ways of configuration, typically one parts of the configuration are for the legacy way and the other the new way.

Poor IDE integration

You need to define the variable and outputs of each module

Every time you change a module you need to initialize terraform again

Can’t destroy security group -> that’s because it takes a long time for aws to allow the removal of the underlying eni (interfaces) -> still it should not recreate the security group

Some very powerful features are only available in resources and not modules notably the `lifecycle` setting making things like ignoring changes for a specific value, for example version numbers managed by the CI, a big pain.
