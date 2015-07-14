package org.agilej.rtl.html;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class HtmlTableCellTest {

	@Test
	public void test() {
		String content = "test@email.com";
		HtmlTableCell cell = new HtmlTableCell(content);
		assertEquals("<td>"+content+"</td>", cell.toHtml());
		
		content = "<a href='#' title='title'>Link</a>";
		cell = new HtmlTableCell(content);
		assertEquals("<td>"+content+"</td>", cell.toHtml());
		
		content = null;
		cell = new HtmlTableCell(content);
		assertEquals("<td></td>", cell.toHtml());
		
		
	}

}
