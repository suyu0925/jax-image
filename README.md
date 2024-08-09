# jax-image

a docker image providing a jax runtime with jupyterlab on windows.

## TL;DR

just run

```sh
docker run --name jax --gpus=all -d --restart=always -e ENV_TOKEN='may-use-a-guid' -p 8888:8888 lckof/jax:0.0.5
```

then open <http://localhost:8888>

if you want to persist notebook files, you can mount a volume to `/home`, like

```sh
docker run --name jax --gpus=all -d --restart=always -e ENV_TOKEN='may-use-a-guid' -p 8888:8888 -v ./workspace:/home lckof/jax:0.0.5
```

## jax cuda version

jax does not support all versions of cuda, you can check the supported versions in [jax cuda releases](https://storage.googleapis.com/jax-releases/jax_cuda_releases.html).

cuda >=12.1, cudnn>= 8.9, <9.0, ncll >=2.18 is recommended.

the newest version of jax is named `jaxlib-0.4.28+cuda12.cudnn89`.

## [nvidia jax](https://jax.readthedocs.io/en/latest/installation.html#nvidia-gpu-docker-containers)

nvidia has an official project [jax-toolbox](https://github.com/NVIDIA/JAX-Toolbox) that integrates JAX, use [nvidia/cuda](https://hub.docker.com/r/nvidia/cuda) as base image, and adds support for jax.

As of today, the latest version of `ghcr.io/nvidia/jax:base` uses [nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04](https://hub.docker.com/r/nvidia/cuda/tags?page=&page_size=&ordering=&name=12.4.1-cudnn-devel-ubuntu22.04) as base image, and `ghcr.io/nvidia/jax:jax` integrates `jax 0.4.29.dev20240521`.

## system cuda version

Actually, installing [cuda toolkit](https://developer.nvidia.com/cuda-downloads) on windows is not need, nvidia drivers like [GeForce Game Ready](https://www.nvidia.com/download/driverResults.aspx/223955/en-us/) contains cuda 12.4, see the table [CUDA Toolkit and Corresponding Driver Versions](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#id4).

**mismatched version**

If your NVIDIA driver version is >=[555.85](https://www.nvidia.com/download/driverResults.aspx/224750/en-us/), then your system's CUDA version is 12.5 (you can check these versions by [nvidia-smi.exe](https://developer.nvidia.com/system-management-interface), or check Chapter 2.3 Software Module Versions in [Release Notes](https://us.download.nvidia.com/Windows/555.85/555.85-win10-win11-nsd-release-notes.pdf)). Even if you install CUDA Toolkit 12.4, it won't be useful; the system's CUDA version remains 12.5. 

In this case, uninstall nvidia driver and re-install the right one. like [552.22 04/16/2024](https://www.nvidia.com/en-us/geforce/drivers/results/224154/), you can find CUDA version in [v552.22 Release Notes](https://us.download.nvidia.com/Windows/552.22/552.22-win11-win10-release-notes.pdf) Chapter 2.3.

## publish

```sh
docker build -t "lckof/jax:${TAG}" --push .
```
