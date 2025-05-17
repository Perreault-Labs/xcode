//
//  Constants.swift
//  challenge v1
//
//  Created by Elliot Perreault on 2025-05-16.
//


import Foundation

// The constant variable for challenges
let PREDEFINED_CHALLENGES: [Challenge] = [
    Challenge(title: "Faire un compliment à un(e) inconnu(e)", description: "Offrez un compliment sincère à une personne que vous ne connaissez pas."),
    Challenge(title: "Dire 'Bonjour' avec enthousiasme", description: "Saluez votre chauffeur de bus, barista, ou un(e) collègue avec un 'Bonjour !' joyeux."),
    Challenge(title: "Tenir la porte", description: "Tenez la porte ouverte pour la personne derrière vous."),
    Challenge(title: "Demander à quelqu'un comment s'est passée sa journée", description: "Et écoutez vraiment sa réponse."),
    Challenge(title: "Partager une histoire positive", description: "Racontez à un(e) ami(e) ou un membre de votre famille quelque chose de bien qui s'est passé récemment."),
    Challenge(title: "Remercier quelqu'un pour quelque chose de spécifique", description: "Remerciez quelqu'un pour une action précise qu'il/elle a faite et que vous avez appréciée."),
    Challenge(title: "Laisser un commentaire positif en ligne", description: "Trouvez un créateur ou une publication que vous aimez et laissez un commentaire encourageant."),
    Challenge(title: "Ramasser un déchet par terre", description: "Trouvez un déchet et jetez-le correctement."),
    Challenge(title: "Proposer son aide", description: "Demandez à quelqu'un s'il/elle a besoin d'aide pour quelque chose, même si c'est minime."),
    Challenge(title: "Sourire à 5 personnes", description: "Établissez un contact visuel et offrez un sourire sincère à cinq personnes différentes."),
    Challenge(title: "Laisser passer quelqu'un devant soi", description: "Dans une file d'attente, à un passage piéton, ou en voiture si la situation le permet."),
    Challenge(title: "Écrire un mot de remerciement", description: "Un petit mot manuscrit ou un email pour exprimer votre gratitude."),
    Challenge(title: "Offrir un café/thé à un(e) collègue", description: "Proposez de préparer ou d'aller chercher une boisson chaude pour un(e) collègue."),
    Challenge(title: "Partager un en-cas", description: "Proposez un biscuit, un fruit ou une part de gâteau à quelqu'un autour de vous."),
    Challenge(title: "Féliciter quelqu'un pour son travail", description: "Soulignez la qualité du travail ou l'effort d'un(e) collègue ou d'un(e) camarade."),
    Challenge(title: "Envoyer un message encourageant", description: "Un SMS ou un message en ligne à quelqu'un qui pourrait avoir besoin d'un petit coup de pouce."),
    Challenge(title: "Mettre son téléphone de côté pendant une conversation", description: "Accordez toute votre attention à la personne avec qui vous parlez."),
    Challenge(title: "Laisser un avis positif pour un commerce local", description: "Prenez quelques minutes pour évaluer positivement un restaurant, une boutique ou un service que vous appréciez."),
    Challenge(title: "Appeler un(e) ami(e) ou un parent éloigné", description: "Prenez des nouvelles de quelqu'un à qui vous n'avez pas parlé depuis longtemps."),
    Challenge(title: "Faire un petit don à une association", description: "Même une petite somme peut faire une différence pour une cause qui vous tient à cœur."),
    Challenge(title: "Céder sa place dans les transports", description: "Proposez votre siège à une personne âgée, une femme enceinte ou quelqu'un qui semble en avoir besoin."),
    Challenge(title: "Apprendre le nom d'une personne que vous croisez régulièrement", description: "Le/la caissier(ère) de votre supermarché, le/la gardien(ne) de votre immeuble..."),
    Challenge(title: "Partager une compétence", description: "Montrez à quelqu'un comment faire quelque chose que vous savez bien faire."),
    Challenge(title: "Laisser un livre dans une boîte à livres", description: "Partagez un livre que vous avez aimé pour que d'autres puissent le découvrir."),
    Challenge(title: "Être patient(e) dans une situation frustrante", description: "Prenez une profonde inspiration et essayez de rester calme et compréhensif(ve)."),
    Challenge(title: "Demander au personnel de service comment se passe leur journée", description: "Au lieu de juste commander, demandez sincèrement au serveur/caissier comment il/elle va."),
    Challenge(title: "Rapporter un caddie égaré", description: "Sur un parking de supermarché, ramenez un caddie à son emplacement."),
    Challenge(title: "Faire un compliment sur une idée", description: "Lors d'une réunion ou d'une discussion, valorisez une bonne idée émise par quelqu'un d'autre."),
    Challenge(title: "Envoyer une photo amusante/mignonne à un(e) ami(e)", description: "Pour lui/elle redonner le sourire."),
    Challenge(title: "Laisser un pourboire un peu plus généreux que d'habitude", description: "Si le service était bon et que vous le pouvez, montrez votre appréciation.")
    // Ajoutez encore plus de défis selon vos envies !
]

// Points awarded for completing a challenge
let XP_PER_CHALLENGE = 10
