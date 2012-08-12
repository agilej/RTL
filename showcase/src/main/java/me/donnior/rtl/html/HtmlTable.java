package me.donnior.rtl.html;

import java.util.ArrayList;
import java.util.List;

public class HtmlTable {
	
	private List<HtmlTableHeadCell> headCells;
	private List<HtmlTableRow> rows;
	private boolean tableHeadCellFreezoned;
	
	public HtmlTable(int row){
		this.headCells = new ArrayList<HtmlTableHeadCell>();
		this.rows = new ArrayList<HtmlTableRow>(row);
		for(int i=0; i<row; i++){
			this.rows.add(new HtmlTableRow(i));
		}
	}
	
	
	public void freezonHeadCell(){
		this.tableHeadCellFreezoned = true;
	}
	
	public void addHeadCell(String value) {
		this.addHeadCell(new HtmlTableHeadCell(value));
	}

	public void addHeadCell(HtmlTableHeadCell htmlTableHeadCell) {
		if(tableHeadCellFreezoned){
			return;
		}
		this.headCells.add(htmlTableHeadCell);
	}

	public void addBodyCellAtRow(int rowIndex, String content) {
		HtmlTableRow row = this.rows.get(rowIndex);		
		row.addCell(new HtmlTableCell(content));
	}

	public String toHtml() {
		StringBuilder sb = new StringBuilder();
		sb.append("<table><thead><tr>");
		for(HtmlTableHeadCell cell : this.headCells){
			sb.append(cell.toHtml());
		}
		sb.append("</tr></thead>");
		sb.append("<tbody>");
		for(HtmlTableRow row: this.rows){
			sb.append(row.toHtml());
		}
		sb.append("</tbody>");
		sb.append("</table>");		
		return sb.toString();
	}
	
}