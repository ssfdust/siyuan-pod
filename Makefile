caddy:
	podman build . -t docker.io/ssfdust/siyuan-pod:042802
push:
	podman push docker.io/ssfdust/siyuan-pod:042802

deploy:
	sudo k3s kubectl apply -f kube/siyuan-deployment.yaml
	sudo k3s kubectl apply -f kube/siyuan-service.yaml
