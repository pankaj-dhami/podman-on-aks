FROM quay.io/podman/stable

RUN dnf install -y curl git jq libicu helm

# Install Microsoft RPM and Azure CLI
RUN dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm && \
    dnf install -y azure-cli

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# install kubelogin
RUN az aks install-cli

# Also can be "linux-arm", "linux-arm64".
ENV TARGETARCH="linux-x64"

WORKDIR /azp/

COPY ./start.sh ./
RUN chmod +x ./start.sh

#RUN useradd agent
#RUN chown agent ./
#USER agent
ENV AGENT_ALLOW_RUNASROOT="true"

ENTRYPOINT ./start.sh

