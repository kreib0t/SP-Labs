FROM ubuntu
COPY script.sh .
RUN chmod +x script.sh
CMD ./script.sh
