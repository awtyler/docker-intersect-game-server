FROM mono:latest
LABEL org.opencontainers.image.authors="rhindon"

# Add files to /intersect_build
RUN mkdir /intersect_build
ADD build/ /intersect_build/

# Map directory from host
VOLUME /intersect

# Set the Library Path for Mono
ENV LD_LIBRARY_PATH=/intersect

RUN chmod +x /intersect_build/init.sh

# Expose the server port
EXPOSE 5400/udp

CMD [ "/intersect_build/init.sh" ]