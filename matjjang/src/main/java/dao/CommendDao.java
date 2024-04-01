package dao;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class CommendDao {

	private JdbcTemplate jdbc;
	
	public CommendDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

}
