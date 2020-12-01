#!/usr/bin/env bash
cd /wangdongmei/nlp/text_summarization/BertSum/src
#single
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0  -gpu_ranks 0 -world_size 1 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
#一台机器8个gpu卡
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7  -gpu_ranks 0,1,2,3,4,5,6,7 -world_size 8 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
#三台机器24个gpu卡
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19  -gpu_ranks 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19 -world_size 20 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000
#二台机器16个gpu卡
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15  -gpu_ranks 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 -world_size 16 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000

#将文件处理为按照句号 分成array 从每个文件开始编号 每个句子index 0 1 2....,每个句子里面token 每个word 编码0,1,2 标志起始位置,句子与句子之间开始错开一个,段落之间错开两个字符.
#python preprocess.py -mode tokenize -raw_path ../raw_data/cnn/stories/test_process_data -save_path ../merged_stories_tokenized

python preprocess.py -mode format_to_lines -raw_path ../merged_stories_tokenized -save_path ../json_data/cnndm -map_path ../urls -lower