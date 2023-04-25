# apr/25/2023 09:58:23 by RouterOS 7.6
# software id = 
#
/interface ethernet
set [ find default-name=ether1 ] comment=PTP_2M/100G disable-running-check=no
set [ find default-name=ether2 ] comment=PTP_CCR disable-running-check=no
set [ find default-name=ether3 ] comment=PTP_PFSENSE disable-running-check=no
set [ find default-name=ether4 ] disable-running-check=no
/interface wireguard
add listen-port=13231 mtu=1420 name=wireguard1
add listen-port=13232 mtu=1420 name=wireguard2
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip hotspot
add addresses-per-mac=unlimited disabled=no interface=ether2 name=server1
/ip hotspot profile
set [ find default=yes ] dns-name=full.hnet.com hotspot-address=172.8.8.1 \
    html-directory=skins/hnetFull2 login-by=http-chap
/ip hotspot user profile
set [ find default=yes ] add-mac-cookie=no rate-limit=1M/1M
add add-mac-cookie=no !idle-timeout !keepalive-timeout !mac-cookie-timeout \
    name=escape rate-limit=3M/3M
add add-mac-cookie=no !idle-timeout !keepalive-timeout !mac-cookie-timeout \
    name="full premiun"
/ip pool
add name=dhcp_pool0 ranges=192.168.101.46
add name=LANsubnet ranges=192.168.150.2-192.168.150.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether3 name=dhcp1
/port
set 0 name=serial0
set 1 name=serial1
/queue simple
add max-limit=1M/1M name=BANLANCEO-10.81.214.107 target=10.81.214.107/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.104 target=10.81.214.104/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.105 target=10.81.214.105/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.106 target=10.81.214.106/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.110 target=10.81.214.110/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.112 target=10.81.214.112/32
add max-limit=1M/1M name=BANLANCEO-10.99.98.2 target=10.99.98.2/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.113 target=10.81.214.113/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.114 target=10.81.214.114/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.115 target=10.81.214.115/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.116 target=10.81.214.116/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.111 target=10.81.214.111/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.117 target=10.81.214.117/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.118 target=10.81.214.118/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.100 target=10.81.214.100/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.101 target=10.81.214.101/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.102 target=10.81.214.102/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.108 target=10.81.214.108/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.109 target=10.81.214.109/32
add max-limit=1M/1M name=BANLANCEO-10.81.214.103 target=10.81.214.103/32
add disabled=yes max-limit=1M/1M name=BANLANCEO-10.48.48.12 target=\
    10.48.48.12/32
add max-limit=3M/3M name=BANLANCEO-172.56.89.8 target=172.56.89.8/32
add max-limit=2M/2M name=Zolila target=192.168.80.0/24
add max-limit=1M/1M name=queue1 target=10.99.97.2/32
/routing table
add disabled=no fib name=vlan8
add disabled=no fib name=SERVICIO_2
add disabled=no fib name=SERVICIO_3
add disabled=no fib name=wireguard2
add disabled=no fib name=wireguard1
add disabled=no fib name=WG1
add disabled=no fib name=WG2
/interface wireguard peers
add allowed-address=0.0.0.0/0 endpoint-address=159.223.137.44 endpoint-port=\
    49200 interface=wireguard1 public-key=\
    "rxNaaI4jk3zFD7NSDhm+TmMwV2kynaHH7mGRy8NgjE8="
add allowed-address=0.0.0.0/0 endpoint-address=159.223.137.44 endpoint-port=\
    49200 interface=wireguard2 public-key=\
    "rxNaaI4jk3zFD7NSDhm+TmMwV2kynaHH7mGRy8NgjE8="
/ip address
add address=192.168.2.3/24 interface=ether3 network=192.168.2.0
add address=172.8.8.1/30 interface=ether2 network=172.8.8.0
add address=192.168.100.6/24 interface=wireguard1 network=192.168.100.0
add address=192.168.100.7/24 interface=wireguard2 network=192.168.100.0
/ip dhcp-client
add add-default-route=no interface=ether1 use-peer-dns=no use-peer-ntp=no
add add-default-route=no interface=ether4 use-peer-dns=no use-peer-ntp=no
/ip dhcp-server network
add address=192.168.101.44/30 gateway=192.168.101.45
add address=192.168.150.0/24 dns-server=192.168.150.1 gateway=192.168.150.1 \
    netmask=24
