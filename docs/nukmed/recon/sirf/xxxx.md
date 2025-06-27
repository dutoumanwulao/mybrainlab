# SIRF基础用法


## 导入PET模块

```python
import sirf.STIR as pet
```


## 阅读PET图像`pet.ImageData`

从磁盘上阅读一份医学影像文件，变成SIRF可以操控的对象
```python
image = pet.ImageData('your_pet_data_file.hv')
```


## 射线追踪重构Sinogram

使用射线追踪方法，本质上就是把PET上面的亮点当做CT里面密度最高的点看待，对于二维图像扫描构建到sinogram
也可以通过蒙特卡洛方法模拟，这样就会是比较准确的sinogram
此方法只是构建一个转化成sinogram的模具工厂，之后可以在这个模具里面进行各种不同的操作

```python
acq_model = pet.AcquisitionModelUsingRayTracingMatrix()
```


### `pet.AcquisitionData`用法

`pet.AcquisitionData` 是 SIRF 中专门用来处理 PET 中 sinogram 的函数。

#### 作为模版阅读探测几何使用

它可以用作模板，指定一种投影数据格式（如几何结构、分层数、采样方式等），比如只读取模板文件，只关心文件内的探测器几何结构，不关心具体的采集数据。

示例代码：

```python
import sirf.STIR as pet
import os

# 假设你的数据文件夹叫 data_path，里面有 template_sinogram.hs
data_path = '/your/data/folder'

# 只用模板的格式，不关心具体内容
template = pet.AcquisitionData(os.path.join(data_path, 'template_sinogram.hs'))#其中os.path.join表示用完美方式缝合路径和文件

print("模板投影数据格式：")
print("尺寸 shape:", template.shape())
print("每个维度数量:", template.dimensions())
print("类型 type:", type(template))
```

则输出为

```text
模板投影数据格式：
尺寸 shape: (31, 252, 128)
每个维度数量: (31, 252, 128)
类型 type: <class 'sirf.STIR.AcquisitionData'>
```
当然，正如数据类型章节所说的，[点击查看医学图像数据的区别](pictype.md#hv-文件和-hs-文件-和-v-文件-和-s-文件-hvhsdata)，也可以对于头部文件直接进行数据处理，内部算法会直接处理相应的完整数据。


#### `.set_up`操作

使用`.set_up`配置文件，才能进行下一步操作，如下代码，抽取了体图像和sinogram的头文件配置进行下一步操作

```python
acq_model.set_up(template, image) #注意这里只有配置没有赋值给任何代码
```


#### 前投和背投 `.forward`和`.backward`

接下来就可以对数据进行前投，用图像产生sinogram：

```python
acquired_data = acq_model.forward(image)
```

也可以产生背投，指的是sinogram变成图像：

```python
acquired_data = acq_model.backward(image)
```


## ImageData 类相关的操作

**说明：**  
下面的示例代码统一用 `image` 作为 PET 图像对象的变量名，这来自于初始约定：

```python
image = pet.ImageData('emission.hv')
```


### 获取图像维度尺寸

```python
image.dimensions()    # 可能输出 (64, 128, 128)
```


### 使图像变成三维数组

```python
arr = image.as_array()
```

