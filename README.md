Objetivo: 

# Criar um bucket usando slug, usuario e politica

## Pre-requisitos: 

- Ter acesso a uma conta AWS, instalar e configurar o CLI:

Instalar o CLI:

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

Caso já esteja instalado, atualizar:

    sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update

Configurar o CLI: 

    aws configure

- Instalar o terraform:
(https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

Ensure that your system is up to date and you have installed the gnupg, software-properties-common, and curl packages installed. You will use these packages to verify HashiCorp's GPG signature and install HashiCorp's Debian package repository.

    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

Install the HashiCorp GPG key.

    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

Verify the key's fingerprint.

    gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

The gpg command will report the key fingerprint:

    /usr/share/keyrings/hashicorp-archive-keyring.gpg
    -------------------------------------------------
    pub   rsa4096 XXXX-XX-XX [SC]
    AAAA AAAA AAAA AAAA
    uid           [ unknown] HashiCorp Security (HashiCorp Package Signing) <security+packaging@hashicorp.com>
    sub   rsa4096 XXXX-XX-XX [E]

Add the official HashiCorp repository to your system. The lsb_release -cs command finds the distribution release codename for your current system, such as buster, groovy, or sid.

    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

Download the package information from HashiCorp.

    sudo apt update

Install Terraform from the new repository.

    sudo apt-get install terraform

Verificar instalação: 

    terraform -help

    terraform -help plan

Enable tab completion: 

    touch ~/.bashrc

Instalar pacote de autocomplete:

    terraform -install-autocomplete

*Restart shell

## Rodar o código: 

    terraform init

    terraform apply
