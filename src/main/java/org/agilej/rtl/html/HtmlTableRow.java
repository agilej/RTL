package org.agilej.rtl.html;

import java.util.ArrayList;
import java.util.List;

public class HtmlTableRow {
	
	private int row;  //0 based
	private List<HtmlTableCell> cells;

	public HtmlTableRow(int row){
		this.row = row;
		this.cells = new ArrayList<HtmlTableCell>();
	}
	
	@Override
	public int hashCode() {
		return row;
	}

	public void addCell(HtmlTableCell htmlTableCell) {
		this.cells.add(htmlTableCell);
	}

	public String toHtml() {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr");
		sb.append(this.odd() ? " class=\"odd\"" : " class=\"even\"");
		sb.append(">");
		for(HtmlTableCell cell : this.cells){
			sb.append(cell.toHtml());
		}
		sb.append("</tr>");
		return sb.toString();
	}
	
	protected boolean odd(){
		return (row + 1) % 2 != 0;
	}
	
	protected boolean even(){
		return !this.odd();
	}
}
