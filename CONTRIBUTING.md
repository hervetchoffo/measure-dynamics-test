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
## 📖 Règles LaTeX

- Utilisez toujours les macros définies dans `preamble/`
- Indentez correctement et commentez les parties complexes
- Évitez les commandes obsolètes (`\it`, `\bf`, etc.)
- Utilisez une approche REST-like de représentation des ressources LaTeX (`chapter`, `section`, `subsection`, `subsubsection`)
- Utilisez une arborescence modulaire et hiérarchique grâce à la commande LaTeX `\input{...}` avec des **chemins complets** depuis la racine
- Utilisez le nommage des dossiers qui suit :
  - Chapitres : NN-nom-du-chapitre (ex. 02-techniques-construction) avec `NN-` préfixe numérique d’ordre.
  - Sections : NN-nom-de-la-section (ex. 02-riesz-markov)
  - Sous‑sections (resp. Sous-sous-section): placées dans subs/NN-nom sous la section (resp. sous-section)
  - Appendices : A-nom, B-nom, … (lettres pour distinguer des chapitres)
- Utilisez le nommage des fichiers qui suit :
  - Chapitre : chapter.tex (dans chapters/NN-nom/)
  - Section : section.tex (dans chapters/NN-nom/sections/NN-nom/)
  - Sous‑section : sub.tex (dans chapters/.../sections/.../subs/NN-nom/)
  - Sous‑sous-section : sub.tex (dans chapters/.../sections/.../subs/.../subs/NN-nom/)
  - Appendice : appendix.tex (dans appendices/A-nom/)
- Style de nommage : kebab-case (tirets), minuscules, pas d’espaces, pas d’accents dans les noms de fichiers/dossiers.

**Arborescence expliquée (extrait commenté)**
```bash
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

**Exemple de code LaTeX (section 2.2)**
```latex
\section{Représentation de Riesz–Markov}

\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/01-integration/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/02-lp/sub}
\input{chapters/02-techniques-construction/sections/02-riesz-markov/subs/03-riesz-markov/sub}
```

---
## 📌 Conventions de nommage

### Branches

1. **Principes généraux**
  - But : rendre les branches lisibles, traçables et liées à une unité logique du dépôt (chapitre, section, sous‑section, sous-sous-section, appendice)
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
  - `release/v0.1.0-alpha`
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
  - Utilisez le scope pour indiquer chapitre/fichier/composant
  - Utilisez le footer pour référencer l'issue: Fixes #NN pour fermer, Refs: #NN pour lier
4. **Commandes utiles**
```bash
git commit -m "<type>(<scope>): <description>" # ceci est un commit simple
git commit -m "<type>(<scope>): <short-description>" -m "<body>" -m "<footer>" #ceci est un commit multi-lignes
git commit -m $'<type>(<scope>): <short-description>\n\n<body>\n\n<footer>' #ceci aussi est un commit multi-lignes
```
5. **Exemples**
```bash
git commit -m "feat(annexe-a): ajouter section sur méthodes numériques"
git commit -m "fix(chapitre-02): corriger typo lemme 2.3"
git commit -m "fix(chapitre-02): corriger typo lemme 2.3" -m "Correction d'une faute dans l'énoncé; ajustement mineur de la démonstration." -m "Refs: #123"
git commit -m $'fix(chapitre-02): corriger typo lemme 2.3\n\nCorrection détaillée...\n\nFixes #321'
git commit -m "refactor(preamble): regrouper macros de mise en page"
git commit -m "docs(contributing): ajouter bonnes pratiques de commit"
git commit -m "chore(ci): ajouter job latexmk pour PR"
```

### Pull Requests
- Titre clair : `Section 3.2 – Théorème ergodique`
- Description remplie avec le template
- Doit contenir `Fixes #XX` ou `Closes #XX`

---
## 👀 Relecture et validation

**Checklist avant PR** :
- [ ] Compilation locale réussie (`make pdf`)
- [ ] Pas de warning LaTeX
- [ ] Bibliographie à jour (`biber`)
- [ ] Respect des conventions de style du projet

**Workflow recommandé**
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
