# DataScience Jupyter Notebook
This Docker image is based on jupyter/scipy-notebook [https://hub.docker.com/r/jupyter/scipy-notebook/](https://hub.docker.com/r/jupyter/scipy-notebook/) where some additional libraries has been installed.

## How to use
Clone the repository and build the image with 

    docker build -t ds_jupyter .

Then start the container with 

    docker run -it --rm -p 8888:8888 -v $(pwd):/home/jovyan/work ds_jupyter

Navigate to the URL printed in the console and start working from within the "work" directory.

## Todos

- [ ] make the "work" directory the initial page
