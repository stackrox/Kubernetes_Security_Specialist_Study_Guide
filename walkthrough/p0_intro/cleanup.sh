#!/bin/sh

#variables
I_PATH="cluster_yamls"

#remove cluster yamls to give default environment
kubectl delete -f $I_PATH/