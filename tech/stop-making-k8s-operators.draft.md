# Stop making kubernetes operators

## CRDs introduce unjustified complexity
* Operating kubernetes feels like Object Oriented Programming, you must learn new specs for each resource.
* Usually you only need the CRD for one deployment. Is it really worth it to make a class for just one object instance in the entire system ?
* K8s expertise is not sufficient, now you need to be an Elasticsearch Operator expert.
* New code that has likely not been as reviewed as core k8s has to be introduced, this code integrates with core k8s components so it better be clean and secure. Good luck with checking all the Roles, controllers, finalizers, network accesses, etc.

## You lose granularity
Underlying resources are only customizable as much as the parent resource allows it, CRD devs probably have only implemented what was needed for the clusters they are working with and it does not match all the cluster specificities of the industry.  
What if the network policies must be explicit for each deployment?  
What if it needs specific NodeAffinities? ServiceAccount? PersistentVolumeClaims?  
What if one component must be managed externally?  

## It’s a new source of bugs
What if the controller is broken ?  
The cluster was updated and now the operator does not match the new resources specs.  
For example selfLink was empty https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner/issues/25  
Now you discover that the operator is no longer maintained.



## Counter arguments
It is required for some stateful apps (ES node removal) → just make a custom finalizer  
We need it to decorelate TODO (prometheus serviceMonitor) → just make a configmap with the right labels to be taken into account by prometheus
