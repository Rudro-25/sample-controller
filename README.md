# sample-controller #

Group Name: rudro.dev

Version Name: v1alpha1

Resource Name: Kluster

## Code Gen ##
Code gen is needed for generating:
- DeepCopyObject
- Clientset
- Informer
- Lister

### Procedure ###

- import `"k8s.io/code-generator"` into `main.go`
- run `go mod tidy;go mod vendor`
- run `chmod +x ..../sample-controller/hack/codegen.sh`
- run `chmod +x vendor/k8s.io/code-generator/generate-groups.sh`
- `go install sigs.k8s.io/controller-tools/cmd/controller-gen@latest`
- run `hack/codegen.sh`
- again run `go mod tidy;go mod vendor`

## Deploy custom resource ##

Just create a yaml file like `manifests/kluster.yaml` and apply.

Run `kubectl get Kluster`

## Resource ##

- Sample Controller - [Link](https://github.com/kubernetes/sample-controller)
- Guidelines for writing controllers - [Link](https://github.com/kubernetes/community/blob/master/contributors/devel/sig-api-machinery/controllers.md)
- K8s Custom Controllers - [Link1](https://www.linkedin.com/pulse/kubernetes-custom-controllers-part-1-kritik-sachdeva/) [Link2](https://www.linkedin.com/pulse/kubernetes-custom-controller-part-2-kritik-sachdeva/)