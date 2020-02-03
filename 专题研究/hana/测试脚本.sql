select * from "_SYS_BIC"."zaomei.fi/CALC_FI001"  where KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'  
select sum(ZNETWR) from   "_SYS_BIC"."zaomei.fi/FI101" where KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'  
SELECT TOP 200 "NAME1", "KTOKD", "BUKRS", "WERKS", "MANDT", "VKORG", "KUNNR", "WAERK", "VTEXT", sum("ZNETWR") AS "ZNETWR" FROM "_SYS_BIC"."zaomei.fi/CALC_FI001" GROUP BY "NAME1", "KTOKD", "BUKRS", "WERKS", "MANDT", "VKORG", "KUNNR", "WAERK", "VTEXT"

select sum(ZNETWR)  from  "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_COST"  where  KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000' 

select sum(ZNETWR)  from  "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_PAY"  where  KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'
select sum(ZNETWR)  from   "_SYS_BIC"."zaomei.fi/FI002"  where  KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'



select sum(ZNETWR)  from "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_PAY"  where  KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'
group by   KUNNR, MANDT, VKORG, WAERK, WERKS



select *  from "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_PAY"  where   KUNNR='0000101542' and MANDT= '800' and KTOKD= 'Z101' and VKORG= '1000' and WAERK= 'CNY' and WERKS= '1000'

select * from "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_COST"  where   KUNNR='0000101992' and MANDT= '800' and KTOKD= 'Z101' and VKORG= '1500' and WAERK= 'CNY' and WERKS= '1000'
select * from "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_PAY"  where   KUNNR='0000101992' and MANDT= '800' and KTOKD= 'Z101' and VKORG= '1500' and WAERK= 'CNY' and WERKS= '1000'

 

 SELECT * FROM  "_SYS_BIC"."zaomei.fi/FI102" WHERE KUNNR = '0000100300'
  
SELECT * FROM "SAPABAP1"."ZCRM_KHHK_COST" WHERE KUNNR = '0000100300' ORDER BY WDATE


select DENSE_RANK() OVER(order by  a.vbeln desc ) as den_rank, * 
from  "SAPABAP1"."ZCRM_KHHK_COST" as a   where mandt = 800
 
select a.a,a.b,a.c,a.d,sum(case when b.b=1 then b.c else -b.c end) e 
from str a inner join str b on a.a=b.a 
where a.d>=b.d group by a.d,a.a,a.c,a.b 
order by a.a,a.d


select sum(ZNETWR)  from  "_SYS_BIC"."zaomei.fi/CALC_CRM_KHHK_COST"  where  KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'
select sum(ZNETWR)  from   "_SYS_BIC"."zaomei.fi/FI001"  where  KTOKD='Z101' and KUNNR='0000101122' and MANDT= '800' and VKORG= '1400' and WAERK= 'CNY' and  WERKS= '1000'




 
DELETE FROM zmessage_box WHERE ZP_MSG = '111111111111'

 select * from zmessage_box;
 

CREATE TABLE zmessage_box (zp_msg VARCHAR(200), ztstamp TIMESTAMP);

CREATE PROCEDURE zins_msg_proc (zp_msg VARCHAR(200)) LANGUAGE SQLSCRIPT AS
BEGIN
	INSERT INTO zmessage_box VALUES (:zp_msg, CURRENT_TIMESTAMP);
END;


call zins_msg_proc('111111111111');
call "SAPABAP1"."CL_DEMO_AMDP_CONNECTION=>GET_SCARR" (800,null)


select Top 200  VBELN , NETWR  from  "SAPABAP1"."VBAK" ;


SELECT top 20  VBELN , NETWR,
    CASE
        WHEN NETWR < 120 THEN 'LOW'
        WHEN NETWR >= 120 AND NETWR < 1000 THEN 'MEDIUM'
        ELSE 'HIGH'
    END AS RATING
FROM "SAPABAP1"."VBAK";



SELECT MANDT,WERKS,VKORG,VTEXT,KUNNR, SUM(ZNETWR) AS ZNETWR ,WAERK ,KTOKD ,NAME1 FROM "_SYS_BIC"."zaomei.fi/FI101"   WHERE ZNETWR > 0  GROUP BY MANDT,WERKS,VKORG,VTEXT,KUNNR,WAERK,KTOKD ,NAME1 






