# ABAP_CODER
Goals determine what youre going to be.
                      --Julius Erving 
人生的奋斗目标决定你将成为什么样的人。


目标，实践。


 
 

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

更新本地信息到远程仓库步骤说明1：

1、git add '文件名称'

2、git commit -m '更新说明'

3、git push  ABAP_CODER master . 

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

更新远程信息到本地仓库步骤说明：

1、git remote -v                      查看远程分支

2、git fetch ABAP_CODER master:temp   从远程获取最新版本到本地

3、git diff temp                      比较本地仓库与下载的temp分支

4、git merge temp                     合并temp分支到本地的master分支

5、git branch -d temp                 删除temp分支


## 目录结构
* **[数据下载.docx](https://github.com/Jack-liangqihua/ABAP_CODER/blob/master/doc/%E6%95%B0%E6%8D%AE%E4%B8%8B%E8%BD%BD.docx)**
从SAP下载数据并存储到本地文件中