/ip dns
set allow-remote-requests=yes servers=1.1.1.1,181.225.231.120
/ip firewall address-list
add address=10.48.48.12 disabled=yes list=SERVICIO_2
add address=172.8.8.1 list=NO_ROUTING
add address=10.86.60.28 list=SERVICIO_2
add address=172.80.80.5 list=SERVICIO_2
add address=10.10.22.2 list=SERVICIO_2
add address=10.48.48.8 list=SERVICIO_2
add address=172.80.80.10 list=SERVICIO_2
add address=10.99.99.2 list=SERVICIO_2
add address=172.68.68.3 list=SERVICIO_2
add address=10.31.24.108 list=SERVICIO_2
add address=10.86.23.101 list=SERVICIO_2
add address=10.31.40.2 list=SERVICIO_2
add address=10.31.3.134 list=SERVICIO_2
add address=10.57.1.14 list=SERVICIO_2
add address=10.99.98.2 list=SERVICIO_2
add address=10.86.23.56 list=SERVICIO_2
/ip firewall filter
add action=accept chain=input disabled=yes dst-port=49200 in-interface=ether1 \
    protocol=udp
add action=accept chain=input disabled=yes in-interface=ether1 protocol=udp \
    src-port=49200
add action=accept chain=input disabled=yes dst-port=13232 in-interface=ether1 \
    protocol=udp
add action=accept chain=input disabled=yes in-interface=ether1 protocol=udp \
    src-port=13232
add action=accept chain=forward disabled=yes dst-port=49200 out-interface=\
    ether1 protocol=udp
add action=accept chain=forward disabled=yes out-interface=ether1 protocol=\
    udp src-port=49200
add action=accept chain=forward disabled=yes dst-port=13232 out-interface=\
    ether1 protocol=udp
add action=accept chain=forward disabled=yes out-interface=ether1 protocol=\
    udp src-port=13232
add action=drop chain=input disabled=yes dst-port=49200 protocol=udp
add action=drop chain=input disabled=yes protocol=udp src-port=49200
add action=drop chain=input disabled=yes protocol=udp src-port=13232
add action=drop chain=input disabled=yes dst-port=13232 protocol=udp
add action=drop chain=forward disabled=yes dst-port=49200 protocol=udp
add action=drop chain=forward disabled=yes protocol=udp src-port=49200
add action=drop chain=forward disabled=yes protocol=udp src-port=13232
add action=drop chain=forward disabled=yes dst-port=13232 protocol=udp
add action=drop chain=forward dst-address=10.180.0.30
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
/ip firewall mangle
add action=mark-routing chain=prerouting dst-address-list=!NO_ROUTING \
    new-routing-mark=SERVICIO_2 passthrough=no src-address-list=SERVICIO_2
add action=mark-routing chain=prerouting dst-address-list=!NO_ROUTING \
    new-routing-mark=SERVICIO_3 passthrough=no src-address-list=SERVICIO_3
add action=mark-routing chain=prerouting dst-address-list=!NO_ROUTING \
    new-routing-mark=WG2 passthrough=no src-address-list=wireguard2
/ip firewall nat
add action=passthrough chain=unused-hs-chain comment=\
    "place hotspot rules here" disabled=yes
add action=masquerade chain=srcnat disabled=yes out-interface=ether3
add action=masquerade chain=srcnat dst-address=1.1.1.1 out-interface=ether1
add action=masquerade chain=srcnat out-interface=ether1 routing-mark=\
    SERVICIO_3 src-address-list=SERVICIO_3
add action=masquerade chain=srcnat out-interface=ether4
add action=masquerade chain=srcnat disabled=yes dst-address=1.1.1.1 \
    out-interface=ether1
add action=masquerade chain=srcnat out-interface=wireguard2 routing-mark=WG2 \
    src-address-list=wireguard2
