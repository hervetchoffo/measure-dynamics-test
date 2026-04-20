#!/bin/bash

# ==============================================================================
# Script d'initialisation : Projet LaTeX "Measure & Dynamics"
# Environnement : Linux Mint / VS Code / Git
# ==============================================================================

# 1. Configuration du script
set -euo pipefail  # Arrêter en cas d'erreur, vérifier les variables non définies, et les erreurs dans les pipes

# 2. Définition des variables
PROJECT="measure-dynamics-book"
GIT_REMOTE_URL="https://github.com/hervetchoffo/measure-dynamics-book.git"

# 3. Vérification de l'environnement
echo "🔍 Vérification de l'environnement..."

# Vérifier si on est déjà dans le dossier du projet
if [ "$(basename "$PWD")" = "$PROJECT" ]; then
    echo "⚠️  Vous êtes déjà dans le dossier '$PROJECT'."

    # Vérifier si c'est déjà un dépôt Git
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "❌ Ce dossier est déjà un dépôt Git. Arrêt par sécurité."
        exit 1
    fi
else
    # Vérifier si le dossier existe déjà ailleurs
    if [ -d "$PROJECT" ]; then
        echo "❌ Le dossier '$PROJECT' existe déjà. Arrêt par sécurité."
        exit 1
    fi

    # Créer le dossier et y entrer
    echo "📁 Création du dossier '$PROJECT'..."
    mkdir -p "$PROJECT"
    cd "$PROJECT" || exit 1
fi

# 4. Initialisation Git
echo "🔧 Configuration de Git..."
git init -q
git branch -M main  # Renommer la branche par défaut en 'main'
git remote add origin "$GIT_REMOTE_URL"  # Ajouter le dépôt distant
echo "📝 Création du fichier .gitignore pour LaTeX..."
cat <<'EOF' > .gitignore
## --- CORE LATEX (Fichiers auxiliaires de base) ---
*.aux
*.log
*.toc
*.out
*.synctex.gz
*.pdf
*.fdb_latexmk
*.fls

## --- BIBLIOGRAPHIE (BibTeX / Biber) ---
*.bbl
*.bbl-SAVE-ERROR
*.blg
*.bcf
*.bcf-SAVE-ERROR
*.run.xml

## --- INDEX, GLOSSAIRES ET LISTES (lof, lot, ist) ---
*.idx
*.ilg
*.ind
*.ist
*.glo
*.gls
*.glg
*.lof
*.lot

## --- MINI-SOMMAIRES (Package minitoc : maf, mtc) ---
*.maf
*.mtc
*.mtc[0-9]*

## --- ÉDITEURS & SYSTÈME (VS Code, Linux Mint, etc.) ---
.vscode/
*.code-workspace
*~
.*.swp
.DS_Store
Thumbs.db

## --- EXTENSIONS SPÉCIFIQUES ---
pythontex-files-*/
*.pytxcode

## --- CI/CD METADATA ---
version.tex
EOF

# 5. Création de l'arborescence complète
echo "📁 Création de l'arborescence..."

# -----------------------
# Racine
# -----------------------
mkdir -p \
  preamble \
  frontmatter/introduction \
  chapters \
  appendices \
  bibliography \
  .github/ISSUE_TEMPLATE \
  .github/workflows \
  site

touch main.tex README.md CONTRIBUTING.md

# -----------------------
# Préambule
# -----------------------
touch preamble/packages.tex
touch preamble/macros.tex
touch preamble/theoremstyle.tex
touch preamble/layout.tex

# -----------------------
# Frontmatter
# -----------------------
touch frontmatter/titlepage.tex
touch frontmatter/introduction/introduction.tex

# -----------------------
# Chapitre 1
# -----------------------
mkdir -p chapters/01-espaces-mesures/sections/{01-espaces-mesurables,02-mesures-images,03-classe-monotone,04-espaces-standards,05-pathologies}

cat <<'EOF' > chapters/01-espaces-mesures/chapter.tex
\chapter{Espaces mesurés}

\input{chapters/01-espaces-mesures/sections/01-espaces-mesurables/section}
\input{chapters/01-espaces-mesures/sections/02-mesures-images/section}
\input{chapters/01-espaces-mesures/sections/03-classe-monotone/section}
\input{chapters/01-espaces-mesures/sections/04-espaces-standards/section}
\input{chapters/01-espaces-mesures/sections/05-pathologies/section}
EOF

cat <<'EOF' > chapters/01-espaces-mesures/sections/01-espaces-mesurables/section.tex
\section{Espaces mesurables}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/01-espaces-mesures/sections/02-mesures-images/section.tex
\section{Mesures images et mesures invariantes}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/01-espaces-mesures/sections/03-classe-monotone/section.tex
\section{Lemme de la classe monotone}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/01-espaces-mesures/sections/04-espaces-standards/section.tex
\section{Espaces mesurables standards}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/01-espaces-mesures/sections/05-pathologies/section.tex
\section{Pathologies classiques}
Contenu à rédiger.
EOF

# -----------------------
# Chapitre 2
# -----------------------
mkdir -p chapters/02-techniques-construction/sections/{01-caratheodory,02-riesz-markov/subs/{01-integration,02-lp,03-riesz-markov},03-produit-desintegration/subs/{01-produit-fini,02-kolmogorov,03-rokhlin}}

cat <<'EOF' > chapters/02-techniques-construction/chapter.tex
\chapter{Techniques de construction des mesures}

\input{chapters/02-techniques-construction/sections/01-caratheodory/section}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/section}
\input{chapters/02-techniques-construction/sections/03-produit-desintegration/section}
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/01-caratheodory/section.tex
\section{Extension de Carathéodory}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/02-riesz-markov/section.tex
\section{Représentation de Riesz--Markov}

