#!/bin/sh

#variables
I_PATH="cluster_yamls"

#remove completed pods
kubectl delete pod --field-selector=status.phase==Succeeded -A

#apply cluster yamls to setup test environment
kubectl apply -f $I_PATH/