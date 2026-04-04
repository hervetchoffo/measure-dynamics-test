# 👥 Comment contribuer au projet

Merci de votre intérêt pour **Théorie de la mesure et systèmes dynamiques** !
Ce document explique comment participer efficacement au projet.

---
## 📋 Sommaire
- [Avant de commencer](#-avant-de-commencer)
- [Utiliser les templates](#%EF%B8%8F-utiliser-les-templates)
- [Processus de contribution](#-processus-de-contribution)
- [Conventions de nommage](#-conventions-de-nommage)
- [Règles LaTeX](#-règles-latex)
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

- **Rédaction / Relecture / Correction** → `.github/ISSUE_TEMPLATE/`
- **Pull Request** → `.github/PULL_REQUEST_TEMPLATE.md`
- **Milestone** → `.github/MILESTONE_TEMPLATE.md`

**Toujours** créer une issue avant de commencer à coder.

---
## 🚀 Processus de contribution

1. **Choisissez ou créez une issue** (avec le template "Rédaction")
2. **Créez une branche** :
   ```bash
   git checkout -b feature/nom-de-la-section
   ```
3. **Développez** votre section
4. **Committez** avec des messages clairs (voir conventions ci-dessous)
5. **Poussez** et ouvrez une **Pull Request** (elle doit contenir `Fixes #XX`)
6. **Attendez la relecture**

---
## 📌 Conventions de nommage

### Arborescence du code LaTeX
- Une arborescence modulaire et hiérarchique du code LaTeX pour faciliter son édition

```bash
.
├── main.tex
│
├── preamble
│   ├── macros.tex
│   ├── packages.tex
│   ├── theoremstyle.tex
│   └── layout.tex
│
├── frontmatter
│   ├── titlepage.tex
│   └── introduction
│       └── introduction.tex
│
├── chapters
│   ├── 01-espaces-mesures
│   │   ├── chapter.tex
│   │   └── sections
│   │       ├── 01-espaces-mesurables
│   │       │   └── section.tex
│   │       ├── 02-mesures-images
│   │       │   └── section.tex
│   │       ├── 03-classe-monotone
│   │       │   └── section.tex
│   │       ├── 04-espaces-standards
│   │       │   └── section.tex
│   │       └── 05-pathologies
│   │           └── section.tex
│   │
│   ├── 02-techniques-construction
│   │   ├── chapter.tex
│   │   └── sections
│   │       ├── 01-caratheodory
│   │       │   └── section.tex
│   │       ├── 02-riesz-markov
│   │       │   ├── section.tex
│   │       │   └── subs
│   │       │       ├── 01-integration
│   │       │       │   └── sub.tex
│   │       │       ├── 02-lp
│   │       │       │   └── sub.tex
│   │       │       └── 03-riesz-markov
│   │       │           └── sub.tex
│   │       └── 03-produit-desintegration
│   │           ├── section.tex
│   │           └── subs
│   │               ├── 01-produit-fini
│   │               │   └── sub.tex
│   │               ├── 02-kolmogorov
│   │               │   └── sub.tex
│   │               └── 03-rokhlin
│   │                   └── sub.tex
│   │
│   └── 03-theorie-ergodique
│       ├── chapter.tex
│       └── sections
│           ├── 01-dynamique-ergodique
│           │   ├── section.tex
│           │   └── subs
│           │       ├── 01-ergodicite
│           │       │   └── sub.tex
│           │       └── 02-decomposition
│           │           └── sub.tex
│           ├── 02-convergence-ergodique
│           │   ├── section.tex
│           │   └── subs
│           │       ├── 01-von-neumann
│           │       │   └── sub.tex
│           │       ├── 02-maximal
│           │       │   └── sub.tex
│           │       ├── 03-birkhoff
│           │       │   └── sub.tex
│           │       └── 04-folner
│           │           └── sub.tex
│           └── 03-applications
│               ├── section.tex
│               └── subs
│                   ├── 01-nombres
│                   │   └── sub.tex
│                   ├── 02-information
│                   │   └── sub.tex
│                   ├── 03-jeux
│                   │   └── sub.tex
│                   └── 04-ia
│                       └── sub.tex
│
├── appendices
│   ├── A-axiome-choix/
│   │   └── appendix.tex
│   ├── B-quotient/
│   │   └── appendix.tex
│   ├── C-galois-poincare/
│   │   └── appendix.tex
│   ├── D-riemann-lebesgue/
│   │   └── appendix.tex
│   ├── E-leibniz-schwartz/
│   │   └── appendix.tex
│   └── F-fonctions-elementaires/
│       └── appendix.tex
│
└── bibliography
    ├── bibliography.tex
    └── references.bib
```

### Branches
- `feature/nom-court-de-la-section`
- `fix/bug-xxx`
- `doc/amélioration-readme`

### Commits (style Conventional Commits)
```bash
feat: rédaction de la section 3.2
fix: correction du théorème 4.1
docs: mise à jour du README
chore: mise à jour du template
```

### Pull Requests
- Titre clair : `Section 3.2 – Théorème ergodique`
- Description remplie avec le template
- Doit contenir `Fixes #XX` ou `Closes #XX`

---
## 📖 Règles LaTeX

- Utilisez toujours les macros définies dans `preamble/`
- Indentez correctement et commentez les parties complexes
- Évitez les commandes obsolètes (`\it`, `\bf`, etc.)
- Utilisez 1 fichier & 1 dossier par annexe, chapitre, section ou sous-section quand c'est possible
- Les fichiers LaTeX s'appellent toujours `appendix.tex`, `chapter.tex`, `section.tex` ou `sub.tex`
- Les dossiers portent les noms des annexes, chapitres, sections ou sous-sections correspondantes
- Nommez les dossiers en kebab-case : `02-techniques-construction`
- Utilisez la commande LaTeX `input{...}` pour rendre le code modulaire : pour la `section 2.2`, on peut par exemple éditer le fichier `chapters/02-techniques-construction/sections/02-riesz-markov/section.tex` comme suit :
```latex
\section{Représentation de Riesz–Markov}

\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/01-integration/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/02-lp/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/03-riesz-markov/sub}
```

**Checklist avant PR** :
- [ ] Compilation locale réussie (`make pdf`)
- [ ] Pas de warning LaTeX
- [ ] Bibliographie à jour (`biber`)
- [ ] Respect des conventions de style du projet

---
## 👀 Relecture et validation

- Vous pouvez demander une relecture en commentant la PR et un relecteur sera assigné
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
