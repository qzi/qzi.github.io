---
title: 'The Brief of Stock Exchange and indicator'
categories: finance
permalink: finance/the-brief-of-stock-exchange-and-indicator
date: 2020-02-24 18:39:54
tags: exchange
excerpt: '新冠（2019-nCoV）疫情开始在中国以外的地方爆发，此时会需要去看一些其他国家指数指标，顺便梳理了一下在 IB 上看到的有点迷糊的交易所和指标，提供一份基于实践的可持续整理的列表'
---

新冠（2019-nCoV）疫情开始在中国以外的地方爆发，此时会需要去看一些其他国家指数指标，顺便梳理了一下在 IB 上看到的有点迷糊的交易所和指标，提供一份基于实践的可持续整理的列表



# Stock Exchange

| Country | Exchange | Full Exchange name | Remark |
| --- | --- | --- | --- |
| Japan | OSE | Osaka Stock Exchange | N225@OSE.JPN |
| Japan | TSE.JPN/TSEJ | Tokyo Stock Exchange | 7203@TSEJ                                              |
| Korea | KSE | Korea Stock Exchange | K200@KSE |
| Singapore | SGX | Singapore Exchange Limited | XINA50@SGX |
| China | SEHK | The Stock Exchange of Hong Kong Limited | HSI@SEHK |
| China | SEHKNTL | Shanghai-Hong Kong Stock Connect | 沪港通 |
| China | HKFE | Hong Kong Futures Exchange | |
| America | PHLX | Philadelphia Stock Exchange | SOX@PHLX |
| America | CBOE | The Chicago Board Options Exchange |  |
| America | GLOBEX | CME *Globex* is the premier electronic trading system providing global connectivity to the broadest array of futures and options across all asset classes. |  |
| America | CME | The Chicago Mercantile Exchange<br />CME Group is the world’s leading and most diverse derivatives marketplace, made up of four exchanges, CME, CBOT, NYMEX and COMEX. Each exchange offers a wide range of global benchmarks across major asset classes. |  |
| America | ARCA | NYSE Arca is an electronic securities exchange in the U.S. on which exchange-traded products (ETPs) and equities trade. The exchange specializes in ETP listings, which include exchange-traded funds (ETFs), exchange-traded notes (ETNs) and exchange-traded vehicles (ETVs). | SPY@ARCA |
| America | CBOT (ECBOT) | The Chicago Board of Trade<br />CME Group merged with the Chicago Board of Trade (CBOT), a Designated Contract Market offering products subject to CBOT rules and regulations, in 2007. CBOT brought a suite of interest rates, agricultural and equity index products to our existing offering. | ZB@[ECBOT](https://www.cmegroup.com/company/cbot.html) |
| America | NYBOT | New York Board of Trade<br />Founded in 1870, the New York Board of Trade (NYBOT) is a [commodity futures exchange](https://www.investopedia.com/investing/commodities-trading-overview/) located in New York. In 2006, it became part of the [Intercontinental Exchange (ICE)](https://www.investopedia.com/terms/i/intercontinentalexchange.asp). |  |
| America | ICE | The Intercontinental Exchange<br />The Intercontinental Exchange (ICE) was founded in May 2000 in Atlanta, Georgia, to facilitate the electronic purchase and sale of energy commodities. ICE operates entirely as an electronic exchange and is linked directly to individuals and companies looking to trade in oil, natural gas, jet fuel, emissions, electric power, commodity [derivatives](https://www.investopedia.com/terms/d/derivative.asp), and futures. |  |
| America | NASDAQ.NMS | The National Market System (**NMS**) is the national system for trading equities in the United States. The System includes all the facilities and entities which are used by broker-dealers to fulfill trade orders for securities. This includes: Major stock exchanges, such as NYSE and **Nasdaq**. |  |
| America | NYSE | The New York Stock Exchange |  |
| America | ONE | OneChicago Exchange | [OneChicago](http://www.onechicago.com/) |
| America | AMEX | NYSE American, The American Stock Exchange (AMEX) was once the third-largest stock exchange in the U.S  ||
| European | DTB | EUREX, Deutsche Terminbörse | [EUREX](https://en.wikipedia.org/wiki/Eurex_Exchange) |



# Indicator

## N225（Nikkei 225 Index）

Exchange: OSE.JPN
Currency: JPY
Index Methodology : Price-weighted index

**N225 Index Trading hours**
09:00 JST - 15:00 JST

### N225 Future

**N225 Future Trading hours**
8:45 JST - 15:15 JST
16:30 JST - 05:30 JST

JST : https://www.timeanddate.com/time/zones/jst

_Nikkei 225 Futures (Large Contracts) Specifications_
https://www.jpx.co.jp/english/derivatives/products/domestic/225futures/01.html



### N225 Option

**N225 Option Trading hours**
09:00 JST - 15:15 JST
16:30 JST - 05:30 JST

N225 Index 支持欧式期权交易，乘数为1000

这里说一下为什么要做日经期权，除了在疫情下行情随着消息面剧烈波动，买方期权是 Risk limited 的，货币自由兑换和美国作为最大的消费市场的体系下，日经经常是跟着美元趋势的，日经的期权是几乎 HKT 的白天和晚上都能交易的，这意味着如果白天有个疫情的重要会议的结果，你马上就可以在趋势逆转前平仓走人了，但是如果是美股，你要等到它开盘才能交易，但是那个时候可能另一个反向的消息来到了，反而可能已经由盈转亏了



## N225M（Nikkei 225 Index Mini）

**N225M future Trading hours**
8:45 JST - 15:15 JST, 16:30 JST - 5:30 JST



## MSCI Japan Index

Exchange of holdings: Tokyo Stock Exchange
Market Currency: JPY
Index Methodology : MSCI Global Investable Market Indexes (GIMI) Methodology 

>The index is based on the MSCI Global Investable Market Indexes (GIMI) Methodology —a comprehensive and consistent approach to index construction that allows for meaningful global views and cross regional comparisons across all market capitalization size, sector and style segments and combinations. This methodology aims to provide exhaustive coverage of the relevant investment opportunity set with a strong emphasis on index liquidity, investability and replicability. The index is reviewed quarterly—in February, May, August and November—with the objective of reflecting change in the underlying equity markets in a timely manner, while limiting undue index turnover. During the May and November semi-annual index reviews, the index is rebalanced and the large and mid capitalization cutoff points are recalculated.

_Factsheet of MSCI Japan Index_
https://www.msci.com/documents/10199/b3ee6464-f705-4d65-81a0-d8756607cf9f

_MSCI Global Investable Market Index_
[MSCI_Global_Investable_Market_Indexes_Methodology_20200212.pdf](blob:https://www.msci.com/952aa376-56db-4ca8-a958-83010536b2da)



### EWJ(MSCI Japan Index ETF)

Underlying : MSCI Japan Index
Exchange: NYSE Arca
ETF Currency: USD

Exchange of holdings: Tokyo Stock Exchange
Market Currency: JPY

Ishares MSCI Japan ETF: 
https://www.ishares.com/us/products/239665/ishares-msci-japan-etf

EWJ:
https://www.etf.com/EWJ

EWJ 支持期权交易

## Tadawul All Share (TASI)

沙特阿拉伯全指,  这个指数有点意思，就是在周日也会波动，可以作为预测周一股市变化的因子

Exchange:  Saudi Stock Exchange (Tadawul)
Market Currency: SAR



## iShare MSCI Saudi Arabia ETF(KSA)
Underlying: MSCI Saudi Arabia IMI 25/50 Index
ETF Currency: USD
Market Currency: SAR

_fact sheet_
https://www.ishares.com/us/literature/fact-sheet/ksa-ishares-msci-saudi-arabia-etf-fund-fact-sheet-en-us.pdf

_iShares MSCI Saudi Arabia ETF_
https://www.ishares.com/us/products/271542/ishares-msci-saudi-arabia-capped-etf



_to be continued_



---

>**学习型的投资者可以加入我的 Financial Group 进行交流讨论**    
>Finance Group in Telegram : [_My Financial Telegram Group_](https://t.me/joinchat/JAgU_xVgurGtCieh5GQ56g)   
>Finance Group in Discord : [_My Financial Discord Group_](https://discord.gg/bshbxuH)   
>微信讨论群可以关注微信公众号:  iLeonVision 发信息跟我要进群二维码

---



# Reference

_SEHKNTL_
https://en.wikipedia.org/wiki/Shanghai-Hong_Kong_Stock_Connect
_The list of SEHKNTL_
https://www1.interactivebrokers.com/en/index.php?f=11759
_List of stock exchange_
https://en.wikipedia.org/wiki/List_of_stock_exchanges
_Stock Exchange_
https://en.wikipedia.org/wiki/Stock_exchange
_Exchange Listings in IB_
https://www1.interactivebrokers.com/en/index.php?f=1562
_ICE_
https://www.investopedia.com/terms/i/intercontinentalexchange.asp
_Japan ETF_
https://www.etf.com/channels/japan-etfs
_NYSE AMEX_
https://www.investopedia.com/terms/a/amex.asp