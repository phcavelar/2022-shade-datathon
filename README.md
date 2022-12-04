# 2022-shade-datathon

Code for the attempt at a frailty score classification model based on 3d CT-scans.

To run the code, please:
1. Set up your conda environment as in the file `setup.sh`.
2. Download the data as specified in `clf.ipynb`.
3. Move the data present in this repository's `data` folder to the `medicaldecathlon` folder
4. Run the jupyter notebook `clf.ipynb` end-to-end.
5. For external validation, please download data from {TODO}

There is also an attempt at classifying each individual part of the frailty score separately in the notebook `clf-multitask.ipynb`, but it was not explored thoroughly.