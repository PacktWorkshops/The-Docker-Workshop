FROM alpine

RUN apk update
RUN apk add wget curl nmap libcap

RUN addgroup --gid 10001 20002 && adduser 20002 -h /home/security_apps --disabled-password --uid 20002 --ingroup 20002
WORKDIR /home/security_apps

USER 20002

RUN echo "#!/sh\n" > test_memory.sh
RUN echo "cat /proc/meminfo; mpstat; pmap -x 1" >> test_memory.sh
RUN chmod 755 test_memory.sh

CMD ["sh", "/home/security_apps/test_memory.sh"]
