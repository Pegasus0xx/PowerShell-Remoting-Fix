FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
        wget \
        curl \
        sudo \
        gnupg \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        libunwind8 \
        libicu67 \
        libssl-dev \
        libcurl4-openssl-dev

RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.5.1/powershell_7.5.1-1.deb_amd64.deb -O /tmp/pwsh.deb && \
    dpkg -i /tmp/pwsh.deb || apt-get install -f -y && \
    rm /tmp/pwsh.deb

RUN pwsh -Command "Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted; Install-Module -Name PSWSMan -Force"

RUN pwsh -Command "Install-WSMan"

RUN apt-get install -y gss-ntlmssp

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "pwsh" ]
