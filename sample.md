---
title: PENDULE DE TORSION
author: Assaad EL OUALJI
date: 15 janvier 2024
numbersections: true
toc: true
fontsize: 12pt
geometry: margin=2cm
header-includes: |
    \usepackage[french]{babel}
    \usepackage{circuitikz}
---

\pagebreak

# Définition

## Théorème de Thévenin

Le théorème de Thévenin est un principe fondamental en électronique qui stipule que tout circuit linéaire avec des sources de tension et des résistances peut être représenté de manière équivalente par un circuit plus simple, appelé le circuit de Thévenin. Ce circuit équivalent se compose d'une seule source de tension idéale en série avec une seule résistance, appelée la résistance de Thévenin. Cette représentation simplifiée conserve les mêmes caractéristiques de tension et de courant observées aux bornes du circuit d'origine lorsqu'il est connecté à une charge externe. Le théorème de Thévenin est largement utilisé en analyse de circuits pour simplifier la résolution de problèmes complexes et pour concevoir des circuits électroniques plus efficacement.

\begin{figure}
    \begin{center}
        \begin{circuitikz}[european]
            \draw (0, 0)
                to [V=$E$] (0, 2)
                to [R=$R_{1}$] (2, 2)
                to [R=$R_{3}$] (4, 2)
                to [R=$R_{ch}$] (4, 0)
                to (0, 0);
            \draw (2, 2)
                to [R=$R_{2}$] (2, 0);
        \end{circuitikz}
        \begin{circuitikz}[european]
            \draw (0, 0)
                to [V=$E$] (0, 2)
                to [R=$R_{Th}$] (2, 2)
                to [R=$R_{ch}$] (2, 0)
                to (0, 0);
        \end{circuitikz}
    \end{center}
    \caption{Les deux circuits sont équivalents.}
\end{figure}

## Théorème de Norton

Le théorème de Norton est un principe similaire au théorème de Thévenin, mais au lieu de représenter un circuit linéaire avec des sources de tension et des résistances par un circuit équivalent avec une source de tension en série avec une résistance, il le représente par une source de courant en parallèle avec une résistance. C'est-à-dire qu'il permet de remplacer un réseau complexe par un modèle plus simple, appelé le circuit de Norton, qui conserve les mêmes caractéristiques de courant et de tension observées aux bornes du circuit d'origine lorsqu'il est connecté à une charge externe. Ce théorème est également largement utilisé en analyse de circuits pour simplifier les calculs et la conception de circuits électroniques.

# Objectif

L'objectif fondamental de cette séance pratique est d'effectuer des expériences concrètes afin de confirmer la pertinence et l'applicabilité des théorèmes de Thévenin et de Norton dans des situations réelles en électronique. En menant ces expérimentations, nous chercherons à valider empiriquement les principes théoriques énoncés par ces deux théorèmes, renforçant ainsi notre compréhension pratique des circuits électriques et électroniques.

# Méthode expérimentale

Un réseau électrique linéaire bilatéral, lorsqu'il est observé à travers ses deux bornes, peut être représenté de manière équivalente par un générateur parfait. La tension de ce générateur est équivalente à la différence de potentiel à vide entre les bornes du réseau $(V_{0} = E_{th})$. Ce générateur est placé en série avec une résistance équivalente à celle mesurée entre les points lorsque les générateurs indépendants sont rendus passifs $(R_{eq} = R_{th})$.

## Théorème de Thévenin

### Matériels utilisés

#. 1 alimentation de 15 volts
#. 4 résistances $(R_{1} = 10\ k\Omega,\ R_{2} = 4,7\ k\Omega,\ R_{3} = 0,2\ k\Omega,\ R_{ch} = 0,1\ k\Omega)$
#. 1 multimètre

Table: Comparaison entre les mesures expérimentales et les mesures pratiques.

+----------+-----------------------+---------------------+
|          | Résultats théoriques  | Résultats pratiques |
+:========:+:=====================:+:===================:+
| $E_{Th}$ | $4,795\ V$            | $4,75\ V$           |
+----------+-----------------------+---------------------+
| $R_{Th}$ | $3,397\ k\Omega$      | $3,37\ k\Omega$     |
+----------+-----------------------+---------------------+
| $I_{N}$  | $1,425\ mA$           | $1,42\ mA$          |
+----------+-----------------------+---------------------+
| $R_{N}$  | $3,397\ k\Omega$      | $3,37\ k\Omega$     |
+----------+-----------------------+---------------------+
| $V_{ch}$ | $0,137\ V$            | $0,14\ V$           |
+----------+-----------------------+---------------------+

