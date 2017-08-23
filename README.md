
# SERVEUR COUNTER-STRIKE GLOBAL OFFENSIVE

--------------------------------------------------
## UTILISATION DE BASE

### Pour télécharger l'image :

>docker pull sirpixel/csgo

### pour exécuter l'image :

>docker run --restart always -p 27005:27005 -p 27015-27016:27015-27016 -p 27020:27020 -p 27005:27005/udp -p 27015-27016:27015-27016/udp -p 27020:27020/udp -v /home/docker/csgo:/home/csgoserver -itd --name csgo sirpixel/csgo

### Si vous souhaiter réaliser des modifications (ajouter metamod, etc...) ou vérifier la console vous pouvez exécuter la commande

>docker attach csgo
    
## INFORMATION IMPORTANTE

Pour pouvoir rendre votre serveur accessible en ligne vous devez obligatoirement renseigner une clef gslt fourni par steam a cette adresse

>https://steamcommunity.com/dev/managegameservers

Pour obtenir votre clef

 1. aller a la fin de la page
 2. Dans le champ App ID saisissez l'id du jeux qui est pour nous 730.
 3. Dans la case mémo vous pouvez saisir le nom que vous souhaité.
 4. Cliquez sur créer.
 5. Vous obtenez un jeton d'authentification que vous copier.
 6. Vous aller dans le fichier "/home/csgoserver/csgoserver"
 7. Trouvez la ligne gslt="" (environ 47) et ajoutez votre jeton entre les double quote exemple gslt="ABCDE125698"
 8. Redémarrez votre serveur "/home/csgoserver/csgoserver restart" ou "docker exec csgo /home/csgoserver/csgoserver restart" 

Vous devez créer un jeton par serveur si vous utilisez 2 fois le même jeton l'un des deux serveurs se stoppera.

## LISTE DES COMMANDES POSSIBLES

Une fois dans le conteneur vous pouvez utiliser les commandes

> /home/csserver/csgoserver start   //Pour démarrer le serveur
 /home/csgoserver/csgoserver stop    //Pour stoper le serveur
 /home/csgoserver/csgoserver restart //Pour redémarrer le server
 /home/csgoserver/csgoserver update //Pour mettre a jour le serveur
 /home/csgoserver/csgoserver install //Pour installer le serveur
/home/csgoserver/csgoserver console  //Pour afficher le serveur

Ou directement en dehors du conteneur

>docker exec csgo /home/csgoserver/csgoserver start   //Pour démarrer le serveur
docker exec csgo /home/csgoserver/csgoserver stop    //Pour stoper le serveur
docker exec csgo /home/csgoserver/csgoserver restart //Pour redémarrer le server
docker exec csgo /home/csgoserver/csgoserver update //Pour mettre a jour le serveur
docker exec csgo /home/csgoserver/csgoserver install //Pour installer le serveur
docker exec csgo /home/csgoserver/csgoserver console  //Pour afficher le serveur

Vous pouvez retrouver la liste complète des commandes et de leur utilité ici
[https://gameservermanagers.com/lgsm/csgoserver/](https://gameservermanagers.com/lgsm/csgoserver/)

## Configuration du serveur

Vous pouvez modifier les informations sur le "port, ip, map etc.." ici 

### csgoserver
>/home/csgoserver/csgoserver

### Exemple "csgo-server.cfg"
Le fichier csgo-server.cfg se trouve dans le dossier "/home/csgoserver/serverfiles/csgo/cfg"

> // Hostname for server.
> hostname "[FR] RAGECLIC - CSGO"
> 
> // RCON - remote console password. rcon_password "RageCsgo"
> 
> // Server Logging log on sv_logbans 1 sv_logecho 1 sv_logfile 1
> sv_log_onefile 0 sv_lan 0
> 
> // Server Hibernation sv_hibernate_when_empty 1 sv_hibernate_ms 5
> 
> // Server Query // More info at:
> https://www.gametracker.com/games/csgo/forum.php?thread=91691
> host_name_store 1 host_info_show 1 host_players_show 2
> 
> exec banned_user.cfg exec banned_ip.cfg writeid writeip

### Multiple config peuvent être modifié selon votre convenance ici
 
 >/home/csgoserver/serverfiles

### SOURCE

Cette image docker a été réalisé avec l'installateur automatique de [https://gameservermanagers.com/](https://gameservermanagers.com/)

### INFORMATION

Vous pouvez nous retrouver sur le forum de la communauté HappyGuard 

[https://www.happyguard.fr/](https://www.happyguard.fr/)

ou sur le teamspeak 

[ts.happyguard.fr](ts3server://ts.happyguard.fr)


### Attention !!!!
Les ip failover peuvent rendre difficile la visibilité de votre serveur sur les listes steams et les listes de serveurs dans le jeu ou tout autre listes.