/ip hotspot ip-binding
add address=10.48.48.0/24 type=bypassed
add address=10.48.48.13 type=bypassed
add address=172.32.32.5 type=bypassed
add address=10.81.214.0/24 type=bypassed
add address=10.86.33.21 type=bypassed
add address=172.32.32.1 type=bypassed
add address=172.56.89.8 type=bypassed
add address=192.168.80.0/24 type=bypassed
add address=172.36.36.0/24 type=bypassed
add address=10.99.97.2 type=bypassed
add address=10.99.98.2 type=bypassed
add address=192.168.37.0/30 type=bypassed
add address=10.48.48.8 type=bypassed
add address=10.48.48.12 type=bypassed
add address=172.8.8.2 type=bypassed
add address=172.80.80.5 type=bypassed
add address=10.10.22.2 type=bypassed
add address=10.86.60.28 comment=chino type=bypassed
add address=172.80.80.10 type=bypassed
add address=10.99.99.2 type=bypassed
add address=10.48.48.18 type=bypassed
add address=172.68.68.3 type=bypassed
add address=10.48.48.249 type=bypassed
add address=172.57.57.2 comment=vlan33_dns_internet type=bypassed
add address=10.86.23.101 type=bypassed
add address=10.31.40.2 type=bypassed
/ip hotspot user
add comment=Movil limit-bytes-out=45000000000 name=Leoh
add comment="De Horacio" limit-bytes-out=60000000000 name=Metanol
add comment="De Horacio" limit-bytes-out=120000000000 name=Horacio profile=\
    "full premiun"
add comment="De Horacio" limit-bytes-out=45000000000 name=FamiliaHR
add comment="De Horacio" limit-bytes-out=45000000000 name=Juanito
add comment="De Horacio" limit-bytes-out=45000000000 name=Yoansy
add comment="De Horacio" limit-bytes-out=45000000000 name=Cristian
add comment="De Horacio" limit-bytes-out=60000000000 name=Rosa
add comment="De Horacio" limit-bytes-out=45000000000 name=Bianconero
add comment="de Boyka" limit-bytes-out=45000000000 name=Boyka
add comment="de Boyka" limit-bytes-out=45000000000 name=Boyka2
add comment="de Boyka" limit-bytes-out=45000000000 name=Yani
add comment="de Boyka" limit-bytes-out=45000000000 name=Fernando
add comment="de Boyka" limit-bytes-out=60000000000 name=Alejandro
add comment="de Boyka" limit-bytes-out=45000000000 name=Roxana
add comment="de Boyka" limit-bytes-out=60000000000 name=Michel
add comment="de Hermano Vicente" limit-bytes-out=45000000000 name=Daniel
add comment="de Hermano Vicente" limit-bytes-out=45000000000 name=Only
add comment="de Hermano Vicente" limit-bytes-out=45000000000 name=Yunior
add comment="de Hermano Vicente" limit-bytes-out=45000000000 name=Roberto
add comment="de Hermano Vicente" limit-bytes-out=45000000000 name=Leo
add comment="Medico AA" limit-bytes-out=60000000000 name=JM
add comment=Jorge_J limit-bytes-out=60000000000 name=Jorge_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Casa_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Yamira_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Dani_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Lissy_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Marco_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Livan_J
add comment=Jorge_J limit-bytes-out=60000000000 name=Ernesto_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Pedri_J
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-2
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-5
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-6
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-7
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-10
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-21
add comment=BarBsa limit-bytes-out=45000000000 name=Charlt-2
add comment=BarBsa limit-bytes-out=45000000000 name=Charlt-4
add comment=BarBsa limit-bytes-out=45000000000 name=Charlt-8
add comment=Novia_250 limit-bytes-out=45000000000 name=Nv-2
add comment=Novia_250 limit-bytes-out=45000000000 name=Nv-3
add comment=PntBrb_Cano limit-bytes-out=60000000000 name=PtBr-57.2
add comment=PntBrb_Cano limit-bytes-out=45000000000 name=PtBr-57.3
add comment=PntBrb_Cano limit-bytes-out=45000000000 name=PtBr-57.5
add comment=Jorge_J limit-bytes-out=45000000000 name=Router_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Wilfredo_J
add comment=Osbel limit-bytes-out=45000000000 name=A-escape profile=escape
add comment=Osbel limit-bytes-out=45000000000 name=A-cake
add comment=Osbel limit-bytes-out=45000000000 name=A-osbel
add comment="Pedri Reparto" limit-bytes-out=45000000000 name=Pedri
add comment=Osbel limit-bytes-out=45000000000 name=A-alexei
add comment=Osbel limit-bytes-out=45000000000 name=A-asnay
add comment=Osbel limit-bytes-out=45000000000 name=A-pito
add comment=Osbel limit-bytes-out=45000000000 name=A-toni
add comment=Maikel limit-bytes-out=60000000000 name=20-2
add comment=OSbel limit-bytes-out=45000000000 name=A-alain
add comment=OSbel limit-bytes-out=45000000000 name=A-osmany
add comment=Reparto limit-bytes-out=100000000000 name=BN profile=escape
add comment=osbel limit-bytes-out=60000000000 name=A-deni
add comment=osbel limit-bytes-out=45000000000 name=A-ivan
add comment=osbel limit-bytes-out=45000000000 name=A-papito
add comment=osbel limit-bytes-out=45000000000 name=A-felipe
add comment=osbel limit-bytes-out=45000000000 name=A-pedro
add comment=osbel limit-bytes-out=45000000000 name=A-jose
add comment=osbel limit-bytes-out=45000000000 name=A-yanisleydi
add comment=osbel limit-bytes-out=45000000000 name=A-ariadna
add comment=osbel limit-bytes-out=45000000000 name=A-sikario
add comment=osbel limit-bytes-out=45000000000 name=A-yohandra
add comment=osbel limit-bytes-out=45000000000 name=A-irene
add comment=osbel limit-bytes-out=45000000000 name=A-damari
add comment=osbel limit-bytes-out=45000000000 name=A-yadira
add comment=osbel limit-bytes-out=45000000000 name=A-yaneisy
add comment=osbel limit-bytes-out=45000000000 name=A-damian
add comment=osbel limit-bytes-out=45000000000 name=A-misley
add comment=AA limit-bytes-out=45000000000 name=faraon
add comment=Redc limit-bytes-out=45000000000 name=Redc-4
add comment=Redc limit-bytes-out=45000000000 name=Redc-8
add comment=Redc limit-bytes-out=60000000000 name=Redc-9
add comment=Redc limit-bytes-out=45000000000 name=Redc-10
add comment=Redc limit-bytes-out=45000000000 name=Redc-14
add comment=Redc limit-bytes-out=45000000000 name=Redc-17
add comment=Redc limit-bytes-out=100000000000 name=Redc-20
add comment=Redc limit-bytes-out=45000000000 name=Redc-21
add comment=Redc limit-bytes-out=60000000000 name=Redc-22
add comment=Redc limit-bytes-out=45000000000 name=Redc-24
add comment=Redc limit-bytes-out=45000000000 name=Redc-34
add comment=Redc limit-bytes-out=45000000000 name=Redc-36
add comment=Redc limit-bytes-out=60000000000 name=Redc-41
add comment=Redc limit-bytes-out=45000000000 name=Redc-50
add comment=Redc limit-bytes-out=60000000000 name=Redc-51
add comment=Redc limit-bytes-out=60000000000 name=Redc-53
add comment=Redc limit-bytes-out=45000000000 name=Redc-55
add comment=Redc limit-bytes-out=120000000000 name=Redc-56 profile=\
    "full premiun"
