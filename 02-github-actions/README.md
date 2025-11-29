# GitHub Actions CI Pipeline

This project demonstrates a basic CI (Continuous Integration) pipeline using GitHub Actions.
The pipeline performs the following tasks:

- Checks out the code
- Sets up Python
- Installs dependencies
- Runs automated tests using pytest
- Uploads test results as artifacts

## Folder Structure

02-github-actions/
│
├── app/
│   ├── main.py
│   └── requirements.txt
├── tests/
│   └── test_app.py
└── .github/
    └── workflows/
        └── ci.yml

## How to Run Locally

cd 02-github-actions
pip install -r app/requirements.txt
pytest -q

## How to View CI Runs

Go to your GitHub repo → Actions tab.
Push or edit any file inside this folder and GitHub Actions will trigger automatically.
