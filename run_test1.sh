#!/usr/bin/env bash
cd /wangdongmei/nlp/text_summarization/BertSum/src
python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier1 -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7  -gpu_ranks 0,1,2,3,4,5,6,7 -world_size 8 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier1 -use_interval true -warmup_steps 10000

