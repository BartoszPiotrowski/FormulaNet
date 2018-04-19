# FormulaNet

Code for reproducing the results in the following paper:

**Premise Selection for Theorem Proving by Deep Graph Embedding**
Mingzhe Wang\*, Yihe Tang\*, Jian Wang, Jia Deng (*equal contribution)
*Neural Information Processing Systems (NIPS), 2017*

## Package dependency
- Python3
- PyTorch 0.1.12
- Cuda

## Downloading the dataset
Download and extract the [HolStep](http://cl-informatik.uibk.ac.at/cek/holstep/) dataset.

```
mkdir data/raw_data && cd data/raw_data
wget http://cl-informatik.uibk.ac.at/cek/holstep/holstep.tgz
tar -xvzf holstep.tgz
```

## Generating graph representations
After downloading the HolStep dataset, we generate and save graph representations for `train`, `valid`, and `test` in `data/hol_data`.

By default, we use 7% of the data in the training set as the validation set. The training and validation set do not share conjectures.

```bash
mkdir data/hol_data
python3 src/data_util/generate_hol_dataset.py data/raw_data/holstep data/hol_data
```

Run `python3 src/data_util/generate_hol_dataset.py -h` for more options.

## Pretrained models

- `models/FormulaNet-basic`: FormulaNet-basic for conditional premise selection.
- `models/FormulaNet-basic-uc`: FormulaNet-basic for unconditional premise selection.
- `models/FormulaNet`: FormulaNet for conditional premise selection.
- `models/FormulaNet-uc`: FormulaNet for unconditional premise selection.

Note: the above models should only be used with the default token dictionary `data/dicts/hol_train_dict`.

## Training your own models

To train a FormulaNet-basic model, please run:

```bash
cd src
python3 batch_train.py  --log training.log --output model --record train_record
```

To train a FormulaNet model, please run:

```bash
cd src
python3 batch_train.py  --log training.log --output model --record train_record --binary
```

Option `--binary` turns on the order-preserving terms.

Run `python3 batch_train.py -h` and check `scripts/train_example.sh` for more options.

## Evaluation
```bash
cd src
python3 batch_test.py --model MODEL_FILE  # The file name, such as FormulaNet-basic-uc
```

Check `scripts/test_example.sh` for commands to test the pretrained models.

Please contact us if you run into any issues or have any questions.

## Acknowledgement
This work is partially supported by the National Science Foundation under Grant No. 1633157.
