FROM golang

RUN apt-get update -y
RUN apt-get install aptitude -y

# These 4 development libraries need to be installed on the Ubuntu operating
# system, in order for the followup libraries to compile successfully:
RUN aptitude install libvlc-dev libglib2.0-dev -y
RUN aptitude install libcairo-dev -y
RUN aptitude install libgtk-3-dev -y

# Build the library, and the binary:
RUN git clone https://github.com/adrg/libvlc-go && \
    cd libvlc-go/v3 && go build
RUN git clone https://github.com/adrg/libvlc-go-examples
RUN cd libvlc-go-examples/v3/gtk3_player && \
        go mod init example.com/m/v3 && \
	go get github.com/adrg/libvlc-go/v3 && \
	go get github.com/gotk3/gotk3/cairo && \
	go get github.com/gotk3/gotk3/gdk && \
	go get github.com/gotk3/gotk3/glib && \
        go get github.com/gotk3/gotk3/gtk && \
        go build -v

# ..
CMD ["./libvlc-go-examples/v3/gtk3_player/m"]
