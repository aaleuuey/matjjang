package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vo.*;

public class StoreDao {
	private JdbcTemplate jdbc;
	
	public StoreDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public int productInsert(StoreInfo si) {
		Random random = new Random();
		int randomValue = random.nextInt(1000); // 0부터 999 사이의 난수를 생성
		
		String sql = "insert into t_store_info (si_id, sc_id, si_name, si_img1, si_img2, si_img3, si_star, si_week, si_open, si_close, si_parking, si_addr1, si_addr2, si_number, si_explan, si_isview, ai_idx) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 1)";
		int result = jdbc.update(sql, si.getSc_id() + String.format("%03d", randomValue), si.getSc_id(), si.getSi_name(), si.getSi_img1(), si.getSi_img2(), si.getSi_img3(), si.getSi_star(), si.getSi_week(), si.getSi_open(), si.getSi_close(), si.getSi_parking(), si.getSi_addr1(), si.getSi_addr2(), si.getSi_number(), si.getSi_explan(), si.getSi_isview());

		
		return result;
	}

	public List<StoreInfo> getStoreList(PageInfo pi) {
		String sql = "select * from t_store_info where si_isview = 'y' group by si_id limit " + ((pi.getCpage() - 1) * pi.getPsize()) + ", " + pi.getPsize();
		
		System.out.println(sql);
		
		List<StoreInfo> storeList = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			StoreInfo si = new StoreInfo();
			si.setSi_name(rs.getString("si_name"));
			si.setSi_img1(rs.getString("si_img1"));
			si.setSi_date(rs.getString("si_date"));
			si.setSi_week(rs.getString("si_week"));
			si.setSi_open(rs.getString("si_open"));
			si.setSi_close(rs.getString("si_close"));
			si.setSi_parking(rs.getString("si_parking"));
			si.setSi_addr1(rs.getString("si_addr1"));
			si.setSi_addr2(rs.getString("si_addr2"));
			si.setSi_read(rs.getInt("si_read"));
			si.setSi_isview(rs.getString("si_isview"));
			si.setSi_week(rs.getString("si_week"));
			
			return si;
		});
		return storeList;
	}

	public int getStoreListCount() {
		String sql = "select count(*) from t_store_info where si_isview = 'y'";
		int rcnt = jdbc.queryForObject(sql, Integer.class);
		return rcnt;
	}
}
