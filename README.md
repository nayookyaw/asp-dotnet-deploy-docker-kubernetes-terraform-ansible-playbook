🎉 FINAL RESULT

- ✔ NO source code copied
- ✔ NO registry used (fully offline capable)
- ✔ Docker image built on your Windows machine
- ✔ Image delivered via .tar file
- ✔ Ubuntu loads image into Docker
- ✔ kind cluster receives the image
- ✔ Terraform deploys everything
- ✔ ASP.NET backend + SQL Server running inside Kubernetes automatically

# ✅ Check the Ingress Controller port
* Find the HAProxy service + NodePort
`kubectl get svc -n ingress`

# ✅ Use kubectl rollout status (best for real-time monitoring)
`kubectl rollout status deployment/myapp-web -n your-namespace`

# ✅ Option A — watch each event
`kubectl get pods -n your-namespace -w`