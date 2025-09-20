package cloud.deployments

# Ensure every cloud resource has 'environment' and 'owner' tags
valid_tags {
    input.resource.tags["environment"]
    input.resource.tags["owner"]
}

deny {
    not valid_tags
}

