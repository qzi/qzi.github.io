---
title: Quickbook for Git
categories: technology
permalink: technology/quickbook-for-git
date: 2020-01-06 06:30:07
tags: git
---

## 	Git Phases

Git 最重要的三个 Phases 的理解对理解当前文件处于哪个工作区十分关键，

1. `git add`  会使当前工作区的更改的文件状态从 unstaged 变成 staged
2. `git commit ` 会使当前工作区的更改的文件状态从 staged 变成 committed

下面的 Flowchart 结合常用命令可以清晰地理解

![image-20200106083920065](quickbook-for-git/image-20200106083920065.png)


{% mermaid graph TD %}
A[Working Area - unstaged] --> | git add | B[Staging Area - staged]
B --> | git commit | C[ Repo - commited ]
{% endmermaid %}

{% mermaid graph LR %}
47(SAM.CommonFA.FMESummary)-->48(SAM.CommonFA.CommonFAFinanceBudget)
37(SAM.CommonFA.BudgetSubserviceLineVolume)-->48(SAM.CommonFA.CommonFAFinanceBudget)
35(SAM.CommonFA.PopulationFME)-->47(SAM.CommonFA.FMESummary)
41(SAM.CommonFA.MetricCost)-->47(SAM.CommonFA.FMESummary)
44(SAM.CommonFA.MetricOutliers)-->47(SAM.CommonFA.FMESummary)
46(SAM.CommonFA.MetricOpportunity)-->47(SAM.CommonFA.FMESummary)
40(SAM.CommonFA.OPVisits)-->47(SAM.CommonFA.FMESummary)
38(SAM.CommonFA.CommonFAFinanceRefund)-->47(SAM.CommonFA.FMESummary)
43(SAM.CommonFA.CommonFAFinancePicuDays)-->47(SAM.CommonFA.FMESummary)
42(SAM.CommonFA.CommonFAFinanceNurseryDays)-->47(SAM.CommonFA.FMESummary)
45(SAM.CommonFA.MetricPreOpportunity)-->46(SAM.CommonFA.MetricOpportunity)
35(SAM.CommonFA.PopulationFME)-->45(SAM.CommonFA.MetricPreOpportunity)
41(SAM.CommonFA.MetricCost)-->45(SAM.CommonFA.MetricPreOpportunity)
41(SAM.CommonFA.MetricCost)-->44(SAM.CommonFA.MetricOutliers)
39(SAM.CommonFA.ChargeDetails)-->43(SAM.CommonFA.CommonFAFinancePicuDays)
39(SAM.CommonFA.ChargeDetails)-->42(SAM.CommonFA.CommonFAFinanceNurseryDays)
39(SAM.CommonFA.ChargeDetails)-->41(SAM.CommonFA.MetricCost)
39(SAM.CommonFA.ChargeDetails)-->40(SAM.CommonFA.OPVisits)
35(SAM.CommonFA.PopulationFME)-->39(SAM.CommonFA.ChargeDetails)
36(SAM.CommonFA.PremetricCost)-->39(SAM.CommonFA.ChargeDetails)
{% endmermaid %}

{% mermaid graph TD %}
A[Christmas] -->|Get money| B(Go shopping)
B --> C{Let me thinksssss<br>ssssssssssssssssssssss<br>sssssssssssssssssssssssssss}
C -->|One| D[Laptop]
C -->|Two| E[iPhone]
C -->|Three| F[Car]
{% endmermaid %}


## Quick Book of Git

### Staged Files
```bash
$git add [files]
```
### Commited Files
```bash
$git commit [files]
```
### Unstaged the files
```bash
$git restore [files]
```
### List branches
```bash
$git branch
```
### Checkout and create a new branch
```bash
$git checkout -b [branch name]
```
### Switch branch
```bash
$git checkout [branch name]
```

### Review the log

```bash
$git log
```



## Git integration with Vscode

**Config VSCode as the Editor**

```bash
$git config --global core.editor "code --wait"
```
**Install the Gitlens to view the commit message**

Press`Shift + Command + P`, then type `Install extentions`enter to find the Gitlens

 **Install the Git Graph to view the commit history**

Press`Shift + Command + P`, then type `Install extentions`enter to find the `Git Graph` or `Git history `as a alternative



_其实我只是想实验Mermaid的flowchart才写的这篇 つ﹏⊂_

_To Be Continue ..._


