package me.donnior.rtl.html;

public class HtmlTableCell {

	private String content;

	public HtmlTableCell(String content) {
		this.content = (content != null ? content : "");
	}

	public String toHtml() {
		return "<td>" +content + "</td>";
	}

	public String getContent() {
		return content;
	}
}
