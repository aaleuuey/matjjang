package dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class KakaoDao {
private JdbcTemplate jdbc;
	
	public KakaoDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}
}
