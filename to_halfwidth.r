# endoding: UTF-8
# original: Nippon::zen2han

to_halfwidth <- function (x)
{
  paste2 <- function(x, ...) {
    paste(x, ..., sep = "", collapse = "")
  }
  full <- paste2("－！＠＃＄％＆＊（）＿＋＝｛｝［］／＼＜＞？．，：；～　",
                 "０１２３４５６７８９",
                 "ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏｐｑｒｓｔｕｖｗｘｙｚ",
                 "ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ",
                 "“”",
                 "‘’"
  )
  half <- paste2("-!@#$%&*()_+={}[]/\\<>?.,:;~ ",
                 paste2(0:9),
                 paste2(letters),
                 paste2(LETTERS),
                 '\"\"',
                 "\'\'"
  )
  return(chartr(full, half, x))
}

