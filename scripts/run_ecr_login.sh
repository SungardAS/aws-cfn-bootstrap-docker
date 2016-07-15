#!/bin/ash
set -e

aws ecr get-login $ECR_REGISTRY_IDS | ash
