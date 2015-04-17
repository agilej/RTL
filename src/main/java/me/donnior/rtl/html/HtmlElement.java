package me.donnior.rtl.html;

import me.donnior.rtl.util.Strings;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;


public abstract class HtmlElement implements DynamicAttributeSupport {
	
	private static final String BlankSpace = " ";
	private Map<String, String> dynamicAttributes; 

	public void setDynamicAttributes(Map<String, String> dynamicAttributes) {
		this.dynamicAttributes = dynamicAttributes;
	}

	public Map<String, String> getDynamicAttributes() {
		return (this.dynamicAttributes != null) ? this.dynamicAttributes : new HashMap<String, String>() ;
	}

	public String toHtml(){
		StringBuilder sb = new StringBuilder();
		sb.append(this.getStartTag());
		sb.append(this.tagContent());
		sb.append(this.closeTag());
		return sb.toString();
	}

	abstract String tagContent();

	private String closeTag() {
		StringBuilder sb = new StringBuilder();
		sb.append("</").append(name()).append(">");
		return sb.toString();
	}

	private String getStartTag() {
		StringBuilder sb = new StringBuilder();
		sb.append("<").append(name());
		
		String requiredAttrs = this.writeRequiredAttributes();
		if(!Strings.nullToEmpty(requiredAttrs).isEmpty()){
			sb.append(BlankSpace);
			sb.append(requiredAttrs);
		}
		if(!this.getDynamicAttributes().isEmpty()){
			sb.append(BlankSpace);
			sb.append(this.writeDynamicAttributes());	
		}
		
		sb.append(">");
		return sb.toString();
	}

	

	private String writeDynamicAttributes() {
		StringBuilder sb = new StringBuilder();
		Iterator<Map.Entry<String, String>> entry = this.getDynamicAttributes().entrySet().iterator();
	 	while(entry.hasNext()){
	 		Entry<String, String> e = entry.next();
	 		sb.append(BlankSpace).append(this.attributeString(e.getKey(), e.getValue()));
	 	}
		return sb.toString();
	}
	
	protected String attributeString(String key, String value){
		StringBuilder sb = new StringBuilder();
		sb.append(key);
		sb.append("=");
		sb.append("\"");
		sb.append(Strings.nullToEmpty(value));
		sb.append("\"");
		return sb.toString();
	}
	
	public abstract String writeRequiredAttributes();
	public abstract String name();
	
}
