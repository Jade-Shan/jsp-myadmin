<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
public int mysql_num_rows(ResultSet rset) throws SQLException {
	int current = 0;
	try {
		if (!rset.isBeforeFirst()) {
			current = rset.getRow();
			rset.beforeFirst();
		}
	} catch (Exception e) {
		return -1;
	}

	int number_of_rows=0;
	while (rset.next()) {
		number_of_rows++;
	}

	if (current!=0) {
		rset.absolute(current);
	} else {
		rset.beforeFirst();
	}
	return number_of_rows;
}
%>