# Simple Kubernetes project: a book review API

This project demonstrates a basic Express.js application deployed
on Kubernetes using Minikube. It implements a simple book management system with SQLite storage.

## Prerequisites

- Docker
- Minikube
- kubectl
- Node.js 18+

## Project Structure

```
.
├── app.js           # Express application
├── package.json     # Node.js dependencies
├── Dockerfile       # Container definition
├── deployment.yaml  # Kubernetes deployment configuration
├── service.yml      # Kubernetes service definition
└── configmap.yml    # Application configuration values
```

## Installation

1. Install Kubernetes tools:
```bash
# Install kubectl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update && sudo apt install kubectl

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

2. Start Minikube:
```bash
minikube start
```

## Deployment

1. Point your Docker CLI to Minikube's Docker daemon:
```bash
eval $(minikube docker-env)
```

2. Build the Docker image:
```bash
docker build -t bookreview-api:latest .
```

3. Deploy to Kubernetes:
```bash
kubectl apply -f configmap.yml
kubectl apply -f deployment.yaml
kubectl apply -f service.yml
```

4. Get the service URL:
```bash
minikube service bookreview-service --url
```

## API Endpoints

- `GET /`: Health check endpoint
- `GET /books`: List all books
- `POST /books`: Create a new book
- `GET /books/:id`: Get a specific book

Example usage:
```bash
# Create a new book
curl -X POST \
  "$(minikube service bookreview-service --url)/books" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "The Hitchhikers Guide to the Galaxy",
    "author": "Douglas Adams"
  }'

# List all books
curl "$(minikube service bookreview-service --url)/books"
```

## Kubernetes Configuration

The project's Kubernetes configuration is split across three files:

- `deployment.yaml`: Defines how the application should be deployed, including container specifications, resource requirements, and volume mounts.
- `service.yml`: Exposes the application to the network, defining how to access the API pods.
- `configmap.yml`: Stores configuration values like database URLs and other application settings that can be changed without rebuilding the container.

## Architecture

This project demonstrates several key Kubernetes concepts:
- **Deployments**: Manages the ReplicaSet for our API pods
- **Services**: Exposes the API using NodePort
- **Volumes**: Provides persistent storage for SQLite
- **Container Configuration**: Shows proper containerization of a Node.js application

The application uses SQLite for simplicity, though in a production environment you would typically use a proper database service.

## Development

The Express.js application uses Sequelize for ORM. The database schema includes a simple Book model with title and author fields.

To modify the application:
1. Update `app.js`
2. Rebuild the Docker image
3. Reapply the Kubernetes deployment

## Troubleshooting

- Check pod status: `kubectl get pods`
- View pod logs: `kubectl logs -l app=bookreview-api`
- Pod details: `kubectl describe pod <pod-name>`
- Service details: `kubectl describe service bookreview-service`