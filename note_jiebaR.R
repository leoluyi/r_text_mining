x <- "我只是阿布隆科季小敗"
# edit_dict()


seg_mix <- worker(type = "mix"); seg_mix <= x
# hmm
seg_hmm <- worker(type = "hmm"); seg_hmm <= x
# dict and user
seg_mp <- worker(type = "mp"); seg_mp <= x
# MixSegment: dict, hmm and qmax
seg_query <- worker(type = "query"); seg_query <= "永和服装饰品有限公司"


# dict, hmm, idf, stop_word
seg_simhash <- worker(type = "simhash"); seg_simhash <= x
# dict, hmm, idf, stop_word
seg_key <- worker(type = "keywords"); seg_key <= x


## 詞性標注
# MixSegment: dict, hmm and user
tagger <- worker("tag")
tagger <= x
