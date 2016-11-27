# Replacer la Livebox par un Turris Omnia

Ce dépôt contient un exemple de configuration pour connecter un [Turris Omnia](https://omnia.turris.cz/) à la fibre Orange.

Le décodeur TV doit être branché sur le port LAN 4.

N'oubliez pas de renseigner votre nom d'utilisateur (fti/*******) et l'adresse MAC de votre Livebox dans le fichier /etc/config/network.

## Paquets à installer
*  luci-app-upnp
*  igmpproxy

## TODO
*  Configuration IPv6
*  Replay
*  Changer la priorité des requêtes DHCP (nécessaire pour établir la connexion sur certaines lignes)
