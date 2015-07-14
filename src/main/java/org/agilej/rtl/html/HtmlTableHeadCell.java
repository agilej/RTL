package org.agilej.rtl.html;


public class HtmlTableHeadCell extends HtmlTableCell{
	
	public HtmlTableHeadCell(String content) {
		super(content);
	}

	@Override
	public String name() {
		return "th";
	}
}
