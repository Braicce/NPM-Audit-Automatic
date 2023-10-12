#!/bin/bash

# Definir os servidores que deseja se conectar
servers=(
   IPSERVER1
   IPSERVER2
)

# Defina o usuário e o caminho para a chave SSH
user=USER_TO_USE
ssh_key=/path_to_your_key/id_rsa

# Loop através dos servidores
for server in "${servers[@]}"
do

echo "Conectando em $server..."

# Comando que irá se conectar ao servidor via SSH e executar a busca pelo arquivo package.json / Altere a pasta NODE_FOLDER

    ssh -i $ssh_key $user@$server 'echo "Procurando a pasta"; find /opt/wwwroot/NODE_FOLDER -name "package.json" 2>/dev/null | while read pkg; do cd "$(dirname "$pkg")"; echo "executando npm  $pkg"; npm audit >> /tmp/resultados.txt; cat /tmp/resultados.txt; done; echo "apagando arquivo resultados"; cd /tmp/ && rm -f resultados.txt';
	
done
