#!/usr/bin/env bash


set -o errexit
set -o nounset
set -o pipefail

#GO_CMD=${1:-go}
#SCRIPT_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
#CODEGEN_PKG=$($GO_CMD list -m -f "{{.Dir}}" k8s.io/code-generator)

SCRIPT_ROOT=$(dirname "${BASH_SOURCE[0]}")/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd "${SCRIPT_ROOT}"; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ../code-generator)}

source "${CODEGEN_PKG}/kube_codegen.sh"

THIS_PKG="github.com/Rudro-25/sample-controller"

kube::codegen::gen_helpers \
    --boilerplate "${SCRIPT_ROOT}/hack/copyright.txt" \
    "${SCRIPT_ROOT}/pkg/apis"

kube::codegen::gen_client \
    --with-watch \
    --output-dir "${SCRIPT_ROOT}/pkg/generated" \
    --output-pkg "${THIS_PKG}/pkg/generated" \
    --boilerplate "${SCRIPT_ROOT}/hack/copyright.txt" \
    "${SCRIPT_ROOT}/pkg/apis"

#

#controller-gen rbac:roleName=my-crd-controller crd paths=/home/user/Practice/CRD/pkg/apis/reader.com/v1 \
#crd:crdVersions=v1 output:crd:dir=//home/user/Practice/CRD/manifests output:stdout

#
echo "here"

OUTPUT_PATH="/home/user/go/src/github.com/Rudro-25/sample-controller/manifests"

# Print the current working directory
echo "Current working directory is: $(pwd)"

# Print the resolved absolute path
echo "Resolved absolute path is: $OUTPUT_PATH"

# Check if the directory exists
if [[ -d "$OUTPUT_PATH" ]]; then
  echo "Directory exists."
else
  echo "Directory does not exist. Creating it now..."
  mkdir -p "$OUTPUT_PATH"
fi

# Now run your controller-gen command
controller-gen rbac:roleName=my-crd-controller crd \
  paths=/home/user/go/src/github.com/Rudro-25/sample-controller/pkg/apis/rudro.dev/v1alpha1 \
  output:crd:dir="$OUTPUT_PATH" output:stdout