\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/01-integration/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/02-lp/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/03-riesz-markov/sub}
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/02-riesz-markov/subs/01-integration/sub.tex
\subsection{L'intégration}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/02-riesz-markov/subs/02-lp/sub.tex
\subsection{Les espaces \(L^p\)}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/02-riesz-markov/subs/03-riesz-markov/sub.tex
\subsection{Théorème de représentation de Riesz--Markov}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/03-produit-desintegration/section.tex
\section{Produit et désintégration}

\input{chapters/02-techniques-construction/sections/03-produit-desintegration/subs/01-produit-fini/sub}
\input{chapters/02-techniques-construction/sections/03-produit-desintegration/subs/02-kolmogorov/sub}
\input{chapters/02-techniques-construction/sections/03-produit-desintegration/subs/03-rokhlin/sub}
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/03-produit-desintegration/subs/01-produit-fini/sub.tex
\subsection{Produit fini d'espaces mesurés}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/03-produit-desintegration/subs/02-kolmogorov/sub.tex
\subsection{Théorème d'extension de Kolmogorov}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/02-techniques-construction/sections/03-produit-desintegration/subs/03-rokhlin/sub.tex
\subsection{Théorème de désintégration de Rokhlin}
Contenu à rédiger.
EOF

# -----------------------
# Chapitre 3
# -----------------------
mkdir -p chapters/03-theorie-ergodique/sections/{01-dynamique-ergodique/subs/{01-ergodicite,02-decomposition},02-convergence-ergodique/subs/{01-von-neumann,02-maximal,03-birkhoff,04-folner},03-applications/subs/{01-nombres,02-information,03-jeux,04-ia}}

cat <<'EOF' > chapters/03-theorie-ergodique/chapter.tex
\chapter{Théorie ergodique et applications}

\input{chapters/03-theorie-ergodique/sections/01-dynamique-ergodique/section}
\input{chapters/03-theorie-ergodique/sections/02-convergence-ergodique/section}
\input{chapters/03-theorie-ergodique/sections/03-applications/section}
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/01-dynamique-ergodique/section.tex
\section{Dynamique ergodique}

\input{chapters/03-theorie-ergodique/sections/01-dynamique-ergodique/subs/01-ergodicite/sub}
\input{chapters/03-theorie-ergodique/sections/01-dynamique-ergodique/subs/02-decomposition/sub}
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/01-dynamique-ergodique/subs/01-ergodicite/sub.tex
\subsection{L'ergodicité}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/01-dynamique-ergodique/subs/02-decomposition/sub.tex
\subsection{Théorème de décomposition ergodique}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/02-convergence-ergodique/section.tex
\section{Théorèmes de convergence ergodique}

\input{chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/01-von-neumann/sub}
\input{chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/02-maximal/sub}
\input{chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/03-birkhoff/sub}
\input{chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/04-folner/sub}
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/01-von-neumann/sub.tex
\subsection{Théorème ergodique moyen (Von Neumann)}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/02-maximal/sub.tex
\subsection{Théorème ergodique maximal}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/03-birkhoff/sub.tex
\subsection{Théorème ergodique ponctuel (Birkhoff)}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/02-convergence-ergodique/subs/04-folner/sub.tex
\subsection{Les suites de Folner}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/03-applications/section.tex
\section{Applications de la théorie ergodique}

\input{chapters/03-theorie-ergodique/sections/03-applications/subs/01-nombres/sub}
\input{chapters/03-theorie-ergodique/sections/03-applications/subs/02-information/sub}
\input{chapters/03-theorie-ergodique/sections/03-applications/subs/03-jeux/sub}
\input{chapters/03-theorie-ergodique/sections/03-applications/subs/04-ia/sub}
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/03-applications/subs/01-nombres/sub.tex
\subsection{L'ergodicité en théorie des nombres}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/03-applications/subs/02-information/sub.tex
\subsection{L'ergodicité en théorie de l'information}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/03-applications/subs/03-jeux/sub.tex
\subsection{L'ergodicité en théorie des jeux}
Contenu à rédiger.
EOF

cat <<'EOF' > chapters/03-theorie-ergodique/sections/03-applications/subs/04-ia/sub.tex
\subsection{L'ergodicité en intelligence artificielle}
Contenu à rédiger.
EOF

# -----------------------
# Appendices
# -----------------------
mkdir -p appendices/{A-axiome-choix,B-quotient,C-galois-poincare,D-riemann-lebesgue,E-leibniz-schwartz,F-fonctions-elementaires}

cat <<'EOF' > appendices/A-axiome-choix/appendix.tex
\chapter{Omniprésence de l'axiome du choix}
EOF

cat <<'EOF' > appendices/B-quotient/appendix.tex
\chapter{Omniprésence du quotient}
EOF

cat <<'EOF' > appendices/C-galois-poincare/appendix.tex
\chapter{De Galois à Poincaré}
EOF

cat <<'EOF' > appendices/D-riemann-lebesgue/appendix.tex
\chapter{De Riemann à Lebesgue}
EOF

cat <<'EOF' > appendices/E-leibniz-schwartz/appendix.tex
\chapter{De Leibniz à Schwartz}
EOF

cat <<'EOF' > appendices/F-fonctions-elementaires/appendix.tex
\chapter{Des fonctions élémentaires}
EOF

# -----------------------
# Bibliographie
# -----------------------
touch bibliography/bibliography.tex
touch bibliography/references.bib

# -----------------------
# Site web
# -----------------------
touch site/index.md
touch site/status.md
touch site/roadmap.md
touch site/changelog.md
touch site/_config.yml

# 6. Génération du fichier main.tex
echo "📝 Génération du fichier main.tex..."
cat <<'EOF' > main.tex
\documentclass[11pt,a4paper]{book}

% ========================
% Preamble
% ========================
\input{preamble/packages}
\input{preamble/macros}
\input{preamble/theoremstyle}
\input{preamble/layout}

\begin{document}

% ========================
% Front matter
% ========================
\frontmatter
\input{frontmatter/titlepage}
\tableofcontents
\input{frontmatter/introduction/introduction}

% ========================
% Main matter
% ========================
\mainmatter

% Chapitres
\input{chapters/01-espaces-mesures/chapter}
\input{chapters/02-techniques-construction/chapter}
\input{chapters/03-theorie-ergodique/chapter}

% Appendices
\appendix
\input{appendices/A-axiome-choix/appendix}
\input{appendices/B-quotient/appendix}
\input{appendices/C-galois-poincare/appendix}
\input{appendices/D-riemann-lebesgue/appendix}
\input{appendices/E-leibniz-schwartz/appendix}
\input{appendices/F-fonctions-elementaires/appendix}

% ========================
% Back matter
% ========================
\backmatter

% Bibliography
\nocite{*} % <--- Force l'affichage de TOUTES les entrées du fichier .bib
\input{bibliography/bibliography}

\end{document}
EOF

# 7. Génération du fichier packages.tex
echo "📝 Génération du fichier packages.tex..."
cat <<'EOF' > preamble/packages.tex
% --- Encodage et Langue ---
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[french]{babel} % Gestion des césures et titres en français

% --- Mathématiques (Indispensables) ---
\usepackage{amsmath, amssymb, amsthm}
\usepackage{mathrsfs}   % Pour les tribus (ex: \mathscr{A}, \mathscr{F})
\usepackage{mathtools}  % Pour \DeclarePairedDelimiter (normes, valeurs absolues)
\usepackage{amsfonts}
\usepackage{bbm}        % Pour la fonction indicatrice \mathbbm{1}

% --- Couleurs et Graphiques ---
\usepackage[dvipsnames]{xcolor} % Pour RoyalBlue et les gris
\usepackage{graphicx}
\usepackage{tikz}       % Pour les schémas de systèmes dynamiques
\usetikzlibrary{cd}     % Pour les diagrammes commutatifs
\usepackage[framemethod=TikZ]{mdframed} % Pour les encadrés (ex. le Disclaimer de titlepage)

% --- Mise en page ---
\usepackage{geometry}
\geometry{
    a4paper,
    margin=3cm,
    headheight=14pt % Évite des warnings avec fancyhdr
}
\usepackage{microtype} % Améliore subtilement l'espacement des lettres (très pro)
\usepackage{emptypage} % Rend les pages vraiment vides entre les chapitres

% --- Liens et Références ---
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=RoyalBlue,
    citecolor=PineGreen,
    urlcolor=Magenta
}
\usepackage{cleveref}   % Pour \cref{label} qui écrit par exemple "Chapitre 1" tout seul

% --- Bibliographie (Recommandé : BibLaTeX + Biber) ---
\usepackage{csquotes}
\usepackage[backend=biber, style=alphabetic]{biblatex}
\addbibresource{bibliography/references.bib}
EOF

# 8. Génération du fichier theoremstyle.tex
echo "📝 Génération du fichier theoremstyle.tex..."
cat <<'EOF' > preamble/theoremstyle.tex
% --- Style pour les Théorèmes et résultats (Italique) ---
\theoremstyle{plain}
\newtheorem{theorem}{Théorème}[chapter]
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{lemma}[theorem]{Lemme}
\newtheorem{corollary}[theorem]{Corollaire}
\newtheorem{conjecture}[theorem]{Conjecture}

% --- Style pour les Définitions (Texte droit) ---
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Définition}
\newtheorem{example}[theorem]{Exemple}
\newtheorem{exercise}[theorem]{Exercice}
\newtheorem{problem}[theorem]{Problème}

% --- Style pour les Remarques et Notes ---
\theoremstyle{remark}
\newtheorem{remark}[theorem]{Remarque}
\newtheorem{note}[theorem]{Note}
\newtheorem{notation}[theorem]{Notation}

% --- Configuration de Cleveref pour le Français ---
% Permet de taper \cref{th:mon_theoreme} et d'obtenir "théorème 1.1"
\crefname{theorem}{théorème}{théorèmes}
\crefname{proposition}{proposition}{propositions}
\crefname{definition}{définition}{définitions}
\crefname{lemma}{lemme}{lemmes}
EOF

# 9. Génération du fichier layout.tex
echo "📝 Génération du fichier layout.tex..."
cat <<'EOF' > preamble/layout.tex
% --- Numérotation et Table des matières ---
\numberwithin{equation}{chapter}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

% --- Gestion des veuves et orphelines ---
% Évite qu'une ligne seule se retrouve en haut ou en bas d'une page
\widowpenalty=10000
\clubpenalty=10000

% --- Espacement des lignes ---
% Un léger interligne (1.05) facilite la lecture des formules denses
\linespread{1.05}
EOF

# 10. Génération du fichier macros.tex
echo "📝 Génération du fichier macros.tex..."
cat <<'EOF' > preamble/macros.tex
% ==================================================
% Métadonnées globales
% ==================================================
\newcommand{\BookTitle}{Théorie de la mesure et systèmes dynamiques}
\newcommand{\BookSubtitle}{Fondements, constructions et applications ergodiques}
\newcommand{\BookAuthor}{TCHOFFO SONWA Hervé}
\newcommand{\BookRepository}{https://github.com/hervetchoffo/measure-dynamics-book}
\newcommand{\BookLicense}{Creative Commons CC BY-SA 4.0}
\newcommand{\BookLicenseUrl}{https://creativecommons.org/licenses/by-sa/4.0/}

% =========================
% Métadonnées CI / CD
% =========================
\InputIfFileExists{version.tex}{
  % Le fichier version.tex est généré par le pipeline CI/CD
}{% Valeurs par défaut pour l'édition locale
  \newcommand{\BookVersion}{working-copy}
  \newcommand{\BookBranch}{local-build}
  \newcommand{\BookCommit}{local-build}
  \newcommand{\BookDate}{\today}
  \newcommand{\BookStatus}{Version de travail}
  \newcommand{\BookDisclaimer}{Cet ouvrage est en cours de rédaction et peut contenir des erreurs ou des résultats incomplets. Toute remarque ou suggestion est la bienvenue via le dépôt GitHub.}
}

% ==================================================
% Macros structurelles
% ==================================================
\newcommand{\starredchapter}[1]{%
  \cleardoublepage
  \chapter*{#1}%
  \markboth{#1}{#1}%
  \addcontentsline{toc}{chapter}{#1}%
}

% ==================================================
% Macros mathématiques
% ==================================================
% Ensembles
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\C}{\mathbb{C}}

% Mesure & Probabilités
\newcommand{\B}{\mathscr{B}}
\newcommand{\Prob}{\mathbb{P}}
\newcommand{\ind}{\mathbbm{1}} % Nécessite bbm

% Opérateurs (mieux avec DeclareMathOperator pour l'espacement)
\DeclareMathOperator{\E}{\mathbb{E}}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\supp}{supp}
\DeclareMathOperator{\diam}{diam}
EOF

# 11. Génération du fichier titlepage.tex
echo "📝 Génération du fichier titlepage.tex..."
cat <<'EOF' > frontmatter/titlepage.tex
\begin{titlepage}
    \centering
    
    \vspace*{2cm}
    % --- Titre et Sous-titre ---
    {\huge\bfseries\sffamily\color{RoyalBlue} \BookTitle \par}
    \vspace{0.6cm}
    {\Large\sffamily\color{gray} \BookSubtitle \par}
    
    \vspace{2cm}
    
    % --- Auteur ---
    {\Large\bfseries \BookAuthor \par}
    
    \vfill

    % --- Illustration ou logo (Optionnel) ---
    % \includegraphics[width=0.4\textwidth]{logo.pdf} 
    
    \vfill
    
    % --- Bloc de Statut Dynamique ---
    \begin{mdframed}[linewidth=1pt, linecolor=gray!20, backgroundcolor=gray!5, roundcorner=5pt]
        \centering
        \textbf{\sffamily \BookStatus} \\
        \vspace{0.2cm}
        \small \BookDisclaimer
    \end{mdframed}

    \vfill
    
    % --- Pied de page ---
    {\small \copyright\ \the\year\ -- Tous droits réservés}

    \vfill 

    % --- Lien Repo & Métadonnées CI/CD ---
    {\small\sffamily\color{gray}
        \href{\BookRepository}{\texttt{\BookRepository}} \\
        Version: \BookVersion\ (\BookBranch) -- Commit: \BookCommit \\
        \BookDate
    }

\end{titlepage}

% Page blanche après le titre pour respecter les standards éditoriaux
\cleardoublepage
EOF

# 12. Génération du fichier introduction.tex
echo "📝 Génération du fichier introduction.tex..."
cat <<'EOF' > frontmatter/introduction/introduction.tex
\starredchapter{Introduction}

Ce livre est consacré à la théorie de la mesure et à ses interactions profondes avec les systèmes dynamiques et la théorie ergodique.
EOF

# 13. Génération du fichier bibliography.tex
echo "📝 Génération du fichier bibliography.tex..."
cat <<'EOF' > bibliography/bibliography.tex
\starredchapter{Bibliographie}

\printbibliography[heading=none]
EOF

# 14. Initialisation du fichier references.bib
echo "📝 Initialisation du fichier references.bib..."
cat <<'EOF' > bibliography/references.bib
@book{Cohn2013,
  author    = {Donald L. Cohn},
  title     = {Measure Theory},
  publisher = {Springer},
  year      = {2013},
  edition   = {2nd},
}

@book{Bogachev2007,
  author    = {Vladimir I. Bogachev},
  title     = {Measure Theory},
  publisher = {Springer},
  year      = {2007},
}

@book{Parthasarathy1967,
  author    = {K. R. Parthasarathy},
  title     = {Probability measures on metric spaces},
  publisher = {Academic Press},
  year      = {1967},
}

@book{Einsiedler2011,
  author    = {Manfred Einsiedler and Thomas Ward},
  title     = {Ergodic Theory with a View Towards Number Theory},
  publisher = {Springer},
  year      = {2011},
}
EOF

# 15. Création des workflows GitHub
# 15.1. Génération du fichier build-dev-version.yml
echo "📝 Génération du workflow Build PDF (dev-version)..."
cat <<'EOF' > .github/workflows/build-dev-version.yml
name: Build PDF (dev-version)

on:
  push:
    branches-ignore:
      - main

jobs:
  build-and-cleanup:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      actions: write  # Nécessaire pour supprimer les anciens artefacts
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 1 # On n'a besoin que du commit actuel pour le hash court

      - name: Injection des métadonnées (version.tex)
        id: inject
        run: |
          # extraire dernier segment du nom de branche
          branch="${GITHUB_REF_NAME##*/}"
          
          # normaliser : minuscules, remplacer groupes de caractères non autorisés par '-'
          safe_branch="$(printf '%s' "$branch" \
            | tr '[:upper:]' '[:lower:]' \
            | sed -E 's/[^a-z0-9._-]+/-/g' \
            | sed -E 's/^-+|-+$//g')"
          
          # tronquer si trop long (ex. 60 chars)
          safe_branch="${safe_branch:0:60}"
          
          # échapper caractères spéciaux pour LaTeX
          latex_branch="$(printf '%s' "$safe_branch" \
            | sed -e 's/\\/\\textbackslash{}/g' \
                  -e 's/%/\\%/g' \
                  -e 's/_/\\_/g' \
                  -e 's/#/\\#/g' \
                  -e 's/&/\\&/g' \
                  -e 's/{/\\{/g' \
                  -e 's/}/\\}/g' \
                  -e 's/\\$/\\$/g' \
                  -e 's/\\^/\\^/g' \
                  -e "s/~/\\\\textasciitilde{}/g")"
          
          # définir un output de step
          echo "safe_branch=${safe_branch}" >> $GITHUB_OUTPUT
          
          # écrire version.tex
          echo "\\newcommand{\\BookVersion}{working-copy}" > version.tex
          echo "\\newcommand{\\BookBranch}{${latex_branch}}" >> version.tex
          echo "\\newcommand{\\BookCommit}{$(git rev-parse --short HEAD)}" >> version.tex
          echo "\\newcommand{\\BookDate}{$(date +'%d/%m/%Y')}" >> version.tex
          echo "\\newcommand{\\BookStatus}{Version de travail}" >> version.tex
          echo "\\newcommand{\\BookDisclaimer}{Cet ouvrage est en cours de rédaction et peut contenir des erreurs ou des résultats incomplets. Toute remarque ou suggestion est la bienvenue via le dépôt GitHub.}" >> version.tex

      - name: Set up LaTeX and compile PDF
        uses: xu-cheng/latex-action@v3
        with:
          root_file: main.tex
          args: -pdf -interaction=nonstopmode -shell-escape
          compiler: latexmk

      - name: Check if PDF exists
        run: |
          if [ ! -f "main.pdf" ]; then
            echo "::error::PDF not found! Compilation failed."
            exit 1
          fi

      - name: Upload current PDF artifact
        uses: actions/upload-artifact@v4
        with:
          # Le nom inclut la branche et le run_id pour être unique
          name: dev-pdf-${{ steps.inject.outputs.safe_branch }}-${{ github.run_id }}
          path: main.pdf

      - name: Cleanup old artifacts (Keep last 5 for this branch)
        uses: actions/github-script@v7
        with:
          script: |
            const { owner, repo } = context.repo;
            const branchName = "${{ steps.inject.outputs.safe_branch }}";
            const prefix = `dev-pdf-${branchName}-`;

            // 1. Récupérer les artefacts du dépôt
            const { data: response } = await github.rest.actions.listArtifactsForRepo({
              owner,
              repo,
              per_page: 100
            });

            // 2. Filtrer par nom (branche actuelle uniquement) et trier par date décroissante
            const branchArtifacts = response.artifacts
              .filter(art => art.name.startsWith(prefix))
              .sort((a, b) => new Date(b.created_at) - new Date(a.created_at));

            // 3. Garder les 5 plus récents, supprimer les autres
            const toDelete = branchArtifacts.slice(5);

            console.log(`Branche: ${branchName}. Artefacts trouvés: ${branchArtifacts.length}. Suppressions: ${toDelete.length}`);

            for (const artifact of toDelete) {
              try {
                await github.rest.actions.deleteArtifact({
                  owner,
                  repo,
                  artifact_id: artifact.id,
                });
                console.log(`Supprimé: ${artifact.name}`);
              } catch (e) {
                console.log(`Erreur sur ${artifact.name}: ${e.message}`);
              }
            }
EOF

# 15.2. Génération du fichier build-feature-review.yml
echo "📝 Génération du workflow Build review PDF..."
cat <<'EOF' > .github/workflows/build-feature-review.yml
name: Build review PDF and notify reviewers

on:
  pull_request:
    types: [opened, synchronize, reopened]

permissions:
  contents: read
  pull-requests: write
  actions: write # Nécessaire pour supprimer les anciens artefacts

jobs:
  build-review-pdf:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
          ref: ${{ github.event.pull_request.head.sha }}

      - name: Get current commit
        run: |
          echo "CURRENT_COMMIT=$(git rev-parse --short HEAD)" >> $GITHUB_ENV

      - name: Injection des métadonnées (version.tex)
        id: inject
        run: |
          # extraire dernier segment du nom de branche
          branch="${{ github.head_ref }}" # récupérer la valeur fournie par Actions dans une variable shell
          branch="${branch##*/}"
          
          # normaliser : minuscules, remplacer groupes de caractères non autorisés par '-'
          safe_branch="$(printf '%s' "$branch" \
            | tr '[:upper:]' '[:lower:]' \
            | sed -E 's/[^a-z0-9._-]+/-/g' \
            | sed -E 's/^-+|-+$//g')"
          
          # tronquer si trop long (ex. 60 chars)
          safe_branch="${safe_branch:0:60}"
          
          # échapper caractères spéciaux pour LaTeX
          latex_branch="$(printf '%s' "$safe_branch" \
            | sed -e 's/\\/\\textbackslash{}/g' \
                  -e 's/%/\\%/g' \
                  -e 's/_/\\_/g' \
                  -e 's/#/\\#/g' \
                  -e 's/&/\\&/g' \
                  -e 's/{/\\{/g' \
                  -e 's/}/\\}/g' \
                  -e 's/\\$/\\$/g' \
                  -e 's/\\^/\\^/g' \
                  -e "s/~/\\\\textasciitilde{}/g")"
          
          # définir un output de step
          echo "safe_branch=${safe_branch}" >> $GITHUB_OUTPUT
          
          # écrire version.tex
          echo "\\newcommand{\\BookVersion}{review-copy}" > version.tex
          echo "\\newcommand{\\BookBranch}{${latex_branch}}" >> version.tex
          echo "\\newcommand{\\BookCommit}{${{ env.CURRENT_COMMIT }}}" >> version.tex
          echo "\\newcommand{\\BookDate}{$(date +'%d/%m/%Y')}" >> version.tex
          echo "\\newcommand{\\BookStatus}{Version de relecture}" >> version.tex
          echo "\\newcommand{\\BookDisclaimer}{Cet ouvrage est en cours de rédaction et peut contenir des erreurs ou des résultats incomplets. Toute remarque ou suggestion est la bienvenue via le dépôt GitHub.}" >> version.tex

      - name: Set up LaTeX and compile PDF
        uses: xu-cheng/latex-action@v3
        with:
          root_file: main.tex
          args: -pdf -interaction=nonstopmode -shell-escape
          compiler: latexmk

      - name: Check if PDF exists
        run: |
          if [ ! -f "main.pdf" ]; then
            echo "::error::PDF not found! Compilation failed."
            exit 1
          fi

      - name: Cleanup old PDF artifacts
        uses: actions/github-script@v7
        with:
          script: |
            const { owner, repo } = context.repo;
            const branchName = "${{ steps.inject.outputs.safe_branch }}";
            const prefix = `review-pdf-${branchName}-`;
            
            const response = await github.rest.actions.listArtifactsForRepo({
              owner,
              repo,
            });

            // On filtre pour ne garder que les artefacts de cette branche
            // en excluant celui du run actuel par sécurité
            const oldArtifacts = response.data.artifacts.filter(art => 
              art.name.startsWith(prefix)
            );

            for (const artifact of oldArtifacts) {
              console.log(`Suppression de l'ancien artefact : ${artifact.name}`);
              await github.rest.actions.deleteArtifact({
                owner,
                repo,
                artifact_id: artifact.id,
              });
            }

      - name: Upload PDF artifact
        uses: actions/upload-artifact@v4
        with:
          name: review-pdf-${{ steps.inject.outputs.safe_branch }}-${{ github.run_id }}
          path: main.pdf

      - name: Notify reviewers
        uses: actions/github-script@v7
        with:
          script: |
            const { owner, repo } = context.repo;
            const pull_number = context.issue.number;
            const artifact_url = `https://github.com/${owner}/${repo}/actions/runs/${context.runId}`;
            
            const branch = "${{ github.head_ref }}";
            const commit = "${{ env.CURRENT_COMMIT }}";
            
            const comment_header = "📄 **Nouveau PDF disponible pour relecture**";
            const body = `
            ${comment_header}
            - **Branche** : \`${branch}\`
            - **Commit** : \`${commit}\`
            - **Dernière mise à jour** : ${new Date().toLocaleString('fr-FR')}

            📥 **[Télécharger le PDF ici](${artifact_url})**
            *(Le lien se trouve en bas de la page, section "Artifacts")*

            ---
            ### Checklist pour la relecture :
            - [ ] Vérifier la cohérence des notations
            - [ ] Valider les démonstrations
            - [ ] Corriger les fautes de français/typos
            - [ ] S'assurer que les références sont correctes
            `;

            const comments = await github.rest.issues.listComments({
              owner,
              repo,
              issue_number: pull_number,
            });

            const botComment = comments.data.find(c => 
              c.user.type === 'Bot' && 
              c.body.includes(comment_header)
            );

            if (botComment) {
              await github.rest.issues.updateComment({
                owner,
                repo,
                comment_id: botComment.id,
                body: body.trim()
              });
            } else {
              await github.rest.issues.createComment({
                owner,
                repo,
                issue_number: pull_number,
                body: body.trim()
              });
            }
EOF

# 15.3. Génération du fichier build-release.yml
echo "📝 Génération du workflow Build Release PDF (Tags)..."
cat <<'EOF' > .github/workflows/build-release.yml
name: Build Release PDF (Tags)

on:
  push:
    tags:
      # Déclenchement sur v1.0.0, v1.2.3-beta, etc.
      - 'v[0-9]+.[0-9]+.[0-9]+'
      - 'v[0-9]+.[0-9]+.[0-9]+-alpha'
      - 'v[0-9]+.[0-9]+.[0-9]+-beta'
      - 'v[0-9]+.[0-9]+.[0-9]+-rc'
      - 'v[0-9]+.[0-9]+.[0-9]+-final'

jobs:
  build-release:
    runs-on: ubuntu-latest
    permissions:
      contents: write # Crucial pour créer la Release et uploader le PDF
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4
        with:
          fetch-depth: 0 # Récupère tout l'historique pour lire les annotations des tags

      - name: Verify Tag is on main branch
        run: |
          # On vérifie si origin/main contient le hash du tag actuel
          if ! git branch -r --contains ${{ github.sha }} | grep -q "origin/main"; then
            echo "::error::Action interrompue : Le tag ${{ github.ref_name }} n'a pas été créé depuis la branche main."
            exit 1
          fi
          echo "Vérification réussie : Le tag est bien issu de la branche main."

      - name: Verify Tag format
        run: |
          TAG_NAME=${GITHUB_REF_NAME}
          # On vérifie si le tag est de la forme vX.Y.Z ou vX.Y.Z-alpha|beta|rc|final
          REGEX="^v(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-(alpha|beta|rc|final))?$"
          if [[ ! "$TAG_NAME" =~ $REGEX ]]; then
            echo "❌ Tag invalide : $TAG_NAME"
            echo "Format attendu : vX.Y.Z ou vX.Y.Z[-[alpha|beta|rc|final]]"
            exit 1
          fi
          echo "✅ Vérification réussie : $TAG_NAME est bien au format attendu."

      - name: Parse Tag Metadata and Changelog
        id: meta
        run: |
          TAG_NAME=${GITHUB_REF_NAME}
          
          # 1. Extraction du message du tag annoté (Changelog)
          # Forcer la récupération des métadonnées des tags
          git fetch --tags --force
          # On utilise %(contents) pour récupérer tout le texte du tag annoté
          CHANGELOG=$(git tag -l --format='%(contents)' "${TAG_NAME}")
          # Si le changelog est vide, on essaie un fallback sur le message du commit
          if [ -z "$CHANGELOG" ]; then
            CHANGELOG=$(git show -s --format='%s' "${TAG_NAME}")
          fi

          # 2. Détermination du statut pour LaTeX
          if [[ "$TAG_NAME" == *"alpha"* ]]; then
            STATUS="Version Alpha"
            DISCLAIMER="Un ou plusieurs chapitre(s) ont été relu(s) et validé(s) mais le livre est actuelement incomplet. Toute remarque ou suggestion est la bienvenue via le dépôt GitHub."
          elif [[ "$TAG_NAME" == *"beta"* ]]; then
            STATUS="Version Bêta"
            DISCLAIMER="Tous les chapitres de ce livre sont actuellement présents mais une relecture globale est nécessaire. Toute remarque ou suggestion est la bienvenue via le dépôt GitHub."
          elif [[ "$TAG_NAME" == *"rc"* ]]; then
            STATUS="Release Candidate"
            DISCLAIMER="Version candidate à la publication stable et finalisée de l'ouvrage. Toute remarque ou suggestion est la bienvenue via le dépôt GitHub."
          else
            STATUS="Édition Officielle"
            DISCLAIMER="Version stable et finalisée de l'ouvrage."
          fi
          
          # 3. Export vers GITHUB_OUTPUT (Gestion multi-lignes pour le changelog)
          echo "tag_version=$TAG_NAME" >> $GITHUB_OUTPUT
          echo "tag_status=$STATUS" >> $GITHUB_OUTPUT
          echo "tag_disclaimer=$DISCLAIMER" >> $GITHUB_OUTPUT
          echo "tag_changelog<<EOF" >> $GITHUB_OUTPUT
          echo "$CHANGELOG" >> $GITHUB_OUTPUT
          echo "EOF" >> $GITHUB_OUTPUT

      - name: Injection des métadonnées (version.tex)
        run: |
          echo "\\newcommand{\\BookVersion}{${{ steps.meta.outputs.tag_version }}}" > version.tex
          echo "\\newcommand{\\BookBranch}{main}" >> version.tex
          echo "\\newcommand{\\BookCommit}{$(git rev-parse --short HEAD)}" >> version.tex
          echo "\\newcommand{\\BookDate}{$(date +'%d/%m/%Y')}" >> version.tex
          echo "\\newcommand{\\BookStatus}{${{ steps.meta.outputs.tag_status }}}" >> version.tex
          echo "\\newcommand{\\BookDisclaimer}{${{ steps.meta.outputs.tag_disclaimer }}}" >> version.tex

      - name: Set up LaTeX and compile PDF
        uses: xu-cheng/latex-action@v3
        with:
          root_file: main.tex
          args: -pdf -interaction=nonstopmode -shell-escape
          compiler: latexmk

      - name: Check if PDF exists
        run: |
          if [ ! -f "main.pdf" ]; then
            echo "::error::PDF not found! Compilation failed."
            exit 1
          fi

      - name: Rename PDF
        run: mv main.pdf measure_dynamics_book_${{ steps.meta.outputs.tag_version }}.pdf

      - name: Create GitHub Release
        uses: softprops/action-gh-release@v2
        with:
          files: measure_dynamics_book_${{ steps.meta.outputs.tag_version }}.pdf
          name: Edition ${{ steps.meta.outputs.tag_version }}
          tag_name: ${{ steps.meta.outputs.tag_version }}
          body: |
            ## 📘 Détails de cette édition
            - **Statut actuel** : ${{ steps.meta.outputs.tag_status }}
            - **Note** : ${{ steps.meta.outputs.tag_disclaimer }}
            
            ### 📝 Message du tag (Changelog) :
            ${{ steps.meta.outputs.tag_changelog }}

            ---
            ### 🛠 Changements techniques et contributeurs :
            *(Généré automatiquement par GitHub ci-dessous)*
          generate_release_notes: true # Ajoute automatiquement les contributeurs et PRs fusionnées
          draft: false
          # Marque comme "Pre-release" si le tag contient alpha, beta ou rc
          prerelease: ${{ contains(github.ref_name, 'alpha') || contains(github.ref_name, 'beta') || contains(github.ref_name, 'rc') }}
EOF

# 15.4. Génération du fichier auto-close-issues.yml
echo "📝 Génération du workflow Close issues automatically on PR merge..."
cat <<'EOF' > .github/workflows/auto-close-issues.yml
name: Close issues automatically on PR merge

permissions:
  issues: write

on:
  pull_request:
    types: [closed]

jobs:
  close-issues:
    # Ce job ne s'exécute que si la PR a été mergée (et non simplement fermée)
    if: github.event.pull_request.merged == true
    runs-on: ubuntu-latest

    steps:
      - name: Fermer les issues liées et ajouter un commentaire
        uses: actions/github-script@v7
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            // Récupération du texte complet de la description de la PR
            const body = context.payload.pull_request.body || '';
            const prNumber = context.payload.pull_request.number;

            // Regex ultra complète avec \b (limite de mot) pour éviter les faux positifs
            // Reconnaît : fix, fixes, fixed, close, closes, closed, resolve, resolves, resolved
            const regex = /\b(?:close|closes|closed|fix|fixes|fixed|resolve|resolves|resolved)\b\s+#(\d+)/gi;

            let match;
            const issuesToClose = new Set();

            // Recherche tous les numéros d'issue
            while ((match = regex.exec(body)) !== null) {
              // match[1] contient le numéro capturé grâce aux parenthèses (\d+)
              issuesToClose.add(match[1]);
            }

            if (issuesToClose.size === 0) {
              console.log("Aucun mot-clé (Fixes/Closes/Resolves) trouvé.");
              return;
            }

            console.log(`🔍 ${issuesToClose.size} issue(s) détectée(s) : #${Array.from(issuesToClose).join(', #')}`);

            // Pour chaque issue trouvée
            for (const issueNumber of issuesToClose) {
              try {
                const issueNum = parseInt(issueNumber);

                // 1. Fermeture de l'issue
                await github.rest.issues.update({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: issueNum,
                  state: 'closed',
                  state_reason: 'completed'
                });

                // 2. Ajout du commentaire simple : "Fermée par la PR #XX"
                await github.rest.issues.createComment({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  issue_number: issueNum,
                  body: `Fermée par la PR #${prNumber}`
                });

                console.log(`✅ Issue #${issueNum} fermée + commentaire ajouté.`);

              } catch (error) {
                console.error(`❌ Erreur avec l'issue #${issueNumber} :`, error.message);
              }
            }
EOF

# 16. Création des templates GitHub
# 16.1. Génération du fichier writing_issue.md
echo "📝 Génération du template de rédaction ..."
cat <<'EOF' > .github/ISSUE_TEMPLATE/writing_issue.md
---
name: Rédaction de sections du livre
about: Demande la rédaction d'une ou plusieurs sections (introduction, chapitre, annexe, bibliographie, section ou sous-section)
title: "[Rédaction] [nom des sections à rédiger]"
labels: ["redaction"]
---

## Description
**Sections à rédiger** : [nom des sections à rédiger]

**Fichiers LaTeX concernés** :
- [ ] `path/to/file1.tex`
- [ ] `path/to/file2.tex`
- [ ] ...

## Objectifs
- [ ] Rédiger l'introduction et les objectifs
- [ ] Développer le contenu mathématique
- [ ] Ajouter exemples et démonstrations
- [ ] Inclure exercices ou applications

## Contexte
[Décris brièvement le contenu attendu en t'appuyant sur la table des matières.]

## Échéance
- **Milestone** : [lien vers le milestone]
- **Date limite** : [JJ/MM/AAAA]
- **Assignés** : @relecteur1, @relecteur2, ...

## Labels à ajouter manuellement après création
- Release : `[nom_court_de_release]`
- Feature : `[nom_court_de_feature]`
- Priorité : `haute-priorite` | `moyenne-priorite` | `faible-priorite`
EOF

# 16.2. Génération du fichier review_issue.md
echo "📝 Génération du template de relecture ..."
cat <<'EOF' > .github/ISSUE_TEMPLATE/review_issue.md
---
name: Relecture de sections du livre
about: Demande la relecture d'une ou plusieurs sections (introduction, chapitre, annexe, bibliographie, section ou sous-section)
title: "[Relecture] [nom des sections à relire]"
labels: ["relecture"]
---

## Description
**Sections à relire** : [nom des sections à relire]

**Fichiers LaTeX concernés** :
- [ ] `path/to/file1.tex`
- [ ] `path/to/file2.tex`
- [ ] ...

**Fichier PDF** : Le PDF complet du livre est disponible dans les *Artifacts* de la PR associée.

**PR associée** : [lien vers la PR]

## Points à vérifier
- [ ] Cohérence des notations avec le reste du livre
- [ ] Exactitude des démonstrations et des résultats
- [ ] Clarté des explications et des exemples
- [ ] Correction des fautes de français et de typographie
- [ ] Vérification des références croisées
- [ ] Suggestions bibliographiques

## Contexte
[Décris les points spécifiques à vérifier ou les questions ouvertes.]

## Échéance
- **Milestone** : [lien vers le milestone]
- **Date limite** : [JJ/MM/AAAA]
- **Assignés** : @relecteur1, @relecteur2, ...

## Labels à ajouter manuellement après création
- Release : `[nom_court_de_release]`
- Feature : `[nom_court_de_feature]`
- Priorité : `haute-priorite` | `moyenne-priorite` | `faible-priorite`
EOF

# 16.3. Génération du fichier correction_issue.md
echo "📝 Génération du template de correction ..."
cat <<'EOF' > .github/ISSUE_TEMPLATE/correction_issue.md
---
name: Correction de sections du livre
about: Demande la correction d'une ou plusieurs sections (introduction, chapitre, annexe, bibliographie, section ou sous-section)
title: "[Correction] [nom de la correction]/[nom des sections à corriger]"
labels: ["correction"]
---

## Description
**Sections à corriger** : [nom des sections à corriger]

**Fichiers LaTeX concernés** :
- [ ] `path/to/file1.tex`
- [ ] `path/to/file2.tex`
- [ ] ...

**Fichier PDF** : Le PDF complet du livre est disponible dans les *Artifacts* de la PR associée.

**PR associée** : [lien vers la PR]

## Points à corriger
- [ ] Notations
- [ ] Démonstrations et résultats
- [ ] Explications et exemples
- [ ] Fautes de français et typographie
- [ ] Références croisées
- [ ] Bibliographie

## Contexte
[Décris les points spécifiques à corriger.]

## Échéance
- **Milestone** : [lien vers le milestone]
- **Date limite** : [JJ/MM/AAAA]
- **Assignés** : @relecteur1, @relecteur2, ...

## Labels à ajouter manuellement après création
- Release : `[nom_court_de_release]`
- Feature : `[nom_court_de_feature]`
- Priorité : `haute-priorite` | `moyenne-priorite` | `faible-priorite`
EOF

# 16.4. Génération du fichier PULL_REQUEST_TEMPLATE.md
echo "📝 Génération du template PR ..."
cat <<'EOF' > .github/PULL_REQUEST_TEMPLATE.md
---
name: Rajouter une fonctionnalité par la validation d'étapes de rédaction, de relecture et/ou de correction.
about: Utilisez ce template pour documenter le rajout d'une fonctionnalité.
title: "[nom de la feature]"
---

## Description
Ce PR [ajoute/corrige] [décris brièvement les modifications].

## Issues associées
- [ ] Fixes #
- [ ] ...

## Types de modifications
- [ ] Rédaction initiale
- [ ] Correction de contenu
- [ ] Correction de typographie
- [ ] Ajout d'exemples ou d'exercices

## Checklist pour les relecteurs
- [ ] Vérifier la cohérence des notations.
- [ ] Valider les démonstrations et les résultats.
- [ ] Corriger les fautes de français.
- [ ] Vérifier la compilation LaTeX.

## Contexte supplémentaire
[Ajoute du contexte utile pour les relecteurs et explique pourquoi ces changements sont nécessaires.]

## Échéance
- **Milestone** : [lien vers le milestone]
- **Date limite** : [JJ/MM/AAAA]
- **Assignés** : @relecteur1, @relecteur2, ...

## Labels à ajouter manuellement après création
- Release : `[nom_court_de_release]`
- Priorité : `haute-priorite` | `moyenne-priorite` | `faible-priorite`
EOF

# 16.5. Génération du fichier MILESTONE_TEMPLATE.md
echo "📝 Génération du template milestone ..."
cat <<'EOF' > .github/MILESTONE_TEMPLATE.md
---
name: Rajouter un jalon pour la livraison d'une release
about: Demande la documentation d'une release
title: "[TAG NAME] ([nom de la release])"
---

## Objectifs
- [ ] Objectif 1
- [ ] Objectif 2
- [ ] ...

---
## Critères de validation
- [ ] Critère 1
- [ ] Critère 2
- [ ] ...

---
## Issues & PRs liées
- [ ] [lien vers PR ou ISSUE]
- [ ] ...

---
## Notes de release
  ### Nouveautés et améliorations principales
- [Résumé fonctionnalité 1]
- [Résumé fonctionnalité 2]
- ...

---
## Échéance
**Date limite** : [JJ/MM/AAAA]
EOF

# 16.6. Génération du fichier README.md
echo "📝 Génération du fichier README ..."
cat <<'EOF' > README.md
# 📘 Théorie de la mesure et systèmes dynamiques

**Un ouvrage de référence sur la théorie de la mesure, les systèmes dynamiques et la théorie ergodique**
avec des applications en théorie des nombres et en théorie de l'information.

[![License (code)](https://img.shields.io/badge/license_code-MIT-blue.svg)](LICENSE)
[![License (book)](https://img.shields.io/badge/license_book-CC_BY--SA_4.0-green.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Dernier commit](https://img.shields.io/github/last-commit/hervetchoffo/measure-dynamics-book)](https://github.com/hervetchoffo/measure-dynamics-book/commits/main)
[![Build Status](https://github.com/hervetchoffo/measure-dynamics-book/actions/workflows/build-release.yml/badge.svg)](https://github.com/hervetchoffo/measure-dynamics-book/releases)

---

## 📖 Table des matières
- [À propos du projet](#-à-propos-du-projet)
- [Philosophie du projet](#-philosophie-du-projet)
- [Installation et compilation](#-installation-et-compilation)
- [Structure du dépôt](#-structure-du-dépôt)
- [Templates disponibles](#-templates-disponibles)
- [Comment contribuer](#-comment-contribuer)
- [Roadmap & statut éditorial](#%EF%B8%8F-roadmap--statut-éditorial)
- [Licence](#-licence)
- [Contact & discussions](#-contact--discussions)

---

## 📝 À propos du projet
Ce dépôt contient les sources LaTeX complètes d’un livre collaboratif sur la **théorie de la mesure orientée vers les systèmes dynamiques, la théorie ergodique et ses applications**.

**Source of truth** : GitHub.
Le projet suit une édition incrémentale inspirée des pratiques CI/CD.

---

## 🧠 Philosophie du projet
- Édition incrémentale et modulaire
- Compilation automatique à chaque modification
- Modularité maximale (préambule centralisé, code LaTeX décomposé en sections et/ou sous-sections)
- Collaboration facilitée grâce aux templates d’issues, de PRs et de milestones

---

## 🚀 Installation et compilation

### Compilation locale
```bash
git clone https://github.com/hervetchoffo/measure-dynamics-book.git
cd measure-dynamics-book

# Méthode recommandée (si tu as un Makefile)
make pdf

# Ou manuellement
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Le PDF final est généré dans `main.pdf`.

---

## 📁 Structure du dépôt
```bash
measure-dynamics-book/
├── main.tex                      # Point d’entrée du document
├── preamble/                     # Macros, packages, styles et mise en page (centralisés)
├── frontmatter/                  # Page de titre, introduction, etc.
├── chapters/                     # Contenu scientifique (un fichier par chapitre ou section)
├── appendices/                   # Annexes (un fichier par annexe ou section)
├── bibliography/                 # Fichiers .bib
├── site/                         # Feuille de route, statut éditorial, historique des versions
└── .github/
    ├── ISSUE_TEMPLATE/           # Templates de rédaction
    ├── PULL_REQUEST_TEMPLATE.md  # Template pour les Pull Requests
    ├── MILESTONE_TEMPLATE.md     # Template pour documenter les milestones
    └── workflows/                # CI/CD (compilation, publication de releases, auto-fermeture d’issues)
```

---

## 📋 Templates disponibles
Pour faciliter la collaboration, nous utilisons des templates structurés :

- **Rédaction, relecture et correction des sections** → formulaires avec priorité, feature & release
- **Pull Request** → template pour la validation et clôture des points d’action
- **Milestone** → modèle pour documenter chaque livraison

→ Voir :
- [`.github/ISSUE_TEMPLATE/`](.github/ISSUE_TEMPLATE/)
- [`.github/PULL_REQUEST_TEMPLATE.md`](.github/PULL_REQUEST_TEMPLATE.md)
- [`.github/MILESTONE_TEMPLATE.md`](.github/MILESTONE_TEMPLATE.md)

---

## 👥 Comment contribuer
1. Choisis une issue de rédaction
2. Crée une branche `feature/nom-de-la-section`
3. Rédige → commit → ouvre une PR avec `Fixes #XX`
4. Un relecteur sera assigné et des corrections pourront être proposées

Consulte le fichier **[CONTRIBUTING.md](CONTRIBUTING.md)** pour les règles détaillées de rédaction, relecture, correction et conventions LaTeX.

---

## 🗺️ Roadmap & statut éditorial
Le suivi complet est disponible dans :
- Le dossier [`site/`](site/)
- Les **[Milestones](https://github.com/hervetchoffo/measure-dynamics-book/milestones)**

---

## 📜 Licence
- **Code source LaTeX + templates** : licence **MIT** (voir [LICENSE](LICENSE))
- **Livre compilé (PDF)** : licence **Creative Commons CC BY-SA 4.0** (voir [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/))

---

## 📬 Contact & discussions
- **Discussions GitHub** (recommandé pour toutes les questions)
- Ouvert à toute proposition d’amélioration ou de co-auteur

---

**Merci à tous les contributeurs !** 🚀
EOF

# 16.7. Génération du fichier CONTRIBUTING.md
echo "📝 Génération du fichier CONTRIBUTING ..."
cat <<'EOF' > CONTRIBUTING.md
# 👥 Comment contribuer au projet

Merci de votre intérêt pour **Théorie de la mesure et systèmes dynamiques** !
Ce document explique comment participer efficacement au projet.

---
## 📋 Sommaire
- [Avant de commencer](#-avant-de-commencer)
- [Utiliser les templates](#%EF%B8%8F-utiliser-les-templates)
- [Processus de contribution](#-processus-de-contribution)
- [Règles LaTeX](#-règles-latex)
- [Conventions de nommage](#-conventions-de-nommage)
- [Relecture et validation](#-relecture-et-validation)
- [Licence](#-licence)

---
## 📝 Avant de commencer

1. Lisez le [`README.md`](README.md)
2. Consultez les **[Milestones](https://github.com/hervetchoffo/measure-dynamics-test/milestones)** en cours
3. Vérifiez qu’il n’existe pas déjà une issue pour votre idée

---
## 🛠️ Utiliser les templates

Nous utilisons des templates structurés pour garder le projet organisé :

- **Milestone** → `.github/MILESTONE_TEMPLATE.md`
- **Rédaction / Relecture / Correction** → `.github/ISSUE_TEMPLATE/`
- **Pull Request** → `.github/PULL_REQUEST_TEMPLATE.md`

**Toujours** créer :
- un `milestone` pour planifier l'arrivée d'une nouvelle version du livre.
- une `issue` avant de commencer à coder.
- une `Pull Request` pour demander la relecture, la validation et l'intégration de code.

---
## 🚀 Processus de contribution

1. **Choisissez ou créez une issue** (avec le template approprié)
2. **Créez une branche** (voir [conventions de nommage](#branches)):
   ```bash
   git checkout -b nom-de-ma-branche
   ```
3. **Développez** votre code
4. **Committez** avec des messages clairs (voir [conventions de nommage](#commits))
5. **Poussez** et ouvrez une **Pull Request** (voir [conventions de nommage](#pull-requests))
6. **Attendez la relecture**

---
## 📖 Règles LaTeX

- Utilisez toujours les macros définies dans `preamble/`
- Indentez correctement et commentez les parties complexes
- Évitez les commandes obsolètes (`\it`, `\bf`, etc.)
- Respectez les conventions de nommage des fichiers LaTeX (voir [conventions de nommage](#code-latex))

---
## 📌 Conventions de nommage

### Code LaTeX

1. **Principes généraux**
  - Approche REST-like pour représenter les ressources LaTeX (`chapter`, `section`, `subsection`, `subsubsection`)
  - Arborescence modulaire et hiérarchique grâce à la commande LaTeX `\input{...}` avec des **chemins complets** depuis la racine
  - Style de nommage : kebab-case (tirets), minuscules, pas d’espaces, pas d’accents dans les noms de fichiers/dossiers
2. **Nommage des dossiers**
  - Chapitres : NN-nom-du-chapitre placé sous le dossier `chapters` avec `NN-` préfixe d’ordre numérique  (ex. `chapters/02-techniques-construction`) 
  - Sections : NN-nom-de-la-section placé sous un dossier `sections` (ex. `chapters/02-techniques-construction/sections/02-riesz-markov`)
  - Sous‑sections (resp. Sous-sous-section): NN-nom-de-la-sous-section placé sous un dossier `subs` de section (resp. sous-section)
  - Appendices : A-nom, B-nom, … (lettres pour distinguer des chapitres) et placé sous le dossier `appendices`
3. **Nommage des fichiers**
  - Chapitre : chapter.tex (dans chapters/NN-nom-du-chapitre/)
  - Section : section.tex (dans chapters/.../sections/NN-nom-de-la-section/)
  - Sous‑section : sub.tex (dans chapters/.../sections/.../subs/NN-nom-de-la-sous-section/)
  - Sous‑sous-section : sub.tex (dans chapters/.../sections/.../subs/.../subs/NN-nom-de-la-sous-sous-section/)
  - Appendice : appendix.tex (dans appendices/A-nom/)
4. **Arborescence expliquée (extrait commenté)**
```
chapters/
└─ 02-techniques-construction/
   ├─ chapter.tex                # contient \input{chapters/02-.../sections/.../section}
   └─ sections/
      ├─ 02-riesz-markov/
      │  ├─ section.tex          # contient \input{chapters/02-.../sections/02-.../subs/.../sub}
      │  └─ subs/
      │     ├─ 01-integration/
      │     |  └─ sub.tex
      │     ├─ 02-lp/
      │     |  └─ sub.tex
      │     └─ 03-riesz-markov/
      │        └─ sub.tex
      └─ 03-produit-desintegration/
         └─ section.tex
```
5. **Exemple de code LaTeX (section 2.2)**
```latex
\section{Représentation de Riesz–Markov}

\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/01-integration/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/02-lp/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/03-riesz-markov/sub}
```

### Branches

1. **Principes généraux**
  - But : rendre les branches lisibles, traçables et liées à une unité logique du dépôt (chapitre, section, sous‑section, sous-sous-section, annexe)
  - Format : `<type>/<scope>/<short-description>` ou `<type>/<scope>` (resp. `<type>/<short-description>`) si description (resp. scope) non nécessaire
  - Style : kebab-case pour le `scope` et la `short-description`, pas d’accents, pas d’espaces, minuscules
2. **Types recommandés**
  - release : préparation à la publication d'une version du livre
  - feature : ajout de contenu (nouvelle annexe, chapitre, section, sous‑section, sous-sous-section)
  - fix : correction de contenu
  - refactor : réorganisation du code LaTeX sans changement de contenu
  - docs : modifications de la documentation (README, CONTRIBUTING)
  - chore : tâches d’infrastructure (templates, workflows, préambule, site web)
3. **Bonnes pratiques**
  - Scope obligatoire pour éditer ou corriger du contenu : inclure le chemin logique NN-nom du chapitre (ou d'annexe) puis, si pertinent, NN-nom de la section, de la sous‑section et de la sous-sous-section (ex. `feature/02-techniques-construction/02-riesz-markov/01-integration`)
  - Longueur : garder la branche < 80 caractères si possible avec une description courte de 3 à 6 mots, explicite (ex. ajout-exemples, typo-theoreme, mise-a-jour-biblio)
  - Ticket lié : si une issue existe, préfixer la description par le numéro `issue-NN` ou ajouter `-issue-NN` à la fin (ex. `fix/01-espaces-mesures/03-classe-monotone/issue-123-typo-theoreme`)
4. **Exemples**
  - `release/v1.1.0-rc.1`
  - `feature/02-techniques-construction/02-riesz-markov/01-integration`
  - `fix/01-espaces-mesures/03-classe-monotone/issue-123-typo-theoreme`
  - `refactor/chapters-structure/move-sections-to-subs`
  - `docs/contributing-update`
  - `chore/preamble-macros-cleanup`

### Commits

1. **Format des messages**
  - Style `Conventional Commits`
  - Format message de commit simple: `<type>(<scope>): <description>`
  - Format message de commit multi-lignes: 
    - ligne 1) `Court résumé` (impératif, ≤50 chars): `<type>(<scope>): <short-description>`
    - ligne 2) Ligne vide
    - ligne 3) `Corps explicatif` (optionnel, explications détaillées; wrap à 72 chars)
    - ligne 4) Ligne vide
    - ligne 5) `Footer` (optionnel): `Fixes #NN`, `Refs: #NN`, `BREAKING CHANGE: <description>`
  - Règles clés: sujet en **impératif présent**, court (≈50 caractères), scope optionnel, corps explicatif si nécessaire, footer pour référencer des issues ou indiquer des breaking changes si nécessaire
2. **Types recommandés**
  - feat : ajout de contenu (nouvelle annexe, chapitre, section, sous‑section, sous-sous-section)
  - fix : correction de contenu
  - refactor : réorganisation du code LaTeX sans changement de contenu
  - docs : modifications de la documentation (README, CONTRIBUTING)
  - chore : tâches d’infrastructure (templates, workflows, préambule, site web)
3. **Bonnes pratiques**
  - Un changement logique par commit (atomicité)
  - Utilisez le scope pour indiquer intro/chapitre/annexe/biblio/fichier/composant
  - Utilisez le footer pour référencer l'issue: `Fixes #NN` pour fermer, `Refs: #NN` pour lier
4. **Commandes utiles**
```bash
git commit -m "<type>(<scope>): <description>" # ceci est un commit simple
git commit -m "<type>(<scope>): <short-description>" -m "<body>" -m "<footer>" #ceci est un commit multi-lignes
git commit -F - <<'COMMIT' #ceci aussi est un commit multi-lignes (heredoc)
<type>(<scope>): <short-description>

<body>

<footer>
COMMIT
git commit -m $'<type>(<scope>): <short-description>\n\n<body>\n\n<footer>' #ceci est un autre commit multi-lignes (saut de ligne)
```
5. **Exemples**
```bash
git commit -m "feat(annexe-a): ajouter section sur méthodes numériques"
git commit -m "fix(chapitre-02): corriger typo lemme 2.3"
git commit -m "fix(chapitre-02): corriger typo lemme 2.3" -m "Correction d'une faute dans l'énoncé; ajustement mineur de la démonstration." -m "Refs: #123"
git commit -F - <<'COMMIT'
fix(chapitre-02): corriger typo lemme 2.3

Correction détaillée...

Fixes #312
COMMIT
git commit -m $'fix(chapitre-02): corriger typo lemme 2.3\n\nCorrection détaillée...\n\nFixes #231'
git commit -m "refactor(preamble): regrouper macros de mise en page"
git commit -m "docs(CONTRIBUTING): ajouter bonnes pratiques de commit"
git commit -m "chore(ci): ajouter job latexmk pour PR"
```

### Pull Requests

- Titre clair : `Section 3.2 – Théorème ergodique`
- Description remplie avec le template
- Doit contenir `Fixes #XX` ou `Closes #XX`

**Checklist avant PR** :
- Compilation locale réussie (`make pdf`)
- Pas de warning LaTeX
- Bibliographie à jour (`biber`)
- Respect des conventions de style du projet

### Releases

1. **Numéros de versions**

   Le versionnage du livre suit une logique SemVer `MAJOR.MINOR.PATCH[-STATUS]` avec la transposition `MAJOR`/`MINOR`/`PATCH`/`STATUS` qui suit :

   | SemVer | Équivalent éditorial | Exemple |
   |--------|----------------------|---------|
   | MAJOR | Édition du livre (refonte, réorganisation profonde) | `v2.0.0` = 2ème édition |
   | MINOR | Ajout d'un chapitre ou d'une section | `v1.3.0` = nouveau chapitre |
   | PATCH | Correction d'erreur, faute, reformulation mineure | `v1.3.1` = errata |
   | STATUS | État éditorial du livre | `v1.1.0-rc.2` = 2ème version candidate à publication |

2. **Cycles éditoriaux**

  - Les cycles d'édition sont courts afin d'obtenir des `feedbacks` réguliers de la part des relecteurs.
  - Le processus d'édition est allégé par la suppression des phases de pré-release `alpha` et `beta`: passage direct en `RC`.
  - Une ou deux (tout au plus) `RC` sont suffisantes pour la publication d'une version stable de l'ouvrage.
  - Chaque version stable du livre doit correspondre à des sections entièrement rédigées, relues et cohérentes.
  - Certaines sections présentes dans la table des matières peuvent ne pas encore avoir été rédigées dans une version stable du livre.
  - Une version dont le champs `STATUS` vaut `-final` exprime le fait que le livre est entièrement rédigé et prêt pour archivage.

3. **Exemple de scénario éditorial (1ère édition)**

   | Version | Statut | Description |
   |---------|--------|-------------|
   | `v1.1.0-rc.1` | 🔄 RC | Premier candidat (chapitre 1 complet) |
   | `v1.1.0-rc.2` | 🔄 RC | Corrections signalées par des lecteurs |
   | `v1.1.0` | ✅ Stable | 1ère version stable publiée |
   | `v1.1.1-rc.1` | 🔄 RC | Corrections signalées par des lecteurs |
   | `v1.1.1` | ✅ Stable | Errata publié |
   | `v1.2.0-rc.1` | 🔄 RC | Candidat (section 2.2 ajoutée) |
   | `v1.2.0` | ✅ Stable | 2ème version stable publiée |
   | ... | ... | ... |
   | `v1.10.0-final` | 🏁 Final | Livre complet, 1ère édition archivée |

4. **Exemple de scénario éditorial (1ère version)**

```
branches de travail: feature/*
  └─► sections rédigées et cohérentes
        └─► branche de release: release/v1.1.0-rc.1   ← relectures et intégrations (PR release/v1.1.0-rc.1 ← feature/*)
              └─► branche stable: main   ← relecture globale et intégration ✓ (PR main ← release/v1.1.0-rc.1)
                    └─► branche stable: main   ← RC publiée (tag v1.1.0-rc.1)
                          └─► corrections d'erreurs signalées par des lecteurs (PR main ← release/v1.1.0-rc.2 ← fix/*)
                                └─► branche stable: main   ← nouvelle RC publiée (tag v1.1.0-rc.2)
                                      └─► branche stable: main   ← release stable publiée (tag v1.1.0)

corrections d'erreurs signalées par des lecteurs (PR main ← release/v1.1.1-rc.1 ← fix/*)
  └─► branche stable: main   ← nouvelle RC publiée (tag v1.1.1-rc.1)
        └─► branche stable: main   ← errata publié (tag v1.1.1)
```

```mermaid
gitGraph
   commit id: "init"
   branch "feature/*"
   checkout "feature/*"
   commit id: "rédaction sections"
   branch "release/v1.1.0-rc.1"
   checkout "release/v1.1.0-rc.1"
   commit id: "relectures & intégrations"
   checkout main
   merge "release/v1.1.0-rc.1" tag: "v1.1.0-rc.1"
   branch "fix/*"
   checkout "fix/*"
   commit id: "corrections lecteurs"
   checkout main
   branch "release/v1.1.0-rc.2"
   checkout "release/v1.1.0-rc.2"
   merge "fix/*"
   checkout main
   merge "release/v1.1.0-rc.2" tag: "v1.1.0-rc.2"
   commit id: "release stable" tag: "v1.1.0"
   branch "fix/errata"
   checkout "fix/errata"
   commit id: "corrections errata"
   checkout main
   branch "release/v1.1.1-rc.1"
   checkout "release/v1.1.1-rc.1"
   merge "fix/errata"
   checkout main
   merge "release/v1.1.1-rc.1" tag: "v1.1.1-rc.1"
   commit id: "errata publié" tag: "v1.1.1"
```

---
## 👀 Relecture et validation

- Vous pouvez demander une relecture en commentant la PR (avec une `issue` de relecture) et un ou plusieurs relecteurs seront assignés
- Les corrections se font en pushant sur la même branche
- Une PR est mergée seulement après approbation + compilation OK

---
## 📜 Licence

- **Code source et templates** : MIT (vous pouvez réutiliser librement)
- **Contenu du livre (PDF)** : CC BY-SA 4.0 (attribution obligatoire)

En contribuant, vous acceptez ces licences.

---
**Merci pour votre contribution !**
Chaque section, correction ou idée compte. 🚀

N’hésitez pas à poser vos questions dans les **Discussions GitHub**.
EOF

# 17. Premier Commit
echo "📦 Premier commit..."
git add .
git commit -m "feat(init_project): initialisation du dépôt projet"

echo "✅ Projet initialisé avec succès."
