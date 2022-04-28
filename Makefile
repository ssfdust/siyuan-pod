caddy:
	podman build . -t docker.io/ssfdust/siyuan-pod:042803
push:
	podman push docker.io/ssfdust/siyuan-pod:042803

deploy:
	sudo k3s kubectl apply -f kube/siyuan-deployment.yaml
	sudo k3s kubectl apply -f kube/siyuan-service.yaml

clean:
	sudo k3s kubectl delete deployment siyuan-deployment
	sudo k3s kubectl delete service siyuan
