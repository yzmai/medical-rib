## Refed

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

### Installation
1. Clone the repository
    ```shell
    git clone https://github.com/jiangyy5318/medical-rib.git
    ```
2. Install all the python prerequisites
    ```shell
    pip install -r requirements
    # or add `--user` to install to user's local directories
    ```
3. may be add opencv and tensorflow

### Generate the separated ribs
1. Read Every patients' CT image and save its 3D array;
    ```shell
    ./preprocessing/dicom_read/dcm_to_3d_pkl.sh  [PATIENT_DCM_FOLDER]  [PATIENT_PKL_FOLDER]
    ```
2. Seperate all the bone and collect all the ribs among them from 3d bone structure for every patient. The method in which we sepeated and collected was detailedly described, see details,please refer to [seperated and collect]()
    ```shell
    /preprocessing/rib_cut_v6/run.sh 
    ```
3. Get the seperated-rib data;maybe need to move this title to the below parts
    ```shell
   ./preprocessing/create_voc2007/create_voc2007.sh [PATIENT_FOLDER]
    ```
4. train your own rib-recognition model to replace our internal infer models. Please refer to [link](****)

### make dataSet to train detection models
1. here, we only supported voc2007 format,
    ```shell
    please wait my shell
    ```

### Train fragmented location detection model
1. here, we only.
    ```shell
    please wait my shell
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


3. *make your own data set*  

<font color=red size=5>（如何制作自己的VOC数据集）</font>
#### feacture detection module    
<font color=red size=5>（如何启动faster-rcnn）</font>

### Change logs
---
<font color=red size=5>（更新日志）</font>


