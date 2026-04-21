# 📘 Théorie de la mesure et systèmes dynamiques

**Un ouvrage de référence sur la théorie de la mesure, les systèmes dynamiques et la théorie ergodique**
avec des applications en théorie des nombres et en théorie de l'information.

[![License (code)](https://img.shields.io/badge/license_code-MIT-blue.svg)](LICENSE)
[![License (book)](https://img.shields.io/badge/license_book-CC_BY--SA_4.0-green.svg)](https://creativecommons.org/licenses/by-sa/4.0/)
[![Dernier commit](https://img.shields.io/github/last-commit/hervetchoffo/measure-dynamics-test)](https://github.com/hervetchoffo/measure-dynamics-test/commits/main)
[![Build Status](https://github.com/hervetchoffo/measure-dynamics-test/actions/workflows/build-release.yml/badge.svg)](https://github.com/hervetchoffo/measure-dynamics-test/releases)

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
git clone https://github.com/hervetchoffo/measure-dynamics-test.git
cd measure-dynamics-test

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
```
measure-dynamics-test/
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
- Les **[Milestones](https://github.com/hervetchoffo/measure-dynamics-test/milestones)**

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
