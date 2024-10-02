#!/usr/bin/env bash
set -x

mkdir ~/.aws
cat << 'EOF' > ~/.aws/config
[profile s3-role]
role_arn = ${rolename}
credential_source = Ec2InstanceMetadata
EOF
