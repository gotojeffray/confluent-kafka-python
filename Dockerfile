FROM centos:7

USER root
COPY confluent.repo /etc/yum.repos.d/
RUN sh -c  'curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"' \
    && sh -c 'python get-pip.py' \
    && sh -c 'yum clean all; yum install -y librdkafka-devel python-devel gcc cyrus-sasl-gssapi cyrus-sasl-devel krb5-workstation'\
    && sh -c 'pip install --no-binary :all: confluent-kafka[avro]'

USER kafka
CMD ['/bin/bash'] 
