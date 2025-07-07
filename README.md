# Article Replication Project – Econometria III (UDESC/ESAG)

This repository contains the full replication and critical extension of a published empirical article, developed as my final project for **Econometria III (63ECON2)** in the Economics undergraduate program at **Universidade do Estado de Santa Catarina (UDESC/ESAG)**. The project was conducted in the 6th term (2025.1) under the supervision of Prof. Rafael Felipe Bressan.  
All code, analysis, and discussion assume a high level of proficiency in econometrics—this work is intended for peers and instructors familiar with, or studying, advanced econometric theory and applied methods as detailed in the official course syllabus.

---

## 📚 Course Context and Objective

- **Course:** Ciências Econômicas — Econometria III (63ECON2)
- **Department:** Departamento de Ciências Econômicas, UDESC/ESAG
- **Semester:** 2025.1 (6th term)
- **Professor:** Rafael Felipe Bressan ([rafael.bressan@edu.udesc.br](mailto:rafael.bressan@edu.udesc.br))
- **Project Type:** Individual final project — Replicação de artigo científico
- **Assumed Audience:** Students/researchers with advanced background in econometric theory, panel data, causal inference, and statistical programming.

This repository is the result of a requirement for the subject, and the technical content reflects the complexity and expectations of the discipline.

---

## 🧠 Theoretical and Methodological Scope

This project was designed to operationalize, in a rigorous and reproducible manner, the main themes from the **Econometria III** curriculum, including:

- **Panel Data Regression:** Fixed effects, random effects, between/within estimators, heterogeneity bias, Hausman test.
- **Instrumental Variables (IV) and Two-Stage Least Squares (2SLS):** Identification, implementation, and tests of endogeneity and overidentification.
- **Simultaneous Equations Models:** Indirect least squares, model identification, and estimation strategies.
- **Causal Inference:** Potential outcomes (Rubin causal model), difference-in-differences (DID, incl. staggered adoption), treatment/control construction, bias diagnostics.
- **Qualitative Choice Models:** Linear probability, Logit, Probit, maximum likelihood, marginal effects.
- **Generalized Method of Moments (GMM):** Application in IV/GMM setups.
- **Robustness and Model Diagnostics:** Heteroskedasticity, autocorrelation, robust standard errors, RESET and other specification tests.
- **Statistical Programming:** Jupyter Notebooks (Python), Stata, and TeX for advanced econometric analysis and reproducible reporting.

All analyses are conducted with the presumption that the reader is competent with these econometric methods and the underlying mathematical/statistical theory.

---

## 🗂️ Repository Structure

- `Trabalho como Artigo.pdf`:  
  Academic report containing the full written analysis, results, and critical discussion of the replication process.
- `Contemporary Economic Policy.pdf`:  
  The original reference article replicated in this project.
- `Replication data.dta`:  
  Stata-formatted dataset used for all empirical exercises.
- `Replication_code.do`:  
  Stata script for full replication of the original article's empirical results.
- `Completo - Final.ipynb`:  
  Jupyter Notebook containing detailed code, stepwise analysis, robustness checks, and technical commentary.
- Additional `.tex` files (if present):  
  LaTeX source for mathematical derivations or extended reporting.

---

## 🚀 How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/Schadenlord/article_replication.git
cd article_replication
```

### 2. Reproduce and Extend the Analysis

- **Jupyter Notebook:**  
  Open `Completo - Final.ipynb` in [JupyterLab](https://jupyter.org/), [Jupyter Notebook](https://jupyter.org/), or [VS Code](https://code.visualstudio.com/).  
  The notebook contains:
  - Data import and preprocessing (`pandas`, `numpy`)
  - Estimation of panel data models, IV/2SLS, Probit/Logit, GMM, etc. (`statsmodels`, custom routines)
  - Statistical inference, model selection, diagnostics, and robustness analysis
  - Visualization (`matplotlib`, `seaborn`)
  - In-depth technical commentary and reference to relevant theory
- **Stata:**  
  Use `Replication_code.do` with `Replication data.dta` to reproduce the article's original tables and results.
- **PDFs:**  
  - Consult `Trabalho como Artigo.pdf` for a full academic write-up.
  - Compare with `Contemporary Economic Policy.pdf` to assess replication fidelity and methodological nuance.
- **TeX:**  
  Compile `.tex` files if present, for formal documentation of mathematical derivations or supplementary results.

---

## ⚙️ Requirements

- **Jupyter Notebook** (Python 3.x)
- **Stata** (for `.do` file execution)
- **Python libraries:**
  - `pandas`, `numpy` (data management)
  - `statsmodels` (econometric estimation: OLS, panel, IV, Probit/Logit, GMM, etc.)
  - `matplotlib`, `seaborn` (visualization)
  - `notebook` or `jupyterlab` (interactive environment)
- **LaTeX** (optional, for compiling reports)

Install Python dependencies with:
```bash
pip install pandas numpy statsmodels matplotlib seaborn notebook
```

---

## 📑 Course Syllabus Reference

This project was produced for the course **Econometria III (63ECON2)**, following the official syllabus including:

- Causal inference (Rubin potential outcomes)
- Simultaneous equations & identification
- Instrumental variables & 2SLS
- Panel data: fixed/random effects, DID
- Qualitative choice models: LPM, Logit, Probit, MLE, marginal effects
- GMM estimation, robust inference, and advanced diagnostics
- Advanced empirical analysis using Python and Stata

For full details, refer to the official course plan and the bibliography below.

---

## 📖 Bibliography

- Wooldridge, J. M. *Introdução à Econometria* (Cengage, 2016)
- Gujarati, D. & Porter, D. *Econometria Básica* (Amgh, 2011)
- Gertler, P. et al. *Avaliação de Impacto na Prática* (Banco Mundial, 2018)
- Cunningham, S. *Causal Inference: The Mixtape* (Yale, 2021)
- Angrist, J. & Pischke, J.-S. *Mostly Harmless Econometrics*, *Mastering’Metrics*
- Hansen, B. E. *Econometrics* (2020, manuscript)
- Python econometrics: Sheppard, Sargent & Stachurski, QuantEcon lectures

---

## 📜 License & Academic Use

This repository is for academic and educational purposes only, as required for the completion of Econometria III at UDESC/ESAG.  
If you use or adapt any part of this material, please provide proper attribution and cite the original sources as appropriate.

---

## 💬 Contact

For technical or academic questions, please open an issue or reach out via GitHub.

---
