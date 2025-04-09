FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# 安装系统依赖
# 安装 OpenCV 运行时依赖
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    libgl1-mesa-glx \
 && rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /app

# 安装 PaddlePaddle 和 PyTorch（GPU）
RUN pip install paddlepaddle-gpu==2.4.2.post117 -f https://www.paddlepaddle.org.cn/whl/linux/mkl/avx/stable.html

# 拷贝项目文件
COPY requirements.txt /app

# 安装项目其他依赖
#RUN conda install -c conda-forge make
RUN pip install -r requirements.txt
COPY . /app

# 默认运行 CLI 模式
ENTRYPOINT ["python", "/app/backend/main.py"]
