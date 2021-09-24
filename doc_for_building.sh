
yum -y install binutils glibc-headers gcc-c++  openssl openssl-devel  texinfo

安装 gcc 9.3  glibc   opencv   make   cmake  

https://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/  cuda source
安装 nvidia驱动  cuda11.2  cudnn  tensorrt 需要配套版本      

github 加速【https://blog.csdn.net/networken/article/details/105122778】
git config --global  url."https://github.com.cnpmjs.org".insteadOf https://github.com
git config --global --list

依赖 Google 源 需要clone到本地


配置 docker 代理

docker pull使用网络代理的配置
https://www.feiyiblog.com/2021/01/13/%E5%85%B3%E4%BA%8Edocker-pull%E4%BD%BF%E7%94%A8%E7%BD%91%E7%BB%9C%E4%BB%A3%E7%90%86%E9%97%AE%E9%A2%98/





pytorch  手动编译
cmake -DTRITON_PYTORCH_DOCKER_IMAGE=nvcr.io/nvidia/pytorch:21.06-py3  -DTRITON_PYTORCH_INCLUDE_PATHS="/data/yuzhenjiang/triton/workspace_server/building/pytorch/build/include/torch;/data/yuzhenjiang/triton/workspace_server/building/pytorch/build/include/torchvision" -DTRITON_PYTORCH_LIB_PATHS=/data/yuzhenjiang/triton/workspace_server/building/pytorch/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=/data/yuzhenjiang/triton/workspace_server/building/pytorch/install -DTRITON_COMMON_REPO_TAG:STRING=r21.06 -DTRITON_CORE_REPO_TAG:STRING=r21.06 -DTRITON_BACKEND_REPO_TAG:STRING=r21.06 -DTRITON_ENABLE_GPU:BOOL=ON ../


