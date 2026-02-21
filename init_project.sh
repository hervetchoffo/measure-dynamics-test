#!/bin/bash

# ==============================================================================
# Script d'initialisation : Projet LaTeX "Measure & Dynamics"
# Configuration : Linux Mint / VS Code / Git
# ==============================================================================
# 1. Environnement d'exécution du script
set -e # Arrêter le script en cas d'erreur

# 2. Création du dossier projet
PROJECT=measure-dynamics-book

# On vérifie si on est déjà dans le dossier pour éviter de boucler
if [ "$(basename "$PWD")" = "$PROJECT" ]; then
    echo "⚠️ Déjà dans le dossier projet."
else
    if [ -d "$PROJECT" ]; then
        echo "❌ Le dossier $PROJECT existe déjà. Arrêt par sécurité."
        exit 1
    fi
    mkdir -p $PROJECT
    cd $PROJECT
fi

# 3. Initialisation Git et .gitignore
echo "📁 Configuration de Git..."
git init -q # initialisation
git branch -M main # vérification qu'il s'agit bien la branche s'appelle bien 'main' (standard GitHub actuel)
git remote add origin https://github.com/hervetchoffo/measure-dynamics-book.git # ajout de l'adresse du dépôt distant
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
*.blg
*.bcf
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

# 4. Création de l'arborescence complète
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
  .github/workflows \
  site

touch main.tex README.md

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
mkdir -p chapters/chapter1_espaces_mesures/section1{A_espaces_mesurables,B_mesures_images,C_classe_monotone,D_espaces_standards,E_pathologies}

touch chapters/chapter1_espaces_mesures/chapter1.tex
touch chapters/chapter1_espaces_mesures/section1{A_espaces_mesurables/section1A,B_mesures_images/section1B,C_classe_monotone/section1C,D_espaces_standards/section1D,E_pathologies/section1E}.tex

# -----------------------
# Chapitre 2
# -----------------------
mkdir -p chapters/chapter2_construction_mesures/{section2A_caratheodory,section2B_riesz_markov/{part2B1_integration,part2B2_Lp,part2B3_riesz_markov},section2C_produit_desintegration/{part2C1_produit,part2C2_kolmogorov,part2C3_rokhlin}}

touch chapters/chapter2_construction_mesures/chapter2.tex
touch chapters/chapter2_construction_mesures/section2A_caratheodory/section2A.tex
touch chapters/chapter2_construction_mesures/section2B_riesz_markov/{section2B,part2B1_integration/part2B1,part2B2_Lp/part2B2,part2B3_riesz_markov/part2B3}.tex
touch chapters/chapter2_construction_mesures/section2C_produit_desintegration/{section2C,part2C1_produit/part2C1,part2C2_kolmogorov/part2C2,part2C3_rokhlin/part2C3}.tex

# -----------------------
# Chapitre 3
# -----------------------
mkdir -p chapters/chapter3_theorie_ergodique/{section3A_dynamique/{part3A1_ergodicite,part3A2_decomposition},section3B_convergence/{part3B1_von_neumann,part3B2_maximal,part3B3_birkhoff,part3B4_folner},section3C_applications/{part3C1_nombres,part3C2_information,part3C3_jeux,part3C4_IA}}

touch chapters/chapter3_theorie_ergodique/chapter3.tex
touch chapters/chapter3_theorie_ergodique/section3A_dynamique/{section3A,part3A1_ergodicite/part3A1,part3A2_decomposition/part3A2}.tex
touch chapters/chapter3_theorie_ergodique/section3B_convergence/{section3B,part3B1_von_neumann/part3B1,part3B2_maximal/part3B2,part3B3_birkhoff/part3B3,part3B4_folner/part3B4}.tex
touch chapters/chapter3_theorie_ergodique/section3C_applications/{section3C,part3C1_nombres/part3C1,part3C2_information/part3C2,part3C3_jeux/part3C3,part3C4_IA/part3C4}.tex

