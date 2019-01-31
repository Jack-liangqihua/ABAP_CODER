package com.cks.sap;
 

import java.util.*;
import java.io.*;
 
@SuppressWarnings({"serial","rawtypes","unchecked"})
public class ReadProperties extends java.util.Properties {
	
	public ArrayList orderedKeys = new ArrayList();
	
	public ReadProperties() {
		super();
	}
	
	public ReadProperties(java.util.Properties defaults) {
		super(defaults);
	}
	
	public synchronized Iterator getKeysIterator() {
		return orderedKeys.iterator();
	} 
	
	public static ReadProperties load(String name)
			throws IOException {
		ReadProperties props = null;
		java.io.InputStream is =
				ReadProperties.class.getResourceAsStream(name);
		if ( is != null ) {
			props = new ReadProperties();
			props.load(is);
			return props;
		} else {
			if ( ! name.startsWith("/") ) {
				return load("/" + name);
			} else {
				throw new IOException("Properties could not be loaded.");
			}
		}
	}
	
	public synchronized Object put(Object key, Object value) {
		Object obj = super.put(key, value);
		orderedKeys.add(key);
		return obj;
	}
	
	public synchronized Object remove(Object key) {
		Object obj = super.remove(key);
		orderedKeys.remove(key);
		return obj;
	}
	
}
