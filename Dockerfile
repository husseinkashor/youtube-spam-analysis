
FROM quay.io/jupyter/scipy-notebook:latest
WORKDIR /home/jovyan/bd-a1
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=${NB_UID}:${NB_GID} data/ ./data/
COPY --chown=${NB_UID}:${NB_GID} notebook/ ./notebook/

RUN mkdir -p output/figures

EXPOSE 8888
CMD ["start-notebook.py", "--ServerApp.ip=0.0.0.0", "--ServerApp.port=8888"]

