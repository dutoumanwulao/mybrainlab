# 几种常见的医学数据格式

## .hv 文件和 .img 文件

- `.hv` 文件是医学成像专用的“头文件”，只是一份纯文本说明书，记录这组图像的尺寸、体素大小、数据排列方式、数据类型等元数据。
- `.img` 文件是配套的“图像数据本体”，存放所有体素（像素）的实际数值，是一段没有任何结构说明的二进制数字流。

举例：

```python
import sirf.STIR as pet

image = pet.ImageData('emission.hv')
```


## .hv 文件和 .hs 文件 和 .v 文件 和 .s 文件 {#hvhsdata}

这些文件都是来源于SIRF中的SITR的内容

- `.hv` 和 `.hs` 都是头文件内容，分别表示在体图像中和在投影图像sinogram中的几何配置等信息

文件扩展名 | 对应的数据类型           | 存储的几何信息
---       | ---                    | ---
`.hv`     | 体图像 (volume image)  | 体素尺寸（Voxel size）、切片数、行／列数、坐标原点、数据类型、图像方向等
`.hs`     | 投影数据 (sinogram)    | 视角数（views）、每视角探测器元件数（bins）、轴向层数（segments/slices）、bin 大小、探测器几何参数等

- **`.hv`** 让 SIRF 知道“我要读/写的是一幅怎样的 3D 图像”，比如每个 voxel 是 2 mm × 2 mm × 2 mm，图像是 128 × 128 × 64。
- **`.hs`** 让 SIRF 知道“我要读/写的是怎样的一组投影数据”，比如 sinogram 有 180 个角度、每角度 200 个 bin、64 个轴向层，以及对应的射线几何。


- 而 `.v` 和 `.s` 展示相应的完整信息。不过，在实际代码的处理中，直接通过阅读处理`.hv` 和 `.hs`头文件系统内部会有默认算法处理同一路径下的`.v` 和 `.s`文件内容。