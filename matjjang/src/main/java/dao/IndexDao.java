package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vo.*;

public class IndexDao {
	private JdbcTemplate jdbc;

	public IndexDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}
}
