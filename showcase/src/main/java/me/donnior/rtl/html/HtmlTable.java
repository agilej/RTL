package me.donnior.rtl.html;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.common.base.Strings;

public class HtmlTable implements DynamicAttributeSupport{
	
	private List<HtmlTableHeadCell> headCells;
	private List<HtmlTableRow> rows;
	private boolean tableHeadCellFreezoned;
	private Map<String, String> dynamicAttributes;
	
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
		sb.append(this.getStartTag());
		sb.append("<thead><tr>");
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
	
	@Override
	public void setDynamicAttributes(Map<String, String> dynamicAttributes) {
		if(dynamicAttributes == null){
			dynamicAttributes = new HashMap<String, String>();
		}
		this.dynamicAttributes = dynamicAttributes;
	}
	
	@Override
	public Map<String, String> getDynamicAttributes() {
		return this.dynamicAttributes;
	}
	
	private String getStartTag(){
		StringBuilder sb = new StringBuilder();
		sb.append("<table");
	 	Iterator<Map.Entry<String, String>> entry = this.dynamicAttributes.entrySet().iterator();
	 	while(entry.hasNext()){
	 		Entry<String, String> e = entry.next();
	 		sb.append(" "+e.getKey()+"=\""+Strings.nullToEmpty(e.getValue())+"\"");
	 	}
	 	sb.append(">");
		return sb.toString();
	}
	
}