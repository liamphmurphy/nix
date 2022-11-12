#!/bin/sh

LATEST_GO=$(curl -s "https://go.dev/VERSION?m=text")
INSTALLED_GO=$(go version)

if echo "$INSTALLED_GO" | grep -q $LATEST_GO; then
	echo "latest Go $LATEST_GO installed, skipping".
	exit 0
fi

pushd /tmp

wget "https://dl.google.com/go/$LATEST_GO.linux-amd64.tar.gz"

# Command chain taken directly from Go install docs: https://go.dev/doc/install

mkdir -p /usr/local/
rm -rf /usr/local/go && tar -C /usr/local -xzf $LATEST_GO.linux-amd64.tar.gz

if ! grep -q "PATH=\$PATH:/usr/local/go/bin" ~/.zshrc; then
	echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.zshrc
fi

echo "Done installing Go version $LATEST_GO."

popd # Get back to where we started.
