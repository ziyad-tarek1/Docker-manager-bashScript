DOCKERHUB_USER="ziyadtarek99"
DOCKERHUB_PASSWORD="Suth@0540"
echo "$DOCKERHUB_PASSWORD" | docker login --username $DOCKERHUB_USER --password-stdin

echo "Enter the image name and tag (e.g., flask-app:1.0): "
read IMAGE_NAME

echo "Choose an option:"
echo "1. Image is already tagged with Docker Hub username"
echo "2. Image is not tagged with Docker Hub username"
read choice

if [ $choice -eq 1 ]; then
  docker push $DOCKERHUB_USER/$IMAGE_NAME
  
elif [ $choice -eq 2 ]; then
  docker tag $IMAGE_NAME $DOCKERHUB_USER/$IMAGE_NAME
  docker push $DOCKERHUB_USER/$IMAGE_NAME
else
  echo "Invalid choice. Exiting."
  exit 1
fi