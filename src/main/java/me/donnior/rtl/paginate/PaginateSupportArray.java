package me.donnior.rtl.paginate;

import java.util.ArrayList;
import java.util.List;
import java.util.Collection;


public class PaginateSupportArray<E> extends ArrayList<E> implements PaginateSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int total;
	private int pageSize;
	private int page;
	
	
	public PaginateSupportArray(Collection<E> data) {
		super(data);
	}

	public PaginateSupportArray(Collection<E> data, int page, int pageSize, int total) {
		this(data);
		this.page = page;
		this.pageSize = pageSize;
		this.total = total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return this.total;
	}

	
	public int getPageSize() {
		return this.pageSize;
	}

	
	public int getPage() {
		return this.page;
	}
	
	

}