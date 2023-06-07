FROM debian:latest

# Install necessary packages
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        apt-utils\
        bind9
RUN chmod o+w /etc/bind /etc/bind/named.conf.options
RUN chmod o+w /etc/bind /etc/bind/named.conf.local
RUN chmod o+w /etc/bind /etc/bind/named.conf


# Expose DNS port
EXPOSE 53/udp

# Start the DNS server
CMD ["named", "-g"]
