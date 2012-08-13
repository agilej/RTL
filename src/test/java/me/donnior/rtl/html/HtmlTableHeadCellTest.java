package me.donnior.rtl.html;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class HtmlTableHeadCellTest {

	@Test
	public void test() {
		String content = "test@email.com";
		HtmlTableHeadCell cell = new HtmlTableHeadCell(content);
		assertEquals("<th>"+content+"</th>", cell.toHtml());
		
		content = "<a href='#' title='title'>Link</a>";
		cell = new HtmlTableHeadCell(content);
		assertEquals("<th>"+content+"</th>", cell.toHtml());
		
		content = null;
		cell = new HtmlTableHeadCell(content);
		assertEquals("<th></th>", cell.toHtml());
		
		
	}

}
