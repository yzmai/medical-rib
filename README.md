![REFED_logo](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/logo_refed_side_transparent.png)
## Refed
![Build Status](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/build-passing.svg)

**Refed (Rib Extaction and Fracture Detection Model)** by [Youyou Jiang](jiangyy5318@gmail.com) and [Shiye Lei](leishiye@gmail.com). Our model has a great performance on **extracting ribs** and **detecting fracture** from CT images. The model is based on python 3.6. 

Refed is consist by two modules: **rib extraction module** and **fracture detection module**. *First*, we design algorithm based on computer vision for extracting ribs from CT images. *Second*, we design DNN based on [faster-rcnn](https://github.com/endernewton/tf-faster-rcnn) for detecting fracture location with these ribs.

### Performance
---
#### rib extraction module: extract ribs from source CT image
1. *Input CT image*

![source CT image](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/src_ct_image.png)

**Note**: the source CT image is handled by HU value binary process (HU threshold = 400)

2. *Cut sternum with envelope line*

![sternum envelope line](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/half_front_bones_with_envelope_line.png)

3. *remaining spine*

![remaining spine](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/spine_remaining.png)

4. *collect ribs*

![collect ribs](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/collect_ribs.png)

you can also view every single rib as follows:

![single rib](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/single_rib.png)

#### fracture detection module: fracture recognition and location
<font color=red size=5>（fraction detection 的效果）</font>

### Data flowchart
---
![data flowchart](https://github.com/jiangyy5318/medical-rib/blob/master/README_IMAGES/data_flowchart.png)
### Prerequisites
---
- **operation system**: Linux (our OS is Ubuntu 16.04)
- **interpreter**: More advanced than python 3.6.0
- **some python packages**: [`skimage`](https://scikit-image.org/), [`opencv`](https://opencv.org/), [`tensorflow`](https://www.tensorflow.org/), [`sklearn`](https://scikit-learn.org/)

### Install
---
```shell
git clone https://github.com/jiangyy5318/medical-rib.git
```

### Demo and test with the model
---
1. *get into the rib cut directory*
```shell
cd xxx/medical-rib/preprocessing/rib_cut_v6/
```
**Note**: xxx denote the directory where you git the repository in

2. *change the dataset file path and output file path*
```shell
vim run.sh
```
**Note**: change **pkl_dir** and **output_dir** in run.sh

3. *run*
```shell
./run.sh
```

### Data set
---
1. *demo data set directory*
```shell
xxx/medical-rib/dataset-demo
```

2. *how to use every files or directory in the data set*
- **./dataset**
```text
contain source CT images  (file type: .dicom)
```
- **./label**
```text
contain fracture location labeled by doctors  (file type: .nii)
```
- **./pkl_cache**
```text
contain 3D images with handling source CT image(.dicom files)  (file type: .pkl)
```
- **./rib_df_csv**
```text
contain all ribs of one patient extracted from the patien's 3D images(.pkl files)  (file type: .csv)
```
- **./voc2007**
```text
```
- **./data_join_label**
```text
record correcspondence information of fracture ribs' locations and class numbers
```
- **./label_info.csv**
```text
record all fracture information
```
- **./label_loc_type_info.csv**
```text
```
- **./offset_df.csv**
```text
```
- **./rib_type_location.xls**
```text
record diagnostic data for all patients
```

### Run the model with your own data
---
#### preprocessing
1. *convert CT image to pkl file*
- change **dcm_folder** and **pkl_folder** in the pretreat.sh file
```shell
cd xxx/medical-rib/preprocessing/dicom_read/
vim pretreat.sh
```
```text
Note:
    1. dcm_folder=your dicom file path
    2. pkl_folder=the path you saving pkl files
```
- run pretreat.sh
```shell
./pretreat.sh
```

2. *extracte ribs from pkl files*

- get into the rib cut directory
```shell
cd xxx/medical-rib/preprocessing/rib_cut_v6/
```
- change the **pkl_dir** and **output_dir** in the run.sh
```shell
vim run.sh
```
```text
Note:
    1. pkl_dir=your pkl file path  
    2. output_dir=xxx/medical-rib/temp_output
```

- run
```shell
./run.sh
```
3. *make your own data set*  

<font color=red size=5>（如何制作自己的VOC数据集）</font>
#### feacture detection module    
<font color=red size=5>（如何启动faster-rcnn）</font>

### Change logs
---
<font color=red size=5>（更新日志）</font>


