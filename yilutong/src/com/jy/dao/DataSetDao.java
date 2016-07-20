package com.jy.dao;

import java.util.List;

import com.jy.model.Maps;

public interface DataSetDao {
	List<Maps> updatestatefromtime();
	int updatestatebycarnos(List<String>carnos);
	int checkweekdata();
	int checkmondata();
	int checkolddata();
	
	int insertmon();
	int insertold();
	
	int deleteweek();
	int deletemon();
}
