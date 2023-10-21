# Adicionar o repositório do Zabbix e atualizar o sistema no Debian 12
echo "Adicionando o repositório do Zabbix e atualizando o sistema no Debian 12 (Bookworm)..."
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-5+debian12_all.deb
dpkg -i zabbix-release_6.0-5+debian12_all.deb
#Atualiza e Verifica
#apt update || verificar_erro "apt update"
#Atualiza e Verifica
echo "Instalando o Agente Zabbix 2 e seus plugins no Debian 12..."
apt install zabbix-agent2 zabbix-agent2-plugin-* || verificar_erro "apt install"
#Atualiza e Verifica
echo "Iniciando o serviço do Agente Zabbix 2..."
systemctl start zabbix-agent2 || verificar_erro "systemctl start"
#Atualiza e Verifica
echo "Habilitando o serviço para iniciar automaticamente na inicialização do sistema..."
systemctl enable zabbix-agent2 || verificar_erro "systemctl enable"
       