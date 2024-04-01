package dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class ReviewDao {
	private JdbcTemplate jdbc;
	
	public ReviewDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

}
