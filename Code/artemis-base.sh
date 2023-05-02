#!/bin/bash

# Cette fonction prend 1 paramètre (etat de la dernière partie - victoire ou défaite)
# Elle permet de sauvegarder la partie dans un fichier texte (ex: score.txt)
# Exemple de fichier score.txt: 
# [2023-05-01 15:26:21] - Défaite
# [2023-05-02 16:16:33] - Victoire
sauvegarderPartie () {
	echo -e "\033[32m" # Mettre la couleur du texte en vert
    echo -e "Sauvegarde de la partie en cours"
    for (( i=0;i<10;i++ ))
    do
        echo -n "#"
        sleep 0.2
    done
    echo -e "\033[0m" # Remettre blanc
}

# Cette fonction permet d'afficher l'état des dernières parties jouées (ex: score.txt)
afficherScore () {
	echo -e "\033[34m" # Mettre la couleur du texte en blue
    echo "Afficher des dernières parties à venir"
    echo -e "\033[0m" # Remettre blanc
}

# Cette fonction affiche le menu principal ayant les options pour jouer, afficher les scores et pour quitter
menuPrincipal () {
    echo -e "\033[33m" # Mettre la couleur du texte en jaune
    echo ">>> ------- Artemis ---------->"
    echo -e "\033[0m" # Remettre blanc
    echo -e "\t [a] Jouer"
    echo -e "\t [s] Score"
    echo -e "\t [q] Quitter"
}

# Cette fonction prend 1 paramètre (etat de la dernière partie - victoire ou défaite)
# Faire afficher un message/ASCII art en fonction de l'état de la partie
# Exemple : Vous avez perdu! ou Bravo, vous avez gagné!
menuFinPartie () {
    if [[ $1 -eq 0 ]]
    then
        echo -n -e ">>>>>>>                       |-._\n";
        echo -n -e "       -----------------------    --\n";
        echo -n -e ">>>>>>>                       |_-' \n";
    else
        echo -n " "
    fi
    sleep 5
}

# Cette fonction permet d'afficher l'état du jeu (l'arc, la flèche et le monstre)
# Elle prend 2 paramètres (la position de la flèche et celle du monstre)
afficherEtatJeu() {
    for i in {0..20}
    do
        if [[ $i -eq 0 ]]
        then
            echo -n "D"
        elif [[ $i -eq $2 ]]
        then
            echo -n ">"
        elif [[ $i -eq $1 ]]
        then
            echo -n  "M"
        else
        echo -n " "
        fi
    done
}

# Cette fonction permet de jouer une partie
jouer () {
    # 1- Elle doit calculer la position du monstre, entre 15 et 18 : rnd=$(( $RANDOM % 3 + 15 ))
    rnd=$(( $RANDOM % 3 +15))
    # 2- Elle doit afficher l'état initial du jeu (avec la fonction afficherEtatJeu)
    afficherEtatJeu $rnd 0
    # 3- Elle doit demander à l'usager la force à appliquer (entre 15 et 18)
    echo
    echo -e "\nLe monstre est en vue!"
    read -p "Quel force souhaitez-vous appliquer ? " force
    # 4- Elle doit avoir une boucle allant de 0 à la force à appliquer.
    for (( j=0;j<=$force;j++ ))
    do
        clear
        afficherEtatJeu $rnd $j
        sleep 0.1
    done
    #    Celle-ci doit afficher l'état du jeu, incrémenter la position de la flèche et
    #    faire une petite attente de 100msec
    # 5- Elle doit appeler la fonction de sauvegarde de la partie
    sauvegarderPartie
    # 6- Elle doit appeler la fonction d'affichage du menu de fin
    if [[ $rnd -eq $force ]]
    then
        menuFinPartie 0
    elif [[ $rnd != $force ]]
    then
        menuFinPartie 1
    fi
}

# Tant que l'utilisateur ne veut pas quitter, afficher le menu principal et
choix=
until [[ $choix = q ]]      # Quitter
 do
    clear
    menuPrincipal
    read -p "Choix : " choix
    echo

    if [[ $choix = a ]]     # Jouer
    then
       jouer 
    elif [[ $choix = s ]]   # Score
    then
        afficherScore
        #ajout commentaire
    fi
done

