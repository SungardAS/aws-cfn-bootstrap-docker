#!/bin/ash
set -e

aws ecr get-login --registry-ids $ECR_REGISTRY_IDS | ash
