# Image names
IMAGE_NAME=opencyber-password-lab:latest

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
	docker run --rm -it $(IMAGE_NAME):local

# Clean up dangling images (optional)
clean:
	docker image prune -f

# Run the image from GitHub Container Registry
ghcr:
	docker run --rm -it ghcr.io/codepath/$(IMAGE_NAME):latest