add comment=Redc limit-bytes-out=45000000000 name=Redc-58
add comment=Redc limit-bytes-out=45000000000 name=Redc-66
add comment=maikel limit-bytes-out=60000000000 name=20-5
add comment=Redc limit-bytes-out=45000000000 name=Redc-68
add comment=Redc limit-bytes-out=60000000000 name=Redc-71
add comment=maikel limit-bytes-out=60000000000 name=20-7
add comment=maikel limit-bytes-out=45000000000 name=20-229
add comment=maikel limit-bytes-out=60000000000 name=20-78
add comment=Redc limit-bytes-out=45000000000 name=Redc-72
add comment=maikel limit-bytes-out=45000000000 name=20-225
add comment=Redc limit-bytes-out=45000000000 name=Redc-75
add comment=maikel limit-bytes-out=45000000000 name=20-226
add comment=maikel limit-bytes-out=60000000000 name=20-32
add comment=Redc limit-bytes-out=45000000000 name=Redc-83
add comment=maikel limit-bytes-out=60000000000 name=20-34
add comment=Redc limit-bytes-out=45000000000 name=Redc-85
add comment=maikel limit-bytes-out=60000000000 name=20-35
add comment=maikel limit-bytes-out=60000000000 name=20-41
add comment=Redc limit-bytes-out=45000000000 name=Redc-86
add comment=maikel limit-bytes-out=60000000000 name=20-43
add comment=maikel limit-bytes-out=60000000000 name=20-44
add comment=Redc limit-bytes-out=45000000000 name=Redc-90
add comment=maikel limit-bytes-out=60000000000 name=20-47
add comment=maikel limit-bytes-out=45000000000 name=20-230
add comment=Redc limit-bytes-out=45000000000 name=Redc-93
add comment=maikel limit-bytes-out=45000000000 name=20-231
add comment=Redc limit-bytes-out=45000000000 name=Redc-94
add comment=maikel limit-bytes-out=60000000000 name=20-54
add comment=maikel limit-bytes-out=60000000000 name=20-56
add comment=maikel limit-bytes-out=60000000000 name=20-61
add comment=maikel limit-bytes-out=60000000000 name=20-75
add comment=maikel limit-bytes-out=60000000000 name=20-76
add comment=maikel limit-bytes-out=60000000000 name=20-80
add comment=maikel limit-bytes-out=60000000000 name=20-120
add comment=maikel limit-bytes-out=60000000000 name=20-123
add comment=maikel limit-bytes-out=60000000000 name=20-124
add comment=maikel limit-bytes-out=60000000000 name=20-125
add comment=maikel limit-bytes-out=45000000000 name=20-127
add comment=20 limit-bytes-out=45000000000 name=Isla
add comment=Vicente limit-bytes-out=60000000000 name=v-vicente
add comment=Leandro limit-bytes-out=45000000000 name=Leandro
add comment=vicente limit-bytes-out=45000000000 name=v-7
add comment=Nova limit-bytes-out=60000000000 name=n-11
add comment=Nova limit-bytes-out=45000000000 name=n-155
add comment=Nova limit-bytes-out=45000000000 name=n-160
add comment=Nova limit-bytes-out=45000000000 name=n-188
add comment=Nova limit-bytes-out=45000000000 name=n-203
add comment=Nova limit-bytes-out=45000000000 name=n-231
add comment=Nova limit-bytes-out=60000000000 name=n-39
add comment=Nova limit-bytes-out=45000000000 name=n-7
add comment=Sandra name=Ale
add comment=Coronela limit-bytes-out=45000000000 name=Chino
add comment=AA limit-bytes-out=45000000000 name=Pedro
add comment=Movil limit-bytes-out=45000000000 name=Anaiza
add comment=Reparto limit-bytes-out=45000000000 name=Redder
add comment=Kiki limit-bytes-out=45000000000 name=K-15
add comment=Kiki limit-bytes-out=60000000000 name=K-3
add comment=Reparto limit-bytes-out=45000000000 name=Yusimi
add comment=Reparto limit-bytes-out=45000000000 name=Miguel
add comment=Fantasma limit-bytes-out=45000000000 name=F-10.86.27.71
add comment=Fantasma limit-bytes-out=45000000000 name=F-10.86.27.72
add comment=Osbel limit-bytes-out=45000000000 name=A-lazaro
add comment=Reparto limit-bytes-out=60000000000 name=Kendry
add comment=Reparto limit-bytes-out=45000000000 name=Pepe
add comment=Reparto,Tornero limit-bytes-out=45000000000 name=Beatriz
add comment=Sotolongo limit-bytes-out=45000000000 name=Lazaro
add comment=Horacio limit-bytes-out=45000000000 name=Vitico
add comment=Reparto limit-bytes-out=45000000000 name=Carla
add comment=AA limit-bytes-out=45000000000 name=PedroTv
add comment="Red arroyo arenas" limit-bytes-out=45000000000 name=Darwin
add comment="red arroyo arenas" limit-bytes-out=45000000000 name=Dairon
add comment=Osbel limit-bytes-out=45000000000 name=A-tonito
add comment=Reparto limit-bytes-out=45000000000 name=Didiel
add comment=Reparto limit-bytes-out=45000000000 name=Meco
add comment=Reparto limit-bytes-out=45000000000 name=Lissy
add comment=Osbel limit-bytes-out=45000000000 name=A-niurka
add comment=Reparto limit-bytes-out=45000000000 name=David
add comment=UfX limit-bytes-out=45000000000 name=U-22
add comment=Abuela limit-bytes-out=45000000000 name=abuela
add comment=Jorge_J limit-bytes-out=45000000000 name=Manolin_J
add comment=Ufx limit-bytes-out=45000000000 name=Sambito
add comment=Nova limit-bytes-out=45000000000 name=n-168
add comment=Nova limit-bytes-out=45000000000 name=n-206
add comment=Nova limit-bytes-out=45000000000 name=n-238
add comment=Alain limit-bytes-out=45000000000 name=A-Carlos
add comment=PntBrb_Cano limit-bytes-out=60000000000 name=PtBr-57.7
add comment=Jorge_J limit-bytes-out=45000000000 name=Tako_J
add comment=Jorge_J limit-bytes-out=45000000000 name=Lester_J
add comment=Novia_250 limit-bytes-out=45000000000 name=Nv-18
add comment=Reparto limit-bytes-out=60000000000 name=Gabriel
add comment=Nova limit-bytes-out=45000000000 name=n-250
add comment=PntBrb_Cano limit-bytes-out=45000000000 name=PtBr-57.13
add comment=PntBrb_Cano limit-bytes-out=45000000000 name=PtBr-57.9
add comment="Osbel mujer de ernesto tv" limit-bytes-out=60000000000 name=14
add comment=PntBrb limit-bytes-out=45000000000 name=PtBr-3
add comment=Redc limit-bytes-out=45000000000 name=Redc75
add comment=Novia_250 limit-bytes-out=45000000000 name=Nv-20
add comment=Jorge_J disabled=yes limit-bytes-out=45000000000 name=Charly_J
add comment=maikel limit-bytes-out=60000000000 name=20-9
add comment="20 aniversario" limit-bytes-out=45000000000 name=cano-1
add comment=Jorge_J disabled=yes limit-bytes-out=45000000000 name=Kikito_J
add comment=Nova limit-bytes-out=120000000000 name=n-108 profile=\
    "full premiun"
