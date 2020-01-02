---
title: Learning P/E Ratio and BABA IPO in HK
categories: finance
tags: finance
abbrlink: 50975
date: 2019-12-27 23:47:32
---

阿里巴巴（BABA）在2019年11月26日回归香港上市，股票代码9988，采用之前不为港交所接受的同股不同权的VIE架构    

同时港股与美股实现（1:8）的自由兑换机制，实现几乎覆盖白天和黑夜的全天量交易轮替，有效增强了其流动性  

如果你细心点对比会发现阿里巴巴在港股的 P/E 会比 美股 P/E 高，在品牌知名度更高的地方估值更高  

正因为阿里这种两地上市的特别的战略架构，也使我们偶尔要去注意一些指标的货币口径是否匹配，刚好我这种外行用来演练一下 P/E（TTM）的计算过程，以下用阿里截止 Q3 2019 的财报来研究计算，我的数据来自Yahoo Finance的 Income statement，也可以去 NASDAQ 的主页的结果对比   

### P/E(TTM) Ratio

**2019 Q3 Sep 29th (Currency in RMB, all numbers in thousands)**

| Breakdown  | Net Income available to common shareholders | Weighted average shares outstanding(diluted) | P/E Ratio   |
|------------|---------------------------------------------|----------------------------------------------|-------------|
| TTM        | 152,674,000                                 |                                            |
| 9/29/2019  | 72,540,000                                  | 2,623,000                                    | 27.65535646 |
| 6/29/2019  | 21,252,000                                  | 2,610,000                                    | 8.142528736 |
| 3/30/2019  | 25,830,000                                  | 2,573,000                                    | 10.03886514 |
| 12/30/2018 | 33,052,000                                  | 2,562,000                                    | 12.9008587  |



```
P/E = 
Price / EPS
price / ( Net income - Prefered dividend ) / Weighted outstanding share
```
Prefered dividend = 0   
Current Price of BABA is 216 dollar  
EPS = 27.65535646 + 8.142528736 + 10.03886514 + 12.9008587 = 58.73760904 ¥
USD:CNY = 1 : 7  

**P/E TTM = 216 ÷ (58.737609 ÷ 7) = 25.7**


### Tailing P/E Ratio
Tailing P/E Ratio 跟 P/E TTM 的区别就是 Tailing P/E 的 EPS 是最近一个完整财年的 4 个季度的财报数据来计算，而 TTM(tailing twelve months) 是从最近的这个季度财报向前推的 4 个季度 ... 


    Trailing P/E Ratio = Current Share Price / Trailing 12-Month EPS ( the most recent fiscal year )

这里就不累赘计算了，用 P/E（TTM）的方法找数据计算就行了 ...


### Note
P/E 一般不用自己算，很多软件都有帮我们算好，只是具体计算口径略有差距所以有写出入，有很大出入的时候才需要自己去验证, 个人只当做一个学习过程 ... 


**学习型的投资者可以加入我的 Financial Group 进行交流讨论**     
Finance Group in Telegram : [_My Financial Telegram Group_](https://t.me/joinchat/JAgU_xVgurGtCieh5GQ56g)   
Finance Group in Discord : [_My Financial Discord Group_](https://discord.gg/NgWdjb)


### Reference
_Tailing_P/E_  
https://www.investopedia.com/terms/t/trailingpe.asp  

_BABA in NASDAQ_  
https://www.nasdaq.com/market-activity/stocks/baba/earnings   

_BABA in Yahoo Finance_  
https://finance.yahoo.com/quote/BABA/financials?p=BABA  

_BABA ER in Hompage_  
https://www.alibabagroup.com/en/ir/earnings  