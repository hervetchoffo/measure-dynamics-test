# PROJECT_CONTEXT.md
# Fichier de contexte inter-sessions — measure-dynamics-book
# Règle : mis à jour à la FIN de chaque conversation, fourni au DÉBUT de la suivante.
# Format : sections STABLES (rarement modifiées) puis sections VOLATILES (mises à jour fréquentes).

---

## [STABLE] Identité du projet

| Champ | Valeur |
|---|---|
| **Nom** | `measure-dynamics-book` |
| **Dépôt de production** | https://github.com/hervetchoffo/measure-dynamics-book |
| **Dépôt de test** | https://github.com/hervetchoffo/measure-dynamics-test |
| **Auteur** | TCHOFFO SONWA Hervé |
| **Sujet** | Théorie de la mesure et systèmes dynamiques (fr) |
| **Sous-titre** | Fondements, constructions et applications ergodiques |
| **Philosophie** | Kaizen / CI-CD : cycles courts, feedbacks réguliers |

---

## [STABLE] Stack technique

| Composant | Choix |
|---|---|
| **Composition** | LaTeX — moteur `pdflatex` + `latexmk` |
| **Bibliographie** | `biblatex` + `biber` (style `alphabetic`) |
| **CI/CD** | GitHub Actions |
| **Action LaTeX** | `xu-cheng/latex-action@v3` |
| **Gestion artefacts** | `actions/upload-artifact@v4` |
| **Scripting releases** | `softprops/action-gh-release@v2` |
| **Scripting GitHub API** | `actions/github-script@v7` |
| **Versionnage** | SemVer adapté à l'édition (voir Conventions) |
| **Licences** | Code LaTeX : MIT / Livre PDF : CC BY-SA 4.0 |

---

## [STABLE] Architecture du dépôt

```
measure-dynamics-book/
├── main.tex                        # Point d'entrée unique
├── preamble/                       # packages.tex · macros.tex · theoremstyle.tex · layout.tex
├── frontmatter/                    # titlepage.tex · introduction/introduction.tex
├── chapters/                       # NN-nom-chapitre/chapter.tex + sections/ + subs/
│   ├── 01-espaces-mesures/
│   ├── 02-techniques-construction/
│   └── 03-theorie-ergodique/
├── appendices/                     # A-nom/appendix.tex … F-nom/appendix.tex
├── bibliography/                   # bibliography.tex · references.bib
├── site/                           # index.md · status.md · roadmap.md · changelog.md · _config.yml
├── version.tex                     # GÉNÉRÉ par CI — ne pas versionner (dans .gitignore)
└── .github/
    ├── ISSUE_TEMPLATE/             # writing_issue.md · review_issue.md · correction_issue.md
    ├── PULL_REQUEST_TEMPLATE.md
    ├── MILESTONE_TEMPLATE.md
    └── workflows/
        ├── build-dev-version.yml   # push sur branche non-main → artefact PDF (rotation 5)
        ├── build-feature-review.yml # PR → PDF + commentaire bot (mis à jour, non dupliqué)
        ├── build-release.yml       # push tag → GitHub Release + PDF nommé
        └── auto-close-issues.yml   # PR mergée → fermeture issues via Fixes/Closes/Resolves
```

---

## [STABLE] Conventions (résumé décisionnel)

### Nommage des fichiers LaTeX
- Style REST-like, kebab-case, sans accents
- Noms canoniques : `chapter.tex` / `section.tex` / `sub.tex`
- Chemins **complets depuis la racine** dans tous les `\input{}`
- Hiérarchie : `chapters/NN-nom/` → `sections/NN-nom/` → `subs/NN-nom/`

### Workflow GitHub (par milestone)
```
Milestone vX.Y.Z — Nom
  └── Issue (1 par cluster/conversation Claude AI)
        └── feature/vX.Y.Z/<description>   ← 1 branche par issue
              └── PR → release/vX.Y.Z-<nom-milestone>
                          └── PR → main → tag vX.Y.Z → Release → Milestone closed
```
- Template d'issue infrastructure : `task_issue.md` (contient le lien discussion Claude AI)
- Template d'issue éditoriale : `writing/review/correction_issue.md`
- Template de milestone : `MILESTONE_TEMPLATE.md` (guide vierge pour créer les milestones sur GitHub)
- Format : `<type>/<scope>/<short-description>`
- Types : `release` · `feature` · `fix` · `refactor` · `docs` · `chore`
- Scope obligatoire pour le contenu (ex. `feature/02-techniques-construction/02-riesz-markov`)

