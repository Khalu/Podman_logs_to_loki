FROM alpine:latest
COPY ./echo_every_5.sh /home/echo_every_5.sh
CMD /bin/sh /home/echo_every_5.sh