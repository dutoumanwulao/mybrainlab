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