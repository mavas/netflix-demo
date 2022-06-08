# netflix-demo

A Netflix-like demonstration of systems design and implementation.

Just like Netflix, there is a client and server.  The client is what the user interacts with, and it communicates with the server in order to stream content.

This demonstration has a number of hand-made videos and dynamically streams them to a number of user clients according to their preferences.

## Very quick third-party demo

This demonstration just shows a client connecting to a server, and making it so that the client successfully plays back audio that you manually upload to the server.

The server can be run using a single `docker run` command, and leaving it hanging.  The client can be downloaded and compiled and run easily (via GoLang).

```
# Run the server:
docker run --rm -p 1935:1935 -p 7001:7001 -p 7002:7002 -p 8090:8090 gwuhaolin/livego

# Build and run the client:
git clone https://github.com/adrg/libvlc-go-examples
cd v3/gtk3_player
go get
go build

# Use the ffmpeg command to play a music file to the server, which then streams
# it to the client:
ffmpeg -i demo.flv http://localhost:6060/channel

# At the end of all this, on the client, you should hear the music being
# streamed.
```
