```
helm install database stable/postgresql --set postgresqlPassword=kubernetes
```

```
kubectl apply -f statefulset.yaml
```

```
kubectl apply -f service.yaml
```

```
minikube service panoramic-trekking-app --url
```
