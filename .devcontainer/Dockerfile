FROM python:3.10

# Install python requirements and configure juptyer lab.
COPY requirements.txt .
RUN pip install --no-cache-dir --no-dependencies -r requirements.txt \
    && jupyter labextension disable "@jupyterlab/apputils-extension:announcements"

COPY home /root
