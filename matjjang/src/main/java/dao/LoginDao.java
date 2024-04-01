package dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class LoginDao {
private JdbcTemplate jdbc;
	
	public LoginDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

}
