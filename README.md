# Replacer la Livebox par un Turris Omnia

Ce dépôt contient un exemple de configuration pour connecter un [Turris Omnia](https://omnia.turris.cz/) à la fibre Orange.

Le décodeur TV doit être branché sur le port LAN 4.

N'oubliez pas de renseigner votre nom d'utilisateur (fti/*******) et l'adresse MAC de votre Livebox dans le fichier /etc/config/network.

## Générer le nom d'utilisateur 
* executez le script ./genFibreID.sh ******* (sans le fti/ devant)
* placez le dans la rubrique wan de etc/config/network aprés la valeur 0x5a: et à la place de 00000000000000000000006674692fxxxxxxxxxxxx

## Ajouter la mac adresse de la Livebox
* Retournez la livebox connecté au boitié fibre
* dessous vous trouverez l'adresse dans le champ @mac:
* ajoutez 4 en hexadecimal aux deux dernieres charactére de l'adresse et vous obtiendrez l'adresse mac vue côté fibre
* enlevez les : et remplacer les deux derniers charactére par la valeur hexadecimal calculé 
* remplacez dans la rubrique wantv de etc/config/network les xxxxxxxxxxxx aprés 0x3D:01

## Problémes connus
* Le routeur est devenu innacessible: Si vous copiez-collé la configuration compléte votre réseau LAN passera en 192.168.0.0/24, le routeur sera en 192.168.0.1
* Le Replay marche mais pas la TV: Verifiez que dans System/Startup igmpproxy est enabled (donc le bouton disabled apparait et que vous avez appuyez sur le bouton start

## Exemple de résultat
* attention dans l'exemple ci-dessous j'ai conservé l'adressage d'origine du routeur en 192.168.1.1 (mais cela fonctionne quand même)

![Image etat des interfaces](https://github.com/acabrol/omnia_orange/blob/master/config_interfaces_omnia_orange.jpg)

## Paquets à installer
*  luci-app-upnp
*  igmpproxy

## TODO
*  Configuration IPv6
*  Replay
*  Changer la priorité des requêtes DHCP (nécessaire pour établir la connexion sur certaines lignes)

