<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="gui/static/brand/logo-dark.svg">
    <img src="gui/static/brand/logo.svg" alt="MicroMatch" height="64">
  </picture>
</p>

<p align="center"><b>Find the micro-skills hidden in any text.</b></p>

Writing a clear email, meeting a deadline, listening carefully: micro-skills are
the small, practical abilities behind everyday work. MicroMatch reads a job ad,
a CV, a course description or a policy text, highlights the micro-skills it
mentions, and compares them with what real job ads from the SKILLAB Tracker
ask for.

- **Employers** check whether a job ad asks for the right things.
- **Job seekers** see which in-demand micro-skills their CV shows.
- **Educators** see how well a course covers what the market wants.
- **Policymakers** follow micro-skill demand across jobs and experience levels.

Nothing to code and nothing to configure beyond a Tracker login. Available in
English and Greek.

![MicroMatch](gui/static/brand/social-preview.png)

## What is in this repository

| Part | Files | What it does |
|---|---|---|
| Micro-skills lexicon | `MicroSkillsLexicon.xlsx` | 250 micro-skills in 12 categories, with definitions and keywords (earlier drafts: `_v1`, `_v2`) |
| Data pipeline | `main.py`, `merge_jobs.py`, `textprep.py`, `microskill_matcher.py`, `analyze_microskills.py` | Collects job ads from the SKILLAB Tracker and detects the micro-skills in them |
| Analysis | `visualize_results.py`, `network_analysis.py` | Charts (`data/visualizations/`) and the co-occurrence network (`network_results/`) |
| MicroMatch | `gui/`, `start_gui.bat`, `start_gui.sh` | The browser interface described above. Details in [gui/README.md](gui/README.md) |
| Lexicon explorer | `app.py` | A small Streamlit app for browsing the lexicon |
| Data | `data/` | The 1,113 job ads behind the thesis, from raw Tracker downloads to the final results |

## Setup

1. Install Python 3.10 or newer.
2. Copy `.env.example` to `.env` and fill in your SKILLAB Tracker username and password.
   `.env` is excluded from git, so the login never ends up on GitHub.

## Run MicroMatch

- Windows: double-click `start_gui.bat`
- macOS / Linux: `sh start_gui.sh`

The first start creates `.venv` and installs what it needs. Then the browser
opens at http://127.0.0.1:8000.

## Run the pipeline

```
pip install -r requirements.txt
python main.py                  # download job ads from the Tracker   -> data/raw, data/processed
python merge_jobs.py            # merge them and remove duplicates     -> data/final
python textprep.py              # clean the text
python microskill_matcher.py    # detect the micro-skills
python analyze_microskills.py   # summaries and frequencies
python visualize_results.py     # charts
python network_analysis.py      # co-occurrence network
```

The search keywords are in `keywords.py` and `main.py`.

## Lexicon explorer

```
streamlit run app.py
```
