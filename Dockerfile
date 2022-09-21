FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

# install python3-pip
RUN apt update && apt install python3-pip -y

# install jax
RUN pip install "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# install jupyter lab
RUN pip install jupyterlab

# copy tutorial notebook files
COPY ./*.ipynb /home/

# entry point
CMD ["jupyter", "lab" , "--ip", "0.0.0.0", "--allow-root", "--no-browser", "--notebook-dir=/home/", "--ServerApp.token=''"]
