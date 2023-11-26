FROM ubuntu:latest
COPY . .
RUN useradd psd
RUN useradd rke
RUN groupadd tusurfb
RUN usermod -aG tusurfb psd
RUN usermod -aG tusurfb rke
CMD ["/2.sh"]
