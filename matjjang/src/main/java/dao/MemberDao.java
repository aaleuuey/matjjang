package dao;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import vo.MemberInfo;

public class MemberDao {
	private JdbcTemplate jdbc;

	public MemberDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public int chkId(String uid) {
		String sql = "select count(*) from t_member_info where mi_id = '" + uid + "' ";
		
		System.out.println(sql);
		
		int result = jdbc.queryForObject(sql, Integer.class);
		return result;
	}

	public int memberInsert(MemberInfo mi) {
		String sql = "insert into t_member_info values ('" + mi.getMi_id() + "', '" + mi.getMi_pw() + "', '" + mi.getMi_name() + "', '" + mi.getMi_phone() + 
				"', '" + mi.getMi_birth() + "', '" + mi.getMi_gender() + "', '" + mi.getMi_email() + "', 'a', now(), null)";
		
		int result = jdbc.update(sql);
		
		return result;
	}

	public int getBookMarkCount(String miid) {
		String sql = "select count(*) from t_store_bookmark where mi_id = '" + miid + "' ";
		
		int result = jdbc.queryForObject(sql, Integer.class);
		
		return result;
	}

	public int getReviewCount(String miid) {
		String sql = "select count(*) from t_store_reply where mi_id = '" + miid + "' ";
		
		int result = jdbc.queryForObject(sql, Integer.class);
		
		return result;
	}

	public int getHeartCount(String miid) {
		String sql = "select count(*) from t_store_heart where mi_id = '" + miid + "' ";
		
		int result = jdbc.queryForObject(sql, Integer.class);
		
		return result;
	}
}
