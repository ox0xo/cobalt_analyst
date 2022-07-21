FROM python:3.10.5-slim-buster
RUN apt-get update -y \
    && apt-get install -y ssh tshark wget unzip \
    && mkdir /run/sshd \
    && adduser analyst --disabled-password --gecos "" \
    && echo analyst:P@ssw0rd | chpasswd \
    && python -m pip install peutils pefile pycryptodome pyshark \
    && cd /home/analyst \
    && wget https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/1768.json \
    && wget https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/1768.py \
    && wget https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/cs-decrypt-metadata.py \
    && wget https://raw.githubusercontent.com/DidierStevens/DidierStevensSuite/master/cs-parse-traffic.py \
    && wget https://raw.githubusercontent.com/DidierStevens/Beta/master/metatool.py \
    && chmod +x 1768.py cs-decrypt-metadata.py cs-parse-traffic.py metatool.py \
    && wget https://www.malware-traffic-analysis.net/2021/02/02/2021-02-02-Hancitor-with-Ficker-Stealer-and-Cobalt-Strike-and-NetSupport-RAT.pcap.zip \
    && unzip -P infected 2021-02-02-Hancitor-with-Ficker-Stealer-and-Cobalt-Strike-and-NetSupport-RAT.pcap.zip \
    && rm 2021-02-02-Hancitor-with-Ficker-Stealer-and-Cobalt-Strike-and-NetSupport-RAT.pcap.zip \
    && apt-get purge -y wget unzip
COPY ./EbHm /home/analyst/EbHm
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]