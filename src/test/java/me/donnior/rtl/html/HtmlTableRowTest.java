package me.donnior.rtl.html;

import static org.junit.Assert.*;

import org.junit.Test;

public class HtmlTableRowTest {

	@Test
	public void test() {
		HtmlTableRow row = new HtmlTableRow(0);
		row.addCell(new HtmlTableCell("title"));
		row.addCell(new HtmlTableCell("status"));
		String expected = "<tr class=\"odd\"><td>title</td><td>status</td></tr>";
		assertEquals(expected, row.toHtml());
	}

}
