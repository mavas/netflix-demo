# netflix-demo

A Netflix-like demonstration of systems design and implementation.

Just like Netflix, there is a client and server.  The client is what the user interacts with, and it communicates with the server in order to stream content.

This demonstration has a number of hand-made videos and dynamically streams them to a number of user clients.

## Very quick third-party demo (no Docker required)

```
# Run the server:
git clone https://github.com/gwuhaolin/livego

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
