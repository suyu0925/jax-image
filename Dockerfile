FROM nvidia/cuda:11.7.1-devel-ubuntu20.04

# install python3-pip
RUN apt update && apt install python3-pip -y

# install jax
RUN pip install "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# install jupyter notebook
RUN pip install notebook

# copy quickstart
COPY ./Quickstart.ipynb /home/Quicstart.ipynb

# entry point
CMD ["jupyter", "notebook" , "--ip", "0.0.0.0", "--allow-root", "--no-browser","--NotebookApp.token=''","--NotebookApp.password=''", "/home"]
