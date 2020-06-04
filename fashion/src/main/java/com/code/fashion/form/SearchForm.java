package com.code.fashion.form;

public class SearchForm {
	private String searchField;
	private String searchKey;
	public SearchForm() {
		super();
	}
	public SearchForm(String searchField, String searchKey) {
		super();
		this.searchField = searchField;
		this.searchKey = searchKey;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
}
