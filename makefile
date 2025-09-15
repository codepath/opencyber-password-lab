# Image names
FINAL_IMAGE=opencyber-password-lab:latest

# Default target: build the final image
all: student

# Build only the john-builder stage
build:
	docker build --target john-builder -f docker/Dockerfile .

# Build the final lab image (reuses cached builder layers)
student:
	docker build -t $(FINAL_IMAGE) -f docker/Dockerfile .

# Run an interactive container from the final image
run:
	docker run --rm -it $(FINAL_IMAGE)

# Clean up dangling images (optional)
clean:
	docker image prune -f

# Run the image from GitHub Container Registry
ghcr:
	docker run --rm -it ghcr.io/codepath/$(FINAL_IMAGE)