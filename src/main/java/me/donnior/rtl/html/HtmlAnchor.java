package me.donnior.rtl.html;

import com.google.common.base.Strings;

public class HtmlAnchor extends HtmlElement {

	private String content;
	private String href;
	
	public void setHref(String href) {
		this.href = href;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	@Override
	String tagContent() {
		return Strings.nullToEmpty(content);
	}

	@Override
	public String writeRequiredAttributes() {
		return attributeString("href", this.href);
	}

	@Override
	public String name() {
		return "a";
	}
	
}
