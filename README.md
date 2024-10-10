1. Install pyenv (https://github.com/pyenv/pyenv)
2. Install python version 3.11.2: `pyenv install 3.11.2`
3. Install poetry (https://python-poetry.org/)
4. install robotframework-browser dependencies:
* node.js (https://nodejs.org/en/download)
* access project root directory, run:
* `pyenv local 3.11.2`
* `poetry config virtualenvs.in-project true`
* `poetry install`
* `poetry shell`
* `rfbrowser init`

To run tests:
* adjust `resources/common.resource` (DUT username, passwords, IPv4 address)
* go to project root directory
* activate python virtual environment: `poetry shell` 
* run: `robot -d reports/ -i<TAG> -vGLOBAL_DEBUG_BROWSER:true .`
