# ABAPer


```ABAP

TYPES: BEGIN OF TYP_ALV,
         ROWID TYPE I,             "流水号
         BWART TYPE BWART,         "移动类型
         SGTXT TYPE SGTXT,         "移动原因
         KOSTL TYPE KOSTL,         "成本中心
         MATNR TYPE MATNR,         "物料编码
         MAKTX TYPE MAKTX,         "物料描述
         WERKS TYPE WERKS_D,       "工厂
         BDMNG TYPE RESB-BDMNG,    "需求数量
         MEINS TYPE RESB-MEINS,    "单位
         CHARG TYPE CHARG_D,       "批号
         LGORT TYPE LGORT_D,       "库存地点
         BDTER TYPE BDTER,         "需求日期
         CHK   TYPE C,             "选择项
         RSNUM TYPE RSNUM,         "预留号
         MSG   TYPE CHAR200,       "错误信息
         ICON  TYPE ICON_D,        "状态
       END OF TYP_ALV.

```