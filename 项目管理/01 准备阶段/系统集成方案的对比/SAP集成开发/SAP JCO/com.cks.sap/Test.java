package com.cks.sap;

import com.sap.mw.jco.JCO;

public class Test {

	@SuppressWarnings("deprecation")
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SAPConnection conn = null;
		JCO.Client client = null;
		try {
			conn = new SAPConnection();
			client = JCO.getClient(conn.POOL_NAME);

			JCO.Function function = conn.getFunction("ZAPI_SD_CUSTOMER_MAINTAIN");
			JCO.ParameterList input = function.getImportParameterList();
			input.setValue("ZH", "SPRAS");
			input.setValue("���仪�ӿڲ���", "NAME1");
			input.setValue("Z001", "KTOKD");
			input.setValue("CN", "LAND1");
			input.setValue("��ɽ", "ORT01");
			input.setValue("��ɽ", "STRAS");
			input.setValue("510005", "KUNNR");
			input.setValue("0000000001", "LZONE");
			client.execute(function);

			JCO.ParameterList result = function.getExportParameterList();
			System.out.println(result.getString("FLAG") + result.getString("MSG") + result.getString("CODE"));

		} catch (JCO.AbapException ex) {
			// TODO: handle exception
			System.out.println(ex.getMessage());
		} finally {
			if (client != null) {
				conn.ReleaseClient(client);
			}
		}

	}

}
