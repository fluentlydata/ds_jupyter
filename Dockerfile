# https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook
FROM jupyter/scipy-notebook

# Install Tensorflow (from https://github.com/jupyter/docker-stacks/blob/master/tensorflow-notebook/Dockerfile)
RUN conda install --yes \
    'tensorflow=1.5*' \
    'keras=2.1*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# install more specific packages through either conda or pip
# (thx to https://stackoverflow.com/questions/35802939/install-only-available-packages-using-conda-install-yes-file-requirements-t)
ADD requirements.txt /tmp/requirements.txt
RUN cd /tmp/ && \
    while read requirement; \
    do conda install --yes $requirement || pip install $requirement; \
    done < requirements.txt