### Commits
- Style Conventional Commits : `<type>(<scope>): <description>`
- Footer `Fixes #NN` pour fermer une issue, `Refs: #NN` pour lier

### Versionnage SemVer éditorial
| SemVer | Éditorial | Exemple |
|---|---|---|
| MAJOR | Nouvelle édition | `v2.0.0` |
| MINOR | Nouveau chapitre/section | `v1.3.0` |
| PATCH | Correction/errata | `v1.3.1` |
| `-rc.N` | Release candidate | `v1.1.0-rc.1` |
| `-final` | Archivage édition complète | `v1.10.0-final` |

- Cycle : `feature/*` → `release/vX.Y.Z-rc.N` → `main` (tag RC) → corrections → `main` (tag stable)
- Maximum 2 RC par version stable
- Pas de phases alpha/beta

---

## [STABLE] Contenu scientifique — Table des matières

### Chapitres
1. **Espaces mesurés** — espaces mesurables · mesures images · classe monotone · espaces standards · pathologies
2. **Techniques de construction des mesures** — Carathéodory · Riesz–Markov (intégration, L^p, théorème) · Produit & désintégration (produit fini, Kolmogorov, Rokhlin)
3. **Théorie ergodique et applications** — dynamique ergodique (ergodicité, décomposition) · convergence ergodique (Von Neumann, maximal, Birkhoff, Folner) · applications (nombres, information, jeux, IA)

### Annexes
A. Omniprésence de l'axiome du choix
B. Omniprésence du quotient
C. De Galois à Poincaré
D. De Riemann à Lebesgue
E. De Leibniz à Schwartz
F. Des fonctions élémentaires

---

## [VOLATILE] Historique des milestones

| Version | Statut | Livrable principal |
|---|---|---|
| `v1.0.0` — **Genèse** | ✅ **Terminé** | Script `init_project.sh` — scaffold complet du dépôt |

---

## [VOLATILE] Milestone courant

**Version cible** : `v1.1.0` — **Outillage**
**Statut** : 🔄 En cours — phase de planification

### Objectifs v1.1.0
- [ ] Mise en place des sessions Claude AI (ce fichier `PROJECT_CONTEXT.md`)
- [ ] Optimisation de `init_project.sh` (idempotence · mode `dry-run` · fonctions helper)
- [ ] Réflexion sur la simplification des templates issues (regrouper rédaction/relecture/correction ?)
- [ ] Documentation GitHub : usage des labels · politique de squash des commits

### Issues v1.1.0

| # | Cluster | Branche feature | Statut |
|---|---|---|---|
| 01 | `v1.1.0 — Outillage / 01 — Gestion du contexte Claude` | `feature/v1.1.0/gestion-contexte-claude` | ✅ En cours |
| 02 | `v1.1.0 — Outillage / 02 — Optimisation init_project.sh` | `feature/v1.1.0/optimisation-init-script` | 📋 Planifié |
| 03 | `v1.1.0 — Outillage / 03 — Simplification templates issues` | `feature/v1.1.0/simplification-templates-issues` | 📋 Planifié |
| 04 | `v1.1.0 — Outillage / 04 — Labels et squash` | `feature/v1.1.0/labels-et-squash` | 📋 Planifié |

**Branche de release** : `release/v1.1.0-outillage`

---

## [VOLATILE] Décisions ouvertes

| # | Sujet | Options identifiées | Statut |
|---|---|---|---|
| D-01 | Simplification templates issues | (a) 3 templates séparés (actuel) · (b) 1 template unifié avec sections conditionnelles | 🔍 À trancher |
| D-02 | Moteur LaTeX | `pdflatex` (actuel, cohérent avec packages) vs migration future `LuaLaTeX` (meilleure gestion fontes/langues) | 🔍 À documenter |
| D-03 | `\nocite{*}` dans bibliography.tex | Pratique en dev mais à retirer en version stable pour biblio sélective | 🔍 À planifier |
| D-04 | Granularité sessions Claude | 1 conversation = 1 cluster thématique (sous-thème de milestone) | ✅ Décidé (cette session) |