# -----------------------
# Appendices
# -----------------------
mkdir -p appendices/appendix{A_axiome_choix,B_quotient,C_galois_poincare,D_riemann_lebesgue,E_leibniz_schwartz,F_fonctions_elementaires}

touch appendices/appendix{A_axiome_choix/appendixA,B_quotient/appendixB,C_galois_poincare/appendixC,D_riemann_lebesgue/appendixD,E_leibniz_schwartz/appendixE,F_fonctions_elementaires/appendixF}.tex

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

# 5. Génération du fichier main.tex
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

\input{chapters/chapter1_espaces_mesures/chapter1}
\input{chapters/chapter2_construction_mesures/chapter2}
\input{chapters/chapter3_theorie_ergodique/chapter3}

% ========================
% Appendices
% ========================
\appendix
\input{appendices/appendixA_axiome_choix/appendixA}
\input{appendices/appendixB_quotient/appendixB}
\input{appendices/appendixC_galois_poincare/appendixC}
\input{appendices/appendixD_riemann_lebesgue/appendixD}
\input{appendices/appendixE_leibniz_schwartz/appendixE}
\input{appendices/appendixF_fonctions_elementaires/appendixF}

% ========================
% Bibliography
% ========================
\backmatter
\nocite{*} % <--- Force l'affichage de TOUTES les entrées du fichier .bib
\input{bibliography/bibliography}

\end{document}
EOF

# 6. Génération du fichier packages.tex
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

# 7. Génération du fichier theoremstyle.tex
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

# 8. Génération du fichier layout.tex
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

