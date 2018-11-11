FROM centos:centos7

LABEL maintainer jsuzuki20120311 <shukatu.2012.5.25@gmail.com>

RUN cd /root/ && \
    mkdir downloads

WORKDIR /root/downloads

RUN yum install bzip2 -y && \
    curl https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O && \
    chmod +x ./Miniconda3-latest-Linux-x86_64.sh && \
    bash ./Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    rm -r /root/downloads/

ENV PATH opt/miniconda/bin:$PATH

CMD [ "/bin/bash" ]
