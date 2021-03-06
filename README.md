# Citoyens_Producteurs

#### Citoyens Producteurs est une plateforme de mise en relation promouvant une économie locale et éco-responsable

## Membres du groupe : 

Augustin de Louvencourt, Leo Vanel, Thibault Mariolle, Lana Vizeu et Anthony Phimphachanh

## Liens : 

[Lien Heroku](https://citoyens-producteurs.herokuapp.com/)

[Lien Trello](https://trello.com/b/PKTqicI3/projet-final/)

[Lien Github](https://github.com/Anthonyph/Citoyens_Producteurs/)



## Contexte

Ce projet est l'idée de Nathalie Patrat, mon ancienne responsable de promo et prof à l'ESG...
Je lui ai parlé de THP, elle m'a parlé de son concept qu'elle commençait à mettre sur pied. Il ne lui manquait qu'une plateforme pour faciliter la logistique... La suite, on va l'écrire ensemble :)

## Comment lancer le projet ?

  $ git clone git@github.com:Anthonyph/Citoyens_Producteurs.git

  $ bundle install

  $ rails db:drop db:create db:migrate db:seed

  $ rails server

  => va sur "http://localhost:3000/" sur ton navigateur.

  Bonne navigation !


## Pre-requis 

Pour lancer cette web-app vous devez avoir Ruby 2.5.1

## 1. Présentation

Citoyens Producteurs a pour ambition de créer un écosystème coopératif, autour d'une activité locale et éco-responsable :

D'un côté, nous avons des particuliers qui produisent de beaux légumes/fruits dans leur jardin
De l'autre, des consommateurs soucieux de la planète, de leurs voisins et de leur alimentation.
La plateforme que nous allons développer permettra de mettre en relation les différents acteurs : producteurs, distributeurs et consommateurs.

Elle permettra surtout de gérer efficacement les flux (nous parlons de produits frais qui doivent être consommés relativement rapidement) impliquant de multiples acteurs.

Un modèle où chaque acteur s'engage :
- Producteurs : don et troc privilégiés
- Consommateurs : achat au prix public, réductions via consignes des contenants, don de produit contre engagement
- Distributeurs : revente sans marge (sponsoring), revente avec marge (schéma classique), utilisation de produits achetés (restaurants/traiteurs)

## 2. Parcours utilisateur
Vous connaissez Too Good To Go ? Bah c'est pareil en complètement différent.

N'importe quel utilisateur peut accéder aux produits en vente. Pour acheter ou faire du troc, il est nécessaire de se connecter. On peut participer en tant que producteur. On a une nouvelle interface qui donne accès, notamment, à un agenda permettant de préciser le jour et l'heure de livraison prévue au distributeur (qui valide ou non).

## 3. Concrètement et techniquement

### 3.1. Base de données
La base de données aura plusieurs tables :
- users
- products
- events
- messages
- address
- feedback
- comment
- store
- event_type
- product_event
- unit
- store_product
- appointment
- product_appointment

### 3.2. Front
Notre client nous a donné sa charte graphique (couleurs et logo).
Nous serons exigents sur l'ergonomie car nos utilisateurs le méritent !


### 3.3. Backend
Les APIs Stripe Google Maps pour localiser les producteurs. Sendgrid pour le Mailer.
Bonus : une API météo pour l'interface "producteurs".

## 4. La version minimaliste mais fonctionnelle qu'il faut avoir livré la première semaine

Deux interfaces : clients et producteurs. Les clients devront pouvoir s'inscrire, accéder aux produits disponibles, les acheter, accéder à une interface "producteurs" pour proposer leurs produits, afficher leurs gains.

## 5. La version que l'on présentera aux jury
Nous ajouterons une interface admin pour la gestion des produits, un agenda pour planifier les livraisons, l'API Google Maps pour la carte des producteurs et distributeurs.

## 6. Notre mentor
Le meilleur, tout simplement, @Roman aka karadoc, corsaire session 9 :)

