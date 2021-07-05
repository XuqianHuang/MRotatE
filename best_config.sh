# Best Configuration for MRotatE
#
bash run.sh train MRotatE FB15k 0 0 512 256 1000 24.0 1.0 0.0001 50000 8 -te
bash run.sh train MRotatE FB15k-237 0 0 512 256 1000 9.0 1.0 0.00005 30000 4 -te
bash run.sh train MRotatE wn18 0 0 512 512 500 12.0 0.5 0.0001 60000 8 -te
bash run.sh train MRotatE wn18rr 0 0 512 512 500 6.0 0.5 0.00005 30000 4 -te
#

