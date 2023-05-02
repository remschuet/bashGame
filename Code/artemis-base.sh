#!/bin/bash

# Cette fonction prend 1 paramètre (etat de la dernière partie - victoire ou défaite)
# Elle permet de sauvegarder la partie dans un fichier texte (ex: score.txt)
# Exemple de fichier score.txt: 
# [2023-05-01 15:26:21] - Défaite
# [2023-05-02 16:16:33] - Victoire
sauvegarderPartie () {
	echo -e "\033[32m" # Mettre la couleur du texte en vert
    echo "Sauvegarde de la partie à venir"
    echo -e "\033[0m" # Remettre blanc ALLO
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
    echo "Affichage de la fin de partie à venir"
}

# Cette fonction permet d'afficher l'état du jeu (l'arc, la flèche et le monstre)
# Elle prend 2 paramètres (la position de la flèche et celle du monstre)
afficherEtatJeu() {
    for (( i=0;i-le20;i++ ))
    do
        if [[ i==$2 ]]
        then
            echo -n "->"
        elif [[ i==$1 ]]
        then
            echo -n "M"
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
    afficherEtatJeu
    # 3- Elle doit demander à l'usager la force à appliquer (entre 15 et 18)
    read -p "Quel force souhaitez-vous appliquer ?" force
    # 4- Elle doit avoir une boucle allant de 0 à la force à appliquer.
    afficherEtatJeu $force
    #    Celle-ci doit afficher l'état du jeu, incrémenter la position de la flèche et
    #    faire une petite attente de 100msec
    # 5- Elle doit appeler la fonction de sauvegarde de la partie
    # 6- Elle doit appeler la fonction d'affichage du menu de fin

    echo "Logique du jeu à venir"
}

# Tant que l'utilisateur ne veut pas quitter, afficher le menu principal et
choix=
until [[ $choix = q ]]      # Quitter
 do
    menuPrincipal
    read -p "Choix : " choix

    if [[ $choix = a ]]     # Jouer
    then
       jouer 
    elif [[ $choix = s ]]   # Score
    then
        afficherScore
        #ajout commentaire
    fi
done

