cd /tmp

export TERRAFORM_VERSION=1.1.9
echo "Installing Terraform v$TERRAFORM_VERSION"

curl -sS https://releases.hashicorp.com/terraform/{$TERRAFORM_VERSION}/terraform_{$TERRAFORM_VERSION}_darwin_amd64.zip > terraform.zip

unzip terraform.zip

chmod +x ./terraform

mv -f terraform $LOCAL_BIN/terraform

rm terraform.zip
