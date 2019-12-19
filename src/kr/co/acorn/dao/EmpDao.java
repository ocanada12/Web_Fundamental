package kr.co.acorn.dao;

import java.util.ArrayList;

import kr.co.acorn.dto.EmpDto;

public class EmpDao {
	private static EmpDao single;

	private EmpDao() {
	}

	public static EmpDao getInstance() {
		if (single == null) {
			single = new EmpDao();
		}
		return single;
	}
}