add comment=Jorge_J limit-bytes-out=45000000000 name=Yaile_J
add comment=PntBrb_Cano limit-bytes-out=120000000000 name=PtBr-57.14 profile=\
    "full premiun"
add comment=Redc limit-bytes-out=120000000000 name=Redc-40.2 profile=\
    "full premiun"
add comment=Sotolongo name=Allan
add comment=Osbel limit-bytes-out=60000000000 name=A-94
add comment="osbel red sikario" limit-bytes-out=45000000000 name=yuma
/ip route
add disabled=no distance=1 dst-address=10.48.48.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=172.32.88.1%ether4 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10
add disabled=no distance=1 dst-address=10.0.0.0/9 gateway=172.8.8.2 pref-src=\
    "" routing-table=main scope=30 suppress-hw-offload=no target-scope=10 \
    vrf-interface=ether2
add disabled=no distance=1 dst-address=10.128.0.0/9 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.4.5.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.7.7.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.21.21.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.44.44.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.48.48.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.50.0.3/32 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.51.1.2/32 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.56.89.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.60.0.3/32 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.68.68.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.80.80.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.81.83.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.87.87.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.89.1.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.89.80.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.168.18.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.172.1.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.172.2.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.23.10.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.11.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.18.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.19.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.36.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.55.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.80.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add dst-address=10.48.48.12 gateway=172.8.8.2
add disabled=no distance=1 dst-address=172.32.32.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=11.11.11.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.56.89.8/32 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=172.36.36.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no dst-address=0.0.0.0/0 gateway=192.168.37.1%ether1 \
    routing-table=SERVICIO_2 suppress-hw-offload=no
