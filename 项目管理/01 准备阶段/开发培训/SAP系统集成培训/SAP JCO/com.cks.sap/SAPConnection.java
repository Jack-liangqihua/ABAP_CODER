package com.cks.sap;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sap.mw.jco.IRepository;
import com.sap.mw.jco.JCO;

@SuppressWarnings({ "deprecation", "unused" })
public class SAPConnection {

	static final String POOL_NAME = "ConnectionPool";
	static final String CHAR_ENCODING = "gbk";
	static final String CHARSET_NAME = "8859_1";
	// private JCO.Client aConnection;
	private IRepository aRepository;
	String encyptionInfo = "";

	public SAPConnection() {
		createConnection();
		retrieveRepository();
	}

	private void createConnection() {
		try {
			JCO.Pool pool = JCO.getClientPoolManager().getPool(POOL_NAME);
			if (pool == null) {
				ReadProperties logonProperties = ReadProperties.load("sap_conf.properties");
				JCO.addClientPool(POOL_NAME, // pool name
						15, // maximum number of connections
						logonProperties); // properties
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void releaseConnection(JCO.Client aConnection) {
		JCO.releaseClient(aConnection);
	}

	private void retrieveRepository() {
		try {
			aRepository = new JCO.Repository("SAPRep", POOL_NAME);
		} catch (Exception ex) {
			System.out.println("Failed to retrieve SAP repository");
		}
	}

	public JCO.Function getFunction(String name) {
		try {
			return aRepository.getFunctionTemplate(name.toUpperCase()).getFunction();
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

	public void ReleaseClient(JCO.Client client) {
		try {
			if (client != null) {
				JCO.releaseClient(client);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
 
}
