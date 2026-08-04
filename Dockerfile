FROM jenkins/jenkins:lts

USER root

RUN apt-get update && \
    apt-get install -y ansible openssh-client netcat-openbsd curl wget unzip && \
    rm -rf /var/lib/apt/lists/*

RUN ARCH=$(dpkg --print-architecture) && \
    curl -fsSL "https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_${ARCH}.zip" -o terraform.zip && \
    unzip -o terraform.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/terraform && \
    rm terraform.zip && \
    terraform version

USER jenkins