add disabled=no distance=1 dst-address=181.225.231.120/32 gateway=\
    192.168.37.1%ether1 pref-src="" routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no distance=1 dst-address=181.225.231.110/32 gateway=\
    192.168.37.1%ether1 pref-src="" routing-table=main scope=30 \
    suppress-hw-offload=no target-scope=10
add disabled=no distance=1 dst-address=1.1.1.1/32 gateway=192.168.37.1%ether1 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10
add disabled=no distance=1 dst-address=172.57.57.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=192.168.15.0/24 gateway=172.8.8.2 \
    pref-src="" routing-table=main scope=30 suppress-hw-offload=no \
    target-scope=10 vrf-interface=ether2
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=192.168.37.1%ether1 \
    pref-src="" routing-table=SERVICIO_3 scope=30 suppress-hw-offload=no \
    target-scope=10
add disabled=no distance=1 dst-address=0.0.0.0/0 gateway=wireguard2 pref-src=\
    "" routing-table=WG2 scope=30 suppress-hw-offload=no target-scope=10
/ip service
set telnet disabled=yes
set www disabled=yes
set ssh disabled=yes
/system scheduler
add disabled=yes name=init on-event=":global before { vlan101=0;vlan102=0;vlan\
    103=0;vlan104=0 };\r\
    \nip firewall mangle disable [find action=mark-connection && src-address-l\
    ist=\"full\" && new-connection-mark~\"_conNTH\" && disabled=no];\r\
    \ndelay 5;\r\
    \nsystem script run Failover;" policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=5s name=vlan101Internet on-event=vlan101Internet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=5s name=vlan102Internet on-event=vlan102Internet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=5s name=vlan103Internet on-event=vlan103Internet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
