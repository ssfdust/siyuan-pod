caddy:
	podman build . -t docker.io/ssfdust/siyuan-pod:042803

push:
	podman push docker.io/ssfdust/siyuan-pod:042803

deploy:
	sudo k3s kubectl get namespace siyuan || sudo k3s kubectl create namespace siyuan
	sudo k3s kubectl --namespace siyuan apply -f kube/siyuan-deployment.yaml
	sudo k3s kubectl --namespace siyuan apply -f kube/siyuan-service.yaml

clean:
	sudo k3s kubectl delete deployment siyuan
	sudo k3s kubectl delete service siyuan

update:
	sudo k3s update deployment/siyuan-deployment -f ./kube/siyuan-deployment.yaml
