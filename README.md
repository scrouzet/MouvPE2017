Ce code permet d'extraire automatiquement les données du fichier pdf du mouvement 2017 pour les profs des écoles en Haute-Garonne (31). Ceci pour créer une carte Google Map avec un repère par école (maternelles et élémentaires).

Quand on clique sur un repère, on voit toutes les informations extraites du pdf pour cette école. Le code couleur correspond au nombre de postes vacants : par exemple repère gris = école sans poste noté vacant. Suivez ce lien pour accéder à la carte : 
https://drive.google.com/open?id=1AzOy1cuPgFxCl9L1FvM6shpca88&usp=sharing

Notes :
- Je n’ai pour le moment extrait que les postes ENS.CL.MA, ENS.CL.ELE et T.R.S.. Je peux en ajouter d’autres si ça vous intéresse mais il faut me donner exactement leur dénomination dans le document.
- 51 écoles (sur un total de 1079) de Haute-Garonne ont une adresse introuvable par Google Map automatiquement, et sont donc manquantes sur cette carte. 
- Je peux tenter de faire tourner mon programme sur d’autres départements, dans ce cas il faut m’envoyer le pdf original (et espérer qu'il respecte la même organisation, ce qui est peu probable).
- Je ne peux pas garantir l’absence d’erreur. Utilisez-le pour vous aider dans votre choix, mais vérifiez tout de même les écoles choisies dans le pdf original. 
- Merci de me rapporter des erreurs si vous en trouvez (expliquez moi clairement svp). Dites moi aussi si cela a bien fonctionné, que je sache !


TODO :
- fusionner les MAT et ELE quand c'est la même école
- collecter les données géo dans le data.frame, puis plotter la map indépendamment de gmap
- ajouter d'autres départements
- est-ce que c'est compatible avec le 2ème mouvement ?

Intitulés des postes trouvés (liste non exhaustive...) :
"ENS.CL.MA"
"ENS.CL.ELE"
"T.R.S."

"ANIM.INF"
"REFERENT"
"DECH DIR"
"ENS.IT.SPE"
"CP.LANG.ET"
"ULIS"
"MAITRE SUP"
"AN.CASNAV"
"CORPED"
"DIR.EC.ELE"
"DIR.EC.MAT"
"ENS.APP.EL"
"TIT.R.ZIL"
