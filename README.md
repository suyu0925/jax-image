# jax-image

a docker image for running jax on windows

## TL;DR

just run

```sh
docker run --name jax --gpus=all -d -p 8888:8888 lckof/jax:0.0.5
```

then open <http://localhost:8888>

## jax cuda version

jax does not support all versions of cuda, you can check the supported versions in [jax cuda releases](https://storage.googleapis.com/jax-releases/jax_cuda_releases.html).

cuda >=12.1, cudnn>= 8.9, <9.0, ncll >=2.18 is recommended.

the newest version of jax is named `jaxlib-0.4.28+cuda12.cudnn89`.

## [nvidia jax](https://jax.readthedocs.io/en/latest/installation.html#nvidia-gpu-docker-containers)

`ghcr.io/nvidia/jax:jax` in [jax-toolbox](https://github.com/NVIDIA/JAX-Toolbox) is be with cuda 12.4, cudnn 9.1, and jax 0.4.29.dev20240521.

## system cuda version

Actually, installing [cuda toolkit](https://developer.nvidia.com/cuda-downloads) on windows is not need, nvidia drivers like [GeForce Game Ready](https://www.nvidia.com/download/driverResults.aspx/223955/en-us/) contains cuda 12.4, see the table [CUDA Toolkit and Corresponding Driver Versions](https://docs.nvidia.com/cuda/cuda-toolkit-release-notes/index.html#id4).

If your NVIDIA driver version is >=555.85, then your system's CUDA version is 12.5 (you can check these versions by [nvidia-smi.exe](https://developer.nvidia.com/system-management-interface)). Even if you install CUDA Toolkit 12.4, it won't be useful; the system's CUDA version remains 12.5. In this case, uninstall nvidia driver and re-install the right one.

## publish

```sh
docker build -t "lckof/jax:${TAG}" --push .
```
