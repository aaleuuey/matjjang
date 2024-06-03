package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vo.MemberInfo;

public class KakaoDao {
private JdbcTemplate jdbc;
	
	public KakaoDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public int isMem(String id) {
		String sql = "select count(*) from t_member_info where mi_id = '" + id + "' and mi_status != 'c'";
		int chkId = jdbc.queryForObject(sql, Integer.class);
		return chkId;
	}

	public int kakaoInsert(MemberInfo mi) {
		String sql = "insert into t_member_info values ('" + mi.getMi_id() + "', '" + mi.getMi_pw() + "', '" + mi.getMi_name() + "', '" + mi.getMi_phone() + 
				"', '" + mi.getMi_birth() + "', '" + mi.getMi_gender() + "', '" + mi.getMi_email() + "', 'a', now(), null)";
		int result = jdbc.update(sql);
		
		sql = "insert into t_bookmark_folder(si_id, mi_id, bf_title) values (null, '" + mi.getMi_id() + "', '¸ÀÁý Æú´õ')";  
		result = jdbc.update(sql);
		
		return result;
	}

	public MemberInfo getLoginInfo(String email) {
		String sql = "select * from t_member_info where mi_email = '" + email + "' and mi_status != 'c'";
		
		List<MemberInfo> results = jdbc.query(sql, new RowMapper<MemberInfo>() {
			public MemberInfo mapRow(ResultSet rs, int rowNum) throws SQLException {
				MemberInfo mi = new MemberInfo();
				mi.setMi_id(rs.getString("mi_id"));
	            mi.setMi_pw(rs.getString("mi_pw"));
	            mi.setMi_name(rs.getString("mi_name"));
	            mi.setMi_gender(rs.getString("mi_gender"));
	            mi.setMi_birth(rs.getString("mi_birth"));
	            mi.setMi_phone(rs.getString("mi_phone"));
	            mi.setMi_email(rs.getString("mi_email"));
	            mi.setMi_status(rs.getString("mi_status"));
	            mi.setMi_date(rs.getString("mi_date"));
	            mi.setMi_lastlogin(rs.getString("mi_lastlogin"));
	            return mi;
			}
		});
		
		sql = "update t_member_info set mi_lastlogin = now() where mi_email = '" + email + "' and mi_status != 'c'";
		int result = jdbc.update(sql);
		
		return results.isEmpty() ? null : results.get(0);
	}
}
