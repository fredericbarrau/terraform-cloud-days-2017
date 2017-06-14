#!/usr/bin/env bash
#
# EIP creation script
#
# So far, the EIP integration with terraform with outscale is rather buggy.
# For instance, destroying an instance attached to an EIP will destroy the EIP AS WELL
# Not really what is espected.
# Better create the EIP using the aws cli tool, and use the EIP Id in the terraform code,
# to keep it safe.
#
aws --endpoint-url https://fcu.eu-west-2.outscale.com ec2 allocate-address
aws --endpoint-url https://fcu.eu-west-2.outscale.com ec2 describe-addresses
