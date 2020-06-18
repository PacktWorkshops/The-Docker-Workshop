FROM busybox

ADD prepare.sh /usr/bin/prepare.sh
RUN chmod +x /usr/bin/prepare.sh

ENTRYPOINT ["sh", "/usr/bin/prepare.sh"] 
