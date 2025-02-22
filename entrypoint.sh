#!/bin/sh

# Clone or update the repository
if [ -d "/workspace/.git" ]; then
  echo "Updating the repository..."
  cd /workspace
  git pull
else
  echo "Cloning the repository..."
  git clone https://github.com/home-assistant/brands /workspace
fi

cd /workspace
echo "Running the build script..."
bash ./scripts/build.sh

echo "Copying build outputs to /output..."
cp -r /workspace/build/* /output/

echo "Build complete."
#exec bash