package com.libraryManage.DAO;

import javax.sql.*;
import java.util.*;

import org.springframework.jdbc.core.*;
import org.springframework.stereotype.*;

import com.libraryManage.DTO.*;

@Component
public class CheckOutDAO {
	private CheckOutDTO checkOutDTO;
	private JdbcTemplate jdbcTemplate;

	public CheckOutDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public List<CheckOutDTO> selectOverDue() {
		// 연체 도서 받아오기
		List<CheckOutDTO> result = jdbcTemplate.query("SELECT * FROM CHECKOUT WHERE NOW() > RETURN_DUE_DATE;",
				(rs, rowNum) -> {
					CheckOutDTO checkOutDTO = new CheckOutDTO(rs.getString("ISBN"), rs.getString("EMAIL"),
							rs.getDate("RENTAL_DATE"), rs.getDate("RETURN_DUE_DATE"));
					return checkOutDTO;
				});
		return result;
	}

	public List<CheckOutDTO> showAll() {
		// 모든 대여 도서 받아오기
		List<CheckOutDTO> result = jdbcTemplate.query("SELECT * FROM CHECKOUT;", (rs, rowNum) -> {
			CheckOutDTO checkOutDTO = new CheckOutDTO(rs.getString("ISBN"), rs.getString("EMAIL"),
					rs.getDate("RENTAL_DATE"), rs.getDate("RETURN_DUE_DATE"));
			return checkOutDTO;
		});
		return result;
	}

	public void insertCheckOut(String memberEmail, String bookISBN) {
		// 도서 대여
		jdbcTemplate.update("INSERT INTO CHECKOUT(ISBN, EMAIL, RENTAL_DATE, RETURN_DUE_DATE) VALUES('" + bookISBN
				+ "', '" + memberEmail + "', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY));");
	}

	public void returnCheckOut(String memberEmail, String bookISBN) {
		// 도서 반납
		jdbcTemplate.update("DELETE FROM CHECKOUT WHERE ISBN='" + bookISBN + "' AND EMAIL='" + memberEmail + "';");
	}
}
