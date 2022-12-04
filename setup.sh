ENV_NAME='shade2022'

# Check for cuda capabilities
if command -v nvidia-smi; then
    if nvidia-smi | grep 'CUDA Version: 11.[345]'; then
        install_type='cudatoolkit=11.3'
    elif nvidia-smi | grep 'CUDA Version: 11.[6789]'; then
        install_type='cudatoolkit=11.6'
    elif nvidia-smi | grep 'CUDA Version: 1[23456789].'; then
        install_type='cudatoolkit=11.6'
    elif nvidia-smi | grep 'CUDA Version: 11.[012]'; then
        install_type='cudatoolkit=10.3'
    elif nvidia-smi | grep 'CUDA Version: 10.[23456789]'; then
        install_type='cudatoolkit=10.3'
    else
        install_type='cpuonly'
    fi
else
    install_type='cpuonly'
fi

conda create --force -n ${ENV_NAME}

if command -v mamba; then
    if echo ${install_type} | grep 'cpuonly'; then
        # Mamba fails to solve cpuonly pyg https://github.com/mamba-org/mamba/issues/1542
        install_method='conda'
    else
        install_method='mamba'
    fi
else
    install_method='conda'
fi

command ${install_method} install -n ${ENV_NAME} -c pytorch -c conda-forge nibabel=4.0.2 pytorch=1.11 torchvision matplotlib pandas ipykernel ipympl ffmpeg monai tqdm tensorboard scikit-learn

echo "done"

