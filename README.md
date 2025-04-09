## 项目说明

本项目是[video-subtitle-remover](https://github.com/YaoFANGUK/video-subtitle-remover)
的docker封装。

## 构建说明

```
git clone git@github.com:leeyeel/video-subtitle-remover-docker.git
cd video-subtitle-remover-docker
docker build . -t video-subtitle-remover:latest
```

## 使用说明

```
docker run --rm -it --gpus all  -v /your/path/:/data video-subtitle-remover:latest /bin/bash
```
替换`/your/path/`为你需要处理的视频目录，
进到容器后使用`python backend/main.py --input /your/path/video.mp4`使用。

详细使用方法可使用:

`python backend/main.py -h`

更变的使用可添加bash脚本,并放置到PATH目录下:

```
#!/bin/bash
#假设脚本名为video-subtitle-remover
docker run --rm -it --gpus all  -v "$(pwd)":/data video-subtitle-remover:latest /data/"$@"
```

使用时可直接使用:

```
video-subtitle-remover myvideo.mp4
```


