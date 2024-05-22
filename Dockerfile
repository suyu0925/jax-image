FROM ghcr.io/nvidia/jax:jax

# use mirror for apt
RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.cloud.tencent.com\/ubuntu\//g' /etc/apt/sources.list
RUN sed -i 's/http:\/\/security.ubuntu.com\/ubuntu\//http:\/\/mirrors.cloud.tencent.com\/ubuntu\//g' /etc/apt/sources.list

# install jupyter lab
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple jupyterlab

# copy tutorial notebook files
COPY ./*.ipynb /home/

# entry point
ENTRYPOINT jupyter lab --ip 0.0.0.0 --allow-root --no-browser --notebook-dir=/home/ --IdentityProvider.token="$ENV_TOKEN"
