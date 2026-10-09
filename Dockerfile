# syntax=docker/dockerfile:1

# Build a self-contained image that serves THIS simspace. It bases on the
# prebuilt Simspace runtime and swaps in this repo's lab/ directory. The lab is
# loaded at runtime, so this is just a file copy — no app rebuild.
#
#   docker build -t swag-lab .
#   docker run --rm -p 8080:80 swag-lab      # open http://localhost:8080
#
# Pin RUNTIME_IMAGE to a released version for reproducible builds:
#   docker build --build-arg RUNTIME_IMAGE=dockersamples/simspace:1 -t swag-lab .

ARG RUNTIME_IMAGE=dockersamples/simspace:latest
FROM ${RUNTIME_IMAGE}

# Replace the runtime image's sample lab with this repo's lab.
RUN rm -rf /usr/share/nginx/html/lab
COPY lab/ /usr/share/nginx/html/lab/
