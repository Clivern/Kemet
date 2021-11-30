cd /tmp

export TERRAFORM_VERSION=0.13.7

echo "Installing Terraform v$TERRAFORM_VERSION"

curl -sS https://releases.hashicorp.com/terraform/{$TERRAFORM_VERSION}/terraform_{$TERRAFORM_VERSION}_darwin_amd64.zip > terraform.zip

unzip terraform.zip

chmod +x ./terraform

mv -f terraform $LOCAL_BIN/terraform_v0.13.7

rm terraform.zip
