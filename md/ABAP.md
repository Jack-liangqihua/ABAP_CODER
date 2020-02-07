<!--
<script src="D:\\Git\\ABAP_CODER\\ext\\mermaid.full.min.js"></script>
-->

<script src="https://raw.githubusercontent.com/Jack-liangqihua/ABAP_CODER/master/js/mermaid.full.min.js"></script>

# ABAP 

## 目录
[行内文字有代码](#行内文字有代码)

[表格的画法](#表格的画法)

[图片用法](#图片用法)
 
### 行内文字有代码 
```
`graph LR` `A --> B`

```
效果：`graph LR` `A --> B`

 
### 表格的画法 

第一格表头 | 第二格表头
--------- | -------------
内容单元格 第一列第一格 | 内容单元格第二列第一格
内容单元格 第一列第二格 多加文字 | 内容单元格第二列第二格
 
### 图片用法

![图片](https://raw.githubusercontent.com/Jack-liangqihua/ABAP_CODER/master/pic/ABAP1.gif "图片1")

<!--  ![图片](D://Git/ABAP_CODER/pic/ABAP1.gif "图片1")  -->
```
用法：
![图片](https://raw.githubusercontent.com/Jack-liangqihua/ABAP_CODER/master/pic/ABAP1.bmp "图片1")
```



<div class="mermaid">
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
</div>