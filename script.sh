github_repo=$1
dockerhub_repo=$2

DOCKER_USER=$DOCKER_USER
DOCKER_PWD=$DOCKER_PWD

echo "$DOCKER_PWD" | docker login --username "$DOCKER_USR" --password-stdin

echo "Cloning repo $github_repo..."
git clone "https://github.com/$github_repo.git"
cd "$(basename "$github_repo")"

echo "Building the Docker image..."
docker build -t "$dockerhub_repo":latest .

# echo "Logging in to Docker Hub..."
# docker login

echo "Pushing the image to Docker Hub..."
docker push "$dockerhub_repo":latest