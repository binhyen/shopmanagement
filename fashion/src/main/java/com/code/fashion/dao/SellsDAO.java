package com.code.fashion.dao;

import java.util.List;

import com.code.fashion.model.Report;

public interface SellsDAO {

	public int getNumberOfReport(String format);

	public List<Report> getDayReport(String format);

}
