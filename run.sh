#!/usr/bin/env bash
cd /wangdongmei/nlp/text_summarization/BertSum/src

#将文件处理为按照句号 分成array 从每个文件开始编号 每个句子index 0 1 2....,每个句子里面token 每个word 编码0,1,2 标志起始位置,句子与句子之间开始错开一个,段落之间错开两个字符.
#python preprocess.py -mode tokenize -raw_path ../raw_data/cnn/stories/test_process_data -save_path ../merged_stories_tokenized

#共92579条cnn数据,按照urls里面将数据分成训练,验证,测试集合,每个数据[{src:[[句子1],[句子2]..   tgt:[[摘要句子1],[摘要句子1]]},{文章2}]
#python preprocess.py -mode format_to_lines -raw_path ../merged_stories_tokenized -save_path ../json_data/cnndm -map_path ../urls -lower

# greedy算法 每一句话先找出和摘要最相关的句子,然后用这个句子+第二个句子 与摘要比 找到第二个句子 以此类推找三个句子 combination 是直接组合找到最优,分数是精度+召回
#python preprocess.py -mode format_to_bert -raw_path ../json_data -save_path ../bert_data_bak -oracle_mode combination -n_cpus 4 -log_file ../logs/preprocess.log

#备注: self.tokenizer = BertTokenizer.from_pretrained('bert-base-uncased', do_lower_case=True) 这个用的是bert-base-uncased do_lower_case 每篇文章最多100句,每句最多200个单词 长度截止为510
# 数据生成 src 对应的token ;label每句话对应的标签 ;segs:每个token对应的句子id 奇数0 偶数为1;clss:CLS句子标志对应的位置;src_txt:原始文件 [句1,句2];tgt_txt:摘要句子


#single
#训练
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0  -gpu_ranks 0 -world_size 1 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000

#验证
#python train.py -mode validate -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier  -visible_gpus 0  -gpu_ranks 0 -batch_size 30000  -log_file ../logs/bert_classifier_validate  -result_path ../results/cnndm -test_all -block_trigram true

#预测
python train.py -mode test -test_from ../models/bert_classifier/model_step_49000.pt  -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier  -visible_gpus 0  -gpu_ranks 0 -batch_size 30000  -log_file ../logs/bert_classifier_validate  -result_path ../test_results/cnndm -test_all -block_trigram true




#一台机器8个gpu卡
#python train.py -mode train -encoder classifier -dropout 0.1 -bert_data_path ../bert_data/cnndm -model_path ../models/bert_classifier -lr 2e-3 -visible_gpus 0,1,2,3,4,5,6,7  -gpu_ranks 0,1,2,3,4,5,6,7 -world_size 8 -report_every 50 -save_checkpoint_steps 1000 -batch_size 3000 -decay_method noam -train_steps 50000 -accum_count 2 -log_file ../logs/bert_classifier -use_interval true -warmup_steps 10000

