FROM python:3.10.5-slim-buster
RUN apt-get update -y && apt-get install -y ssh tshark && mkdir /run/sshd && adduser analyst --disabled-password --gecos "" && echo analyst:P@ssw0rd | chpasswd
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN python -m pip install peutils pefile pycryptodome pyshark
COPY ./DiderStevensSuite /home/analyst/DiderStevensSuite
COPY ./artifact /home/analyst/artifact