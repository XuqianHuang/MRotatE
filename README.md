# MRotatE
Knowledge Graph Embedding by Relational and Entity Rotation

**Implemented features**

Models:
 - [x] MRotatE

Evaluation Metrics:

 - [x] MRR, MR, HITS@1, HITS@3, HITS@10 (filtered)

Loss Function:

 - [x] Uniform Negative Sampling
 - [x] Self-Adversarial Negative Sampling

**Usage**

Knowledge Graph Data:
 - *entities.dict*: a dictionary map entities to unique ids
 - *relations.dict*: a dictionary map relations to unique ids
 - *train.txt*: the KGE model is trained to fit this data set
 - *valid.txt*: create a blank file if no validation data is available
 - *test.txt*: the KGE model is evaluated on this data set

**Train**

For example, this command train a MRotatE model on FB15k dataset with GPU 0.
```
CUDA_VISIBLE_DEVICES=0 python -u codes/run.py --do_train \
 --cuda \
 --do_valid \
 --do_test \
 --data_path data/FB15k \
 --model MRotatE \
 -n 256 -b 512 -d 1000 \
 -g 24.0 -a 1.0 -adv \
 -lr 0.0001 --max_steps 50000 \
 -save models/RotatE_FB15k_0 --test_batch_size 8 -te
```
   Check argparse configuration at codes/run.py for more arguments and more details.

**Test**

    CUDA_VISIBLE_DEVICES=$GPU_DEVICE python -u $CODE_PATH/run.py --do_test --cuda -init $SAVE

**Reproducing the best results**


The run.sh script provides an easy way to search hyper-parameters:

    bash run.sh train MRotatE FB15k 0 0 512 256 1000 24.0 1.0 0.0001 50000 8 -te

**Speed**

The KGE models usually take about half an hour to run 10000 steps on a single GeForce GTX 2080 Ti GPU with default configuration. And these models need different max_steps to converge on different data sets:

| Dataset | FB15k | FB15k-237 | wn18 | wn18rr |
|-------------|-------------|-------------|-------------|-------------|
|MAX_STEPS| 50000 | 30000 | 60000 | 30000 | 
|TIME| 2 h | 1 h |  1.5h | 2 h | 


**Using the library**

The python libarary is organized around 3 objects:

 - TrainDataset (dataloader.py): prepare data stream for training
 - TestDataSet (dataloader.py): prepare data stream for evluation
 - KGEModel (model.py): calculate triple score and provide train/test API

The run.py file contains the main function, which parses arguments, reads data, initilize the model and provides the training loop.
