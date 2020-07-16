FROM ubuntu:18.04
RUN apt-get update \
 && apt-get install -y stress=1.0.4 --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
CMD ["sh", "-c", "stress ${var}"]