add disabled=yes interval=5s name=vlan104Internet on-event=vlan104Internet \
    policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
/system script
add dont-require-permissions=yes name=vlan101Internet owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    global before;\r\
    \n:local iface \"vlan101\";\r\
    \n:local ipToPing 10.219.17.85;\r\
    \nif ([ping \$ipToPing count=2 interface=\$iface]>0) do {\r\
    \n    if ([(\$before->\$iface)]=0) do {\r\
    \n        :set (\$before->\$iface) 1;\r\
    \n        ip firewall mangle enable [find new-connection-mark=\"\$iface_co\
    nNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n} else {\r\
    \n    if ([(\$before->\$iface)]=1) do {\r\
    \n        :set (\$before->\$iface) 0;\r\
    \n        ip firewall mangle disable [find new-connection-mark=\"\$iface_c\
    onNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n}"
add dont-require-permissions=yes name=vlan102Internet owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    global before;\r\
    \n:local iface \"vlan102\";\r\
    \n:local ipToPing 10.219.17.85;\r\
    \nif ([ping \$ipToPing count=2 interface=\$iface]>0) do {\r\
    \n    if ([(\$before->\$iface)]=0) do {\r\
    \n        :set (\$before->\$iface) 1;\r\
    \n        ip firewall mangle enable [find new-connection-mark=\"\$iface_co\
    nNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n} else {\r\
    \n    if ([(\$before->\$iface)]=1) do {\r\
    \n        :set (\$before->\$iface) 0;\r\
    \n        ip firewall mangle disable [find new-connection-mark=\"\$iface_c\
    onNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n}"
add dont-require-permissions=yes name=vlan103Internet owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    global before;\r\
    \n:local iface \"vlan103\";\r\
    \n:local ipToPing 10.219.17.85;\r\
    \nif ([ping \$ipToPing count=2 interface=\$iface]>0) do {\r\
    \n    if ([(\$before->\$iface)]=0) do {\r\
    \n        :set (\$before->\$iface) 1;\r\
    \n        ip firewall mangle enable [find new-connection-mark=\"\$iface_co\
    nNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n} else {\r\
    \n    if ([(\$before->\$iface)]=1) do {\r\
    \n        :set (\$before->\$iface) 0;\r\
    \n        ip firewall mangle disable [find new-connection-mark=\"\$iface_c\
    onNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n}"
add dont-require-permissions=yes name=vlan104Internet owner=admin policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon source=":\
    global before;\r\
    \n:local iface \"vlan104\";\r\
    \n:local ipToPing 10.219.17.85;\r\
    \nif ([ping \$ipToPing count=2 interface=\$iface]>0) do {\r\
    \n    if ([(\$before->\$iface)]=0) do {\r\
    \n        :set (\$before->\$iface) 1;\r\
    \n        ip firewall mangle enable [find new-connection-mark=\"\$iface_co\
    nNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n} else {\r\
    \n    if ([(\$before->\$iface)]=1) do {\r\
    \n        :set (\$before->\$iface) 0;\r\
    \n        ip firewall mangle disable [find new-connection-mark=\"\$iface_c\
    onNTH\" and src-address-list=\"full\"];\r\
    \n        system script run Failover;\r\
    \n    }\r\
    \n}"
/system watchdog
set ping-start-after-boot=1m watchdog-timer=no
