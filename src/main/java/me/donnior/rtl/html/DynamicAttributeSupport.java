package me.donnior.rtl.html;

import java.util.Map;

public interface DynamicAttributeSupport {

	void setDynamicAttributes(Map<String, String> dynamicAttributes);
	
	Map<String, String> getDynamicAttributes();
	
}
