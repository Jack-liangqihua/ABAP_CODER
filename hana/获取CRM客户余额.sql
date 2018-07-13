/*************************************
		创建一个存储过程计算CRM客户欠款余额
**************************************/

DROP PROCEDURE AOMEI_PROC_GET_CRM_DEBT;

CREATE PROCEDURE AOMEI_PROC_GET_CRM_DEBT(
					IN	ZNETWR DECIMAL(15,2) ,
					IN	MANDT	INT, 
					IN	WERKS	INT,
					IN	VKORG	INT, 
					IN	KUNNR	VARCHAR(10), 
					IN	WAERK	VARCHAR(5),  
					IN	KTOKD	VARCHAR(4),
					IN	BUKRS	INT,
					--OUT LV_FLAG INT
					OUT DEBT "_SYS_BIC"."zaomei.fi/FI001/proc/tabletype/VAR_OUT"
						)
		LANGUAGE SQLSCRIPT
		SQL SECURITY DEFINER
		--READS SQL DATA
	AS
		--1、初始化，定义临时变量
		LV_SUM 		DECIMAL(15,2); 
		LV_ZNETWR 	DECIMAL(15,2); 
		LV_FLAG INT := 1; 

	BEGIN  
	 
	 
	 
	 --游标的定义只能是方在存储过程的AS和BEGIN之间 
	 declare CURSOR C_FH FOR  SELECT A.ZNETWR
							   FROM "_SYS_BIC"."zaomei.fi/FI001" as A 
							   WHERE 	    MANDT = :MANDT
										AND	WERKS = :WERKS
										AND VKORG = :VKORG
										AND KUNNR = :KUNNR
										AND WAERK = :WAERK
										AND KTOKD = :KTOKD
										AND BUKRS = :BUKRS
								ORDER BY VBELN ;
	 
	  
	 
	 OPEN C_FH; --打开游标

	FETCH C_FH INTO LV_ZNETWR; --把游标的第一行数据放进去变量中
	LV_SUM = :LV_ZNETWR + :LV_SUM;
	
	call zins_msg_proc('lv_sum' );
	
	WHILE :LV_SUM < :ZNETWR DO   
	    LV_FLAG = :LV_FLAG+1; 
	    
	call zins_msg_proc('LV_FLAG' + LV_FLAG);
		FETCH C_FH INTO LV_ZNETWR; --继续插入下一行游标数据给变量
	END WHILE; --结束循环
	
	CLOSE C_FH; --关闭游标
	 
	 
	 
	 
	 
	 LT_DEBT = SELECT DENSE_RANK() OVER(order by  VBELN desc ) as zden_rank,* 
	 			FROM "_SYS_BIC"."zaomei.fi/FI001"  
	       		WHERE 	MANDT = :MANDT
					AND	WERKS = :WERKS
					AND VKORG = :VKORG
					AND KUNNR = :KUNNR
					AND WAERK = :WAERK
					AND KTOKD = :KTOKD
					AND BUKRS = :BUKRS
			ORDER BY WDATE,VBELN ;
			
			
		DEBT = SELECT 				A.WDATE, 
								 	A.SVFLG,
								 	A.DLFLG,
								 	A.NETWR,
								 	A.WAERK,
								 	A.DDLX, 
								 	A.MANDT,
								 	A.WERKS,
								 	A.VKORG,
								 	A.KUNAG,
								 	A.KUNNR,
								 	A.BUSNO,
								 	A.VBELN,
								 	A.FJFWR,
								 	A.BTGEW,
								 	A.GEWEI,
								 	A.WADAT_IST, 
								 	A.TEXT,
								 	A.ZNETWR, 
								 	A.ZOVERDUE,
								 	A.NAME1,
				 					A.KTOKD,
									A.BUKRS
				FROM :LT_DEBT AS A
				WHERE zden_rank = :LV_FLAG;
				
			
	 
	/*******************************2按照欠款金额，订单顺序，取得该欠款金额是由那些发货单组成***************************
	declare CURSOR C_FH FOR 
							SELECT  
								 	A.ZNETWR
		   FROM "_SYS_BIC"."zaomei.fi/FI001" as A 
		   WHERE 	    MANDT = :MANDT
					AND	WERKS = :WERKS
					AND VKORG = :VKORG
					AND KUNNR = :KUNNR
					AND WAERK = :WAERK
					AND KTOKD = :KTOKD
					AND BUKRS = :BUKRS
			ORDER BY VBELN ;
	  
	  FOR RESULT AS  C_FH DO  
	    LV_SUM  := :LV_SUM + RESULT.ZNETWR; 
	    IF :LV_SUM > :ZNETWR THEN
	    	break;
	    else
	    	LV_FLAG = :LV_FLAG+1;
	    	CONTINUE;
	    END IF;
	  END FOR;  
	  
	  */
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	   
	END ;
