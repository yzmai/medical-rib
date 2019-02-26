#!/usr/bin/env bash


###
DCM_DF_OUT_PATH=./data/csv_files/dicom_info.csv
RIB_DF_CACHE_PATH=./data/ribs_df_cache
LOGS_DIR=$1
FORMAT=$2
SLICING=$3
RIBS_MODEL_WEIGHTS=./data/model_weights

PKL_FOLDER=$4

function ribs_obtain_from_dcm() {
    # $1 代表第一个参数，$N 代表第 N 个参数
    # $# 代表参数个数
    # $0 代表被调用者自身的名字
    # $@ 代表所有参数，类型是个数组，想传递所有参数给其他命令用 cmd "$@"
    # $* 空格链接起来的所有参数，类型是字符串

    # transfer all dcm to array pkl for every patient
    cat ${DCM_DF_OUT_PATH} | tail -n +2 | head -n 1 | while IFS=, read id dcm_path
    do
        out_put_prefix=${LOGS_DIR}/${id}
        rm -rf ${out_put_prefix} && mkdir -p ${out_put_prefix}
        echo "start make rib data for ${id}"
        python3  ./preprocessing/separated/main.py  --use_pkl_or_dcm  ${FORMAT}   \
                                                    --dcm_path  ${dcm_path} \
                                                    --keep_slicing  ${SLICING}  \
                                                    --rib_df_cache_path  ${RIB_DF_CACHE_PATH} \
                                                    --output_prefix  ${out_put_prefix}  \
                                                    --rib_recognition_model_path  ${RIBS_MODEL_WEIGHTS}  \
                                                    > ${out_put_prefix}".log"
    done
}


function ribs_obtain_from_pkl() {

    files=$(ls ${PKL_FOLDER})
    for f in ${files}
    do
        file_path=${PKL_FOLDER}/${f}
        if [[ "$file_path" == *.pkl ]]
        then
            id=${f%%".pkl"}
            out_put_prefix=${LOGS_DIR}/${id}
            rm -rf ${out_put_prefix} && mkdir -p ${out_put_prefix}
            echo "start make rib data for ${id}"
            python3  ./preprocessing/separated/main.py  --use_pkl_or_dcm  ${FORMAT}   \
                                                        --dcm_path  ${file_path} \
                                                        --rib_df_cache_path  ${RIB_DF_CACHE_PATH} \
                                                        --output_prefix  ${out_put_prefix}  \
                                                        --rib_recognition_model_path  ${RIBS_MODEL_WEIGHTS}  \
                                                        > ${out_put_prefix}".log"

        fi
    done
}

if [[ ! -d ${LOGS_DIR} ]]; then
  mkdir -p ${LOGS_DIR}
fi

if [[ "$FORMAT" = "dcm" ]]; then
    ribs_obtain_from_dcm
elif [[ "$FORMAT" = "pkl" ]]; then
    ribs_obtain_from_pkl
else
    echo "Invalid format!"
fi

