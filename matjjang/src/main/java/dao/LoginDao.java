package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import vo.*;

public class LoginDao {
private JdbcTemplate jdbc;
	
	public LoginDao(DataSource dataSource) {
		this.jdbc = new JdbcTemplate(dataSource);
	}

	public MemberInfo getLoginInfo(String uid, String pwd) {
		String sql = "select * from t_member_info where mi_id = ? and mi_pw = ? and mi_status = 'a'";
		
		List<MemberInfo> results = jdbc.query(sql, new RowMapper<MemberInfo>() {
			// 각 행에 대한 매핑을 정의
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
		}, uid, pwd); // SQL 쿼리의 ? 자리에 해당하는 값을 넣어줌

		sql = "update t_member_info set mi_lastlogin = now() where mi_id = '" + uid + "' and mi_status != 'c'";
		
		System.out.println(sql);
		
		// 결과 리스트가 비어있으면 null을 반환하고, 그렇지 않으면 첫 번째 결과를 반환
		return results.isEmpty() ? null : results.get(0);
	}

}
