package me.donnior.rtl.html;

import java.util.ArrayList;
import java.util.List;

public class HtmlTableRow {
	
	private int row;
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
		sb.append("<tr>");
		for(HtmlTableCell cell : this.cells){
			sb.append(cell.toHtml());
		}
		sb.append("</tr>");
		return sb.toString();
	}
	
}
