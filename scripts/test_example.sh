# Commands to test pretrained models.
cd src
python3 batch_test.py --model FormulaNet-basic --log ../logs/test_formulanet_basic.log --compatible
python3 batch_test.py --model FormulaNet-basic-uc --log ../logs/test_formulanet_basic_uc.log --compatible
python3 batch_test.py --model FormulaNet --log ../logs/test_formulanet.log
python3 batch_test.py --model FormulaNet-uc --log ../logs/test_formulanet_uc.log
