import numpy as np


## Variables constantes

nb_eleves = 200
nb_cours = 30

## Vecteurs constants

creneaux_cours=[[i for i in range(28)],[i for i in range(28,31)],[i for i in range(31,41)],[i for i in range(41,50)],[41,42]+[i  for i in range(50,74)],[i for i in range(74,81)],[i for i in range(81,92)],[i for i in range(91,98)],[i for i in range(98,103)],[98,99,103,104],[105,106],[107],[i for i in range(108,114)]]
nb_creneaux = len(creneaux_cours)

capacites_cours = 15*np.ones(nb_cours)  # demander a stacey

A_egalite = np.zeros(nb_eleves, nb_eleves*nb_cours)
for i in range(nb_eleves) :
    A[i, i*nb_cours:(i+1)*nb_cours] = 1

A_inegalite = np.zeros(nb_cours + nb_eleves*nb_horaires, nb_eleves*nb_cours)
for j in range(nb_cours) :
    for k in range(nb_eleves) :
        A_inegalite[j, j + k*nb_cours] = 1
for e in range(nb_elves) :
    for c in range(nb_creneaux) :
        for j in creneaux_cours[c]:
            A_inegalite[nb_cours + e*nb_creneaux + c, e*nb_cours + j]



b_inegalite = np.ones(nb_cours + nb_eleves*nb_horaires)
for j in range(nb_cours) :
    b_inegalite[j] = capacites_cours[j]

bornes = (0, 1)

## Vecteurs variables (à remplir avec les demandes des élèves)

w = np.zeros(nb_eleves*nb_cours)

b_egalite = np.zeros(nb_eleves)

## Resulat

lamba.reshape(nb_eleves, nb-cours)
