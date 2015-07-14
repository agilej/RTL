package org.agilej.rtl.template;

import javax.servlet.http.HttpServletRequest;

public interface TemplateResolver {
	
	String resolveTemplateName(HttpServletRequest request);

}
