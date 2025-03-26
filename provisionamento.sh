#!/bin/bash
set -e # Encerra o script em caso de erro

# Etapa 1: Atualizar o servidor
echo "Atualizando o sistema..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Etapa 2: Instalar o Apache2
echo "Instalando Apache2..."
sudo apt-get install apache2 -y
sudo systemctl enable apache2
sudo systemctl start apache2

# Etapa 3: Instalar o Unzip
echo "Instalando Unzip..."
sudo apt-get install unzip -y

# Etapa 4: Baixar a aplicação
echo "Baixando aplicação..."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /tmp

# Etapa 5: Extrair e copiar arquivos
echo "Configurando aplicação..."
sudo unzip -o /tmp/main.zip -d /tmp/
sudo cp -rf /tmp/linux-site-dio-main/* /var/www/html/

# Etapa 6: Configurar Git e enviar script
echo "Preparando para enviar ao GitHub..."
sudo apt-get install git -y




echo "Provisionamento concluído! Acesse: http://$(curl -s ifconfig.me)"
