# Image names
IMAGE_NAME=opencyber-password-lab

# Default target: build the final image
all: student

# Build only the john-builder stage
build:
	docker build --target john-builder -f docker/Dockerfile .

# Build the final lab image (reuses cached builder layers)
student:
	docker build -t $(IMAGE_NAME):local -f docker/Dockerfile .

# Run an interactive container from the final image
run:
	docker run --rm -it -v password-lab-data:/home/student $(IMAGE_NAME):local

# Clean up dangling images (optional)
clean:
	docker image prune -f

# Run the image from GitHub Container Registry
ghcr:
	docker run --rm -it -v password-lab-data:/home/student ghcr.io/codepath/$(IMAGE_NAME):latest

# Build and push to GitHub Container Registry (requires docker login ghcr.io)
push:
	docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/codepath/$(IMAGE_NAME):latest -f docker/Dockerfile --push .
