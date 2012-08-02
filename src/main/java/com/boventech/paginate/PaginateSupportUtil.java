package com.boventech.paginate;

import java.util.List;

public class PaginateSupportUtil {
	
	private PaginateSupportUtil(){}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static PaginateSupportArray<?> pagingList(List<?> list, int total, int page, int pageSize){
		PaginateSupportArray<?> datas=new PaginateSupportArray(list);
		datas.setPage(page);
		datas.setPageSize(pageSize);
		datas.setTotal(total);
		return datas;
	}

}
