package dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import vo.BookmarkImageInfo;
import vo.BookmarkInfo;
import vo.MemberInfo;
import vo.StoreInfo;

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
		
		sql = "insert into t_bookmark_folder(si_id, mi_id, bf_title) values (null, '" + mi.getMi_id() + "', '¸ÀÁý Æú´õ')"; 
		result = jdbc.update(sql);
		
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

	public List<BookmarkInfo> getBookmarkView(String miid) {
		String sql = "select * from t_bookmark_folder where mi_id = '" + miid + "' order by bf_idx desc";
		System.out.println(sql);
		
		List<BookmarkInfo> bookmarkView = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			BookmarkInfo bk = new BookmarkInfo();
			bk.setBf_title(rs.getString("bf_title"));
			bk.setBf_cnt(rs.getString("bf_cnt"));
			bk.setBf_idx(rs.getInt("bf_idx"));
			
			return bk;
		});
		return bookmarkView;
	}

	public List<BookmarkImageInfo> getBookmarkImages(String miid) {
		String sql = "select a.*, b.mi_id, b.bf_title from t_bookmark_folder_images a, t_bookmark_folder b where a.bf_idx = b.bf_idx and mi_id = '" + miid + "' ";
		
		System.out.println(sql);
		
		List<BookmarkImageInfo> bookmarkImages = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			BookmarkImageInfo bki = new BookmarkImageInfo();
			bki.setSi_id(rs.getString("si_id"));
			bki.setBfi_img(rs.getString("bfi_img"));
			bki.setBf_idx(rs.getInt("bf_idx"));
			
			return bki;
		});
		return bookmarkImages;
	}
}
