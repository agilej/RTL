package me.donnior.rtl.html;

import static org.junit.Assert.*;

import org.junit.Test;

public class HtmlTableTest {

	@Test
	public void test() {
		HtmlTable table = new HtmlTable(2);
		table.addHeadCell("index");
		table.addHeadCell(new HtmlTableHeadCell("login"));
		table.addBodyCellAtRow(0, "1");
		table.addBodyCellAtRow(0, "dongming.xie");
		table.addBodyCellAtRow(1, "2");
		table.addBodyCellAtRow(1, "javeer");
		String result = "<table><thead><tr><th>index</th><th>login</th></tr></thead><tbody>"+
						"<tr class=\"odd\"><td>1</td><td>dongming.xie</td></tr>"+
						"<tr class=\"even\"><td>2</td><td>javeer</td></tr>"+
						"</tbody></table>";
		assertEquals(result, table.toHtml());
	}

}
