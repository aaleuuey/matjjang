package dao;

import java.util.ArrayList;
import java.util.Random;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;


import vo.*;

public class StoreDao {
	private JdbcTemplate jdbc;
	
	public StoreDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public int productInsert(StoreInfo si) {
		Random random = new Random();
		int randomValue = random.nextInt(1000); // 0부터 999 사이의 난수를 생성
		
		String sql = "insert into t_store_info (si_id, sc_id, si_name, si_img1, si_img2, si_img3, si_week, si_open, si_close, si_parking, si_addr1, si_addr2, si_number, si_explan, si_isview, ai_idx) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
		int result = jdbc.update(sql, si.getSc_id() + String.format("%03d", randomValue), si.getSc_id(), si.getSi_name(), si.getSi_img1(), si.getSi_img2(), si.getSi_img3(), si.getSi_week(), si.getSi_open(), si.getSi_close(), si.getSi_parking(), si.getSi_addr1(), si.getSi_addr2(), si.getSi_number(), si.getSi_explan(), si.getSi_isview());

		
		return result;
	}
}
