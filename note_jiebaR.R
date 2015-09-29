# https://github.com/fxsjy/jieba
# https://github.com/yanyiwu/cppjieba
library(jiebaR)


x <- "我是拖拉机学院手扶拖拉机专业的。不用多久，我就会升职加薪，当上CEO，走上人生巅峰。"

# 自定义用户词典 -------------------------------------------------------------

# edit_dict()

# seg methods ----------------------------------------------------------------

## MIX (dict, hmm)
seg_mix <- worker(type = "mix"); seg_mix <= x
## HMM (hmm)
seg_hmm <- worker(type = "hmm"); seg_hmm <= x
## max-prob (dict, user)
seg_mp <- worker(type = "mp"); seg_mp <= x
## QUERY (dict, hmm, qmax)
seg_query <- worker(type = "query"); seg_query <= x

# 可以看出效果最好的是Mix，也就是融合MP和HMM的切词算法。
# 即可以准确切出词典已有的词，又可以切出像"杭研"这样的未登录词。
# Full方法切出所有字典里的词语。
# Query方法先使用Mix方法切词，对于切出来的较长的词再使用Full方法。


# 关键词抽取 ----------------------------------------------------------------

# KEYWORD: MixSegment (dict, hmm, idf, stop_word)
seg_key <- worker(type = "keywords"); seg_key <= x
# SIMHASH: KEYWORD (dict, hmm, idf, stop_word)
seg_simhash <- worker(type = "simhash"); seg_simhash <= x

distance("你好的時候" , "我是你阿阿好誰" , simhasher)

# 詞性標注 --------------------------------------------------------------------

# TAGGING: MixSegment (dict, hmm, user)
tagger <- worker("tag")
tagger <= x
