# netflix-demo

A Netflix-like demonstration of systems design and implementation.

## Description

Just like Netflix, there is a client and server.  The client is what the user interacts with, and it communicates with the server in order to stream content.

This demonstration has a number of hand-made videos and dynamically streams them to a number of user clients according to their preferences.

```
git clone https://github.com/mavas/netflix-demo
cd netflix-demo
docker build -t netflix-demo .
```

### User preferences, and the contrived hand-made videos

The videos used here are very very contrived and artificial: they feature only elementary shapes like triangles, circles, and squares, and transitions like fading in and fading out, and only those things.  That is, they aren't designed to be particularly entertaining: they are designed to help the system demonstrate how it takes into account user preferences, and the algorithms involved.

## An alternative third-party demonstration

This section right here is entirely seperate from the main point of this repository, but is here just to demonstrate a similar system using two off-the-shelf projects.  This demonstration just shows a client connecting to a server, and making it so that the client successfully plays back audio that you manually upload and push to the server.

The server thankfully requires no building, and can be run using a single `docker run` command, and leaving it hanging, precisely because the relevant image is provided by Docker Hub and thusly is readily available.  Since the client isn't on Docker Hub, and must be downloaded and compiled to run for the purposes of this little demo, I've helpfully made a Docker image for you which does both of these things for you.

```
# Run the server:
docker run --rm -p 1935:1935 -p 7001:7001 -p 7002:7002 -p 8090:8090 gwuhaolin/livego

# Build and run the client:
docker build -t netflix-demo-client .

# Use the ffmpeg command to play a music file to the server, which then streams
# it to the client:
ffmpeg -i demo.flv http://localhost:6060/channel

# At the end of all this, on the client, you should hear the music being
# streamed.
```

## Disclaimer

This demonstration is a work in progress, as of June 2022, and so doesn't actually work yet.
