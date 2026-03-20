# 👥 Comment contribuer au projet

Merci de votre intérêt pour **Théorie de la mesure et systèmes dynamiques** !
Ce document explique comment participer efficacement au projet.

---
## 📋 Sommaire
- [Avant de commencer](#avant-de-commencer)
- [Utiliser les templates](#utiliser-les-templates)
- [Processus de contribution](#processus-de-contribution)
- [Conventions de nommage](#conventions-de-nommage)
- [Règles LaTeX](#règles-latex)
- [Relecture et validation](#relecture-et-validation)
- [Licence](#licence)

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
- Titre clair : `[Rédaction] Section 3.2 – Théorème ergodique`
- Description remplie avec le template
- Doit contenir `Fixes #XX` ou `Closes #XX`

---
## 📖 Règles LaTeX

- Utilisez toujours les macros définies dans `preamble/`
- Un fichier par chapitre/sous-section quand c’est possible
- Nommez les fichiers en kebab-case : `chapitre-3-systemes-dynamiques.tex`
- Indentez correctement et commentez les parties complexes
- Évitez les commandes obsolètes (`\it`, `\bf`, etc.)

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
