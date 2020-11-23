#!/usr/bin/env bash
cd /wangdongmei/nlp/text_summarization/BertSum/src
#single
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0  -gpu_ranks 0 -world_size 1 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
#一台机器8个gpu卡
python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0  -gpu_ranks 0 -world_size 1 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
#三台机器24个gpu卡
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19  -gpu_ranks 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19 -world_size 20 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
#二台机器16个gpu卡
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15  -gpu_ranks 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 -world_size 16 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