# 9. Génération du fichier macros.tex
echo "📝 Génération du fichier macros.tex..."
cat <<'EOF' > preamble/macros.tex
% ==================================================
% Métadonnées globales
% ==================================================
\newcommand{\BookTitle}{Théorie de la mesure et systèmes dynamiques}
\newcommand{\BookSubtitle}{Fondements, constructions et applications ergodiques}
\newcommand{\BookAuthor}{TCHOFFO SONWA Hervé}
\newcommand{\BookRepository}{https://github.com/hervetchoffo/measure-dynamics-book}
\newcommand{\BookLicense}{Creative Commons BY-NC-SA 4.0}
\newcommand{\BookLicenseUrl}{https://creativecommons.org/licenses/by-nc-sa/4.0/}

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

# 10. Génération du fichier titlepage.tex
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

# 11. Génération du fichier introduction.tex
echo "📝 Génération du fichier introduction.tex..."
cat <<'EOF' > frontmatter/introduction/introduction.tex
\starredchapter{Introduction}

Ce livre est consacré à la théorie de la mesure et à ses interactions profondes avec les systèmes dynamiques et la théorie ergodique.
EOF

# 12. Génération du fichier bibliography.tex
echo "📝 Génération du fichier bibliography.tex..."
cat <<'EOF' > bibliography/bibliography.tex
\starredchapter{Bibliographie}

\printbibliography[heading=none]
EOF

# 13. Initialisation du fichier references.bib
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

# 14. Initialisation des chapitres et des annexes
echo "📝 Initialisation des chapitres et des annexes..."
echo "\chapter{Espaces mesurés}" > chapters/chapter1_espaces_mesures/chapter1.tex
echo "\chapter{Techniques de construction des mesures}" > chapters/chapter2_construction_mesures/chapter2.tex
echo "\chapter{Théorie ergodique et applications}" > chapters/chapter3_theorie_ergodique/chapter3.tex
echo "\chapter{L’omniprésence de l’axiome du choix}" > appendices/appendixA_axiome_choix/appendixA.tex
echo "\chapter{L'omniprésence du quotient}" > appendices/appendixB_quotient/appendixB.tex
echo "\chapter{De Galois à Poincaré}" > appendices/appendixC_galois_poincare/appendixC.tex
echo "\chapter{De Riemann à Lebesgue}" > appendices/appendixD_riemann_lebesgue/appendixD.tex
echo "\chapter{De Leibniz à Schwartz}" > appendices/appendixE_leibniz_schwartz/appendixE.tex
echo "\chapter{Les fonctions élémentaires}" > appendices/appendixF_fonctions_elementaires/appendixF.tex

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
  build-pdf:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Injection des métadonnées (version.tex)
        run: |
          echo "\\newcommand{\\BookVersion}{working-copy}" > version.tex
          echo "\\newcommand{\\BookBranch}{${GITHUB_REF_NAME}}" >> version.tex
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

      - name: Upload PDF artifact
        uses: actions/upload-artifact@v4
        with:
          name: dev-pdf-${{ github.ref_name }}-${{ github.run_id }}
          path: main.pdf

  cleanup-artifacts:
    needs: build-pdf  # Attend que le job build-pdf soit terminé
    runs-on: ubuntu-latest
    permissions: 
      actions: write 
      contents: read
    steps:
      - name: Delete old artifacts (only from this workflow)
        uses: actions/github-script@v6
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          script: |
            const { data: artifacts } = await github.rest.actions.listArtifactsForRepo({
              owner: context.repo.owner,
              repo: context.repo.repo,
            });

            console.log(`Found ${artifacts.artifacts.length} total artifacts.`);

            const devArtifacts = artifacts.artifacts
              .filter(artifact => artifact.name.startsWith('dev-pdf-'))
              .sort((a, b) => new Date(b.created_at) - new Date(a.created_at))
              .slice(5);

            console.log(`Filtering to ${devArtifacts.length} dev-pdf-* artifacts (retaining no more than the 5 most recent ones).`);

            for (const artifact of devArtifacts) {
              try {
                await github.rest.actions.deleteArtifact({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  artifact_id: artifact.id,
                });
                console.log(`Deleted artifact ${artifact.name} (ID: ${artifact.id})`);
              } catch (error) {
                console.log(`Failed to delete artifact ${artifact.name}: ${error.message}`);
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
        run: |
          echo "\\newcommand{\\BookVersion}{review-copy}" > version.tex
          echo "\\newcommand{\\BookBranch}{${{ github.head_ref }}}" >> version.tex
          echo "\\newcommand{\\BookCommit}{${{ env.CURRENT_COMMIT }}}" >> version.tex
          echo "\\newcommand{\\BookDate}{$(date +'%d/%m/%Y')}" >> version.tex
          echo "\\newcommand{\\BookStatus}{Version de relecture}" >> version.tex
          echo "\\newcommand{\\BookDisclaimer}{Cet ouvrage est en cours de rédaction et peut contenir des erreurs.}" >> version.tex

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

      - name: Upload PDF artifact
        uses: actions/upload-artifact@v4
        with:
          name: review-pdf-${{ github.head_ref }}-${{ github.run_id }}
          path: main.pdf

      - name: Notify reviewers
        uses: actions/github-script@v7
        with:
          script: |
            const run_id = context.runId;
            const pull_number = context.issue.number;
            const repo_url = `https://github.com/${context.repo.owner}/${context.repo.repo}`;
            const artifact_url = `${repo_url}/actions/runs/${run_id}`;
            
            const body = `
            📄 **Nouveau PDF disponible pour relecture**
            - **Branche** : \`${{ github.head_ref }}\`
            - **Commit** : \`${{ env.CURRENT_COMMIT }}\`
            - **Statut** : Version de relecture

            📥 **[Télécharger le PDF ici](${artifact_url})**
            *(Allez en bas de la page dans la section "Artifacts")*

            Merci de faire une relecture de ce document et de laisser vos commentaires ici!

            ---
            ### Checklist pour la relecture :
            - [ ] Vérifier la cohérence des notations
            - [ ] Valider les démonstrations
            - [ ] Corriger les fautes de français/typos
            - [ ] S'assurer que les références sont correctes
            `;

            await github.rest.issues.createComment({
              issue_number: pull_number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: body.trim()
            });
EOF

# 16. Premier Commit
git add .
git commit -m "Initialisation de la structure projet"

echo "✅ Projet initialisé avec succès."

