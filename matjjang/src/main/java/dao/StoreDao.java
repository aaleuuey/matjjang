package dao;

import java.sql.ResultSet;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import vo.*;

public class StoreDao {

	private JdbcTemplate jdbc;
	
	public StoreDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public List<StoreInfo> getStoreList(PageInfo pi) {
		String sql = "select a.*, b.sc_id from t_store_info a, t_store_ctgr b " + pi.getWhere() + " and a.sc_id = b.sc_id group by a.si_id" + pi.getOrderby() + " limit " + ((pi.getCpage() - 1) * pi.getPsize()) + ", " + pi.getPsize();
		
		System.out.println(sql);
		List<StoreInfo> storeList = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			StoreInfo si = new StoreInfo();
			si.setSc_id(rs.getString("sc_id"));
			si.setSi_id(rs.getString("si_id"));
			si.setSi_name(rs.getString("si_name"));
			si.setSi_img1(rs.getString("si_img1"));
			si.setSi_date(rs.getString("si_date"));
			String siweek = "";
			if (rs.getString("si_week").equals("��,ȭ,��,��,��,��,��"))		siweek = "����";
			else if (rs.getString("si_week").equals("��,ȭ,��,��,��"))		siweek = "����";
			else 														siweek = rs.getString("si_week");
			si.setSi_week(siweek);
			si.setSi_open(rs.getString("si_open"));
			si.setSi_close(rs.getString("si_close"));
			si.setSi_parking(rs.getString("si_parking"));
			si.setSi_addr1(rs.getString("si_addr1"));
			si.setSi_addr2(rs.getString("si_addr2"));
			si.setSi_read(rs.getInt("si_read"));
			si.setSi_isview(rs.getString("si_isview"));
			si.setSi_star(rs.getFloat("si_star"));
		
			return si;
		});
		return storeList;
	}
	
	public int getStoreListCount(String where) {
		String sql = "select count(*) from t_store_info a " + where;

		int rcnt = jdbc.queryForObject(sql, Integer.class);
		return rcnt;
	}

	public List<StoreInfo> getStoreView(String siid) {
		String sql = "select * from t_store_info a where si_isview = 'y' and si_id = '" + siid + "' ";
		
		System.out.println(sql);
		
		List<StoreInfo> storeList = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			StoreInfo si = new StoreInfo();
			si.setSi_id(rs.getString("si_id"));
			si.setSi_name(rs.getString("si_name"));
			si.setSi_img1(rs.getString("si_img1"));
			si.setSi_img2(rs.getString("si_img2"));
			si.setSi_img3(rs.getString("si_img3"));
			si.setSi_star(rs.getFloat("si_star"));
			String siweek = "";
			if (rs.getString("si_week").equals("��,ȭ,��,��,��,��,��"))		siweek = "����";
			else if (rs.getString("si_week").equals("��,ȭ,��,��,��"))		siweek = "����";
			else 														siweek = rs.getString("si_week");
			si.setSi_week(siweek);
			si.setSi_open(rs.getString("si_open"));
			si.setSi_close(rs.getString("si_close"));
			si.setSi_parking(rs.getString("si_parking"));
			si.setSi_addr1(rs.getString("si_addr1"));
			si.setSi_addr2(rs.getString("si_addr2"));
			si.setSi_lat(rs.getString("si_lat"));
			si.setSi_lng(rs.getString("si_lng"));
			si.setSi_number(rs.getString("si_number"));
			si.setSi_explan(rs.getString("si_explan"));
			si.setSi_read(rs.getInt("si_read"));
			
			return si;
		});
		return storeList;
	}

	public List<StoreReplyList> getStoreReplyList(String siid) {
		String sql = "select a.*, b.mi_id, b.mi_name from t_store_reply a join t_member_info b "
						+ "on a.mi_id = b.mi_id where a.sr_isview = 'y' and a.si_id = '" + siid + "' ";
	
		List<StoreReplyList> storeReplyList = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			StoreReplyList srl = new StoreReplyList();
			srl.setSr_idx(rs.getInt("sr_idx"));
			srl.setSi_id(rs.getString("si_id"));
			srl.setMi_name(rs.getString("mi_name"));
			srl.setSr_star(rs.getString("sr_star")); 
			srl.setSr_content(rs.getString("sr_content"));
			srl.setSr_good(rs.getInt("sr_good")); 
			srl.setSr_img1(rs.getString("sr_img1"));
			srl.setSr_img2(rs.getString("sr_img2"));
			srl.setSr_img3(rs.getString("sr_img3"));
			
			return srl;
		});
		return storeReplyList;
	}

	public int getStoreReplyInsert(StoreReplyList srl) {
		String sql = "insert into t_store_reply (si_id, mi_id, sr_star, sr_content, sr_good, sr_img1, sr_img2, sr_img3) values (?, ?, ?, ?, ?, ?, ?, ?)";
		int result = jdbc.update(sql, 
				srl.getSi_id(), srl.getMi_id(), srl.getSr_star(), srl.getSr_content(), srl.getSr_good(), 
				srl.getSr_img1(), srl.getSr_img2(), srl.getSr_img3()
		);
		
		return result;
	}

}
