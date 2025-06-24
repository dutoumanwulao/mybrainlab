# SIRF基础用法

## 导入PET模块

```python
import sirf.STIR as pet
```

## 阅读PET图像

从磁盘上阅读一份医学影像文件，变成SIRF可以操控的对象
```python
image = pet.ImageData('your_pet_data_file.hv')
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