---

## [VOLATILE] Points de vigilance techniques

- `build-feature-review.yml` : inconsistance mineure — `CURRENT_COMMIT` passe par `$GITHUB_ENV` au lieu de `$GITHUB_OUTPUT` comme dans `build-dev-version.yml`. À homogénéiser en v1.1.0.
- `*.pdf` exclu globalement par `.gitignore` — correct pour les PDFs générés, à commenter si on ajoute un jour des PDFs de ressources (logo, couverture).
- `packages.tex` : `inputenc` + `fontenc` redondants avec LuaLaTeX/XeLaTeX mais **corrects pour pdflatex** — ne pas modifier sans changer le moteur.
- Chaîne de compilation `biber` : vérifier que `latexmk` est configuré pour appeler biber (option `-pdf` seule peut ne pas suffire — envisager `-pdf -biber` ou un `.latexmkrc`).

---

## [VOLATILE] Roadmap globale (vision)

| Version | Thème principal | Statut |
|---|---|---|
| `v1.0.0` — Genèse | Scaffold · CI/CD · Documentation | ✅ Terminé |
| `v1.1.0` — Outillage | Sessions Claude · Script · Labels · Squash | 🔄 En cours |
| `v1.2.0` — Atelier | Éditeurs · Licences · Makefile · Warnings Actions | 📋 Planifié |
| `v1.3.0` — Vitrine | GitHub Pages (accueil · roadmap · statut · changelog · PDF) | 📋 Planifié |
| `v1.4.0` — Excellence | Bonnes pratiques éditoriales · CI qualité · API REST | 📋 Planifié |

---

## [VOLATILE] Dernière session

**Conversation** : `v1.1.0 — Outillage / 01 — Gestion du contexte Claude`
**Date** : 2026-05-16
**Décisions prises** :
- `PROJECT_CONTEXT.md` adopté comme mémoire externe structurée (D-04 ✅)
- Granularité : 1 conversation = 1 cluster thématique = 1 issue GitHub
- Structure STABLE / VOLATILE adoptée
- Noms des milestones arrêtés : Genèse · Outillage · Atelier · Vitrine · Excellence
- Nomenclature des conversations : `[vX.Y.Z — Nom] / [NN — Cluster]`
- Workflow GitHub documenté : issue → feature/* → release/* → main → tag → Release
- Nouveau template `task_issue.md` pour les tâches d'infrastructure (avec lien Claude AI)

**Produits** :
- `PROJECT_CONTEXT.md`
- `.github/ISSUE_TEMPLATE/task_issue.md`

**Prochaine session** :
- `v1.1.0 — Outillage / 02 — Optimisation init_project.sh` (idempotence · dry-run · fonctions helper)

---

## [VOLATILE] Instructions d'utilisation de ce fichier

### En début de session
```
Voici le contexte du projet measure-dynamics-book :
[coller le contenu de PROJECT_CONTEXT.md]

Aujourd'hui on travaille sur : [vX.Y.Z — Nom du milestone] / [NN — Nom du cluster]
```

### Nomenclature des conversations
- Format : `[vX.Y.Z — Nom du milestone] / [NN — Nom du cluster]`
- Exemple : `v1.1.0 — Outillage / 02 — Optimisation init_project.sh`
- Le préfixe `NN` ordonne les conversations au sein d'un milestone (insertion possible entre deux)

### En fin de session
Demander à Claude :
```
Mets à jour PROJECT_CONTEXT.md avec :
- Les décisions prises cette session
- Les issues ouvertes créées ou fermées
- Les points de vigilance nouveaux
- Le résumé de la dernière session
```

### Règles de mise à jour
- Sections STABLE : modification rare, seulement si une convention change officiellement
- Section "Décisions ouvertes" : ajouter D-NN, mettre ✅ quand tranchée (ne pas supprimer)
- Section "Historique des milestones" : à la clôture d'un milestone, ajouter **une ligne** dans le tableau (ex. `| v1.1.0 — Outillage | ✅ Terminé | Script idempotent · templates unifiés · labels documentés |`)
- Section "Dernière session" : **remplacer** (ne pas accumuler — l'historique est dans Git)
- Garder le fichier sous 200 lignes si possible : densité > exhaustivité
