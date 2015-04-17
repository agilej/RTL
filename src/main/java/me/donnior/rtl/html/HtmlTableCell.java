package me.donnior.rtl.html;


import me.donnior.rtl.util.Strings;

public class HtmlTableCell extends HtmlElement{

	protected String content;

	public HtmlTableCell(String content) {
		this.content = (content != null ? content : "");
	}


	@Override
	String tagContent() {
		return Strings.nullToEmpty(content);
	}

	@Override
	public String writeRequiredAttributes() {
		return "";
	}

	@Override
	public String name() {
		return "td";
	}
}
