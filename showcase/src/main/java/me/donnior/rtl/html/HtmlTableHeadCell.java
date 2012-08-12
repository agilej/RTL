package me.donnior.rtl.html;

public class HtmlTableHeadCell extends HtmlTableCell{
	
	public HtmlTableHeadCell(String content) {
		super(content);
	}

	public String toHtml(){
		 return "<th>"+this.getContent()+"</th>";
	}
}
