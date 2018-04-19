# Commands to test pretrained models.
cd src
python3 batch_test.py --model FormulNet-basic --log ../logs/test_formulanet_basic.log --compatible
python3 batch_test.py --model FormulNet-basic-uc --log ../logs/test_formulanet_basic_uc.log --compatible
python3 batch_test.py --model FormulNet --log ../logs/test_formulanet.log
python3 batch_test.py --model FormulNet-uc --log ../logs/test_formulanet_uc.log
