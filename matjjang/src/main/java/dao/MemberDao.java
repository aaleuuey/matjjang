package dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import vo.BookmarkImageInfo;
import vo.BookmarkInfo;
import vo.HeartInfo;
import vo.MemberInfo;
import vo.StoreInfo;
import vo.StoreReplyList;

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
		
		sql = "insert into t_bookmark_folder(si_id, mi_id, bf_title) values (null, '" + mi.getMi_id() + "', '맛집 폴더')"; 
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

	public int folderAdd(String miid, String txCont) {
		String sql = "insert into t_bookmark_folder(mi_id, bf_title, bf_cnt) values (?, ?, 0);";
		
		int result = jdbc.update(sql, miid, txCont);
		
		return result;
	}

	public int folderUpdate(String miid, int bfidx, String txCont) {
		String sql = "update t_bookmark_folder set bf_title = ? where mi_id = ? and bf_idx = ?";
		
		int result = jdbc.update(sql, txCont, miid, bfidx);
		
		return result;
	}

	public int folderDelete(String miid, int bfidx) {
		String sql = "delete t_store_bookmark from t_store_bookmark join t_bookmark_folder_images a "
				+ "on t_store_bookmark.si_id = a.si_id join t_bookmark_folder b on a.bf_idx = b.bf_idx where a.bf_idx = " + bfidx;
		int result = jdbc.update(sql);
		
		sql = "delete from t_bookmark_folder_images where bf_idx = " + bfidx;
		result = jdbc.update(sql);
		
		sql = "delete from t_bookmark_folder where mi_id = '" + miid + "' and bf_idx = " + bfidx;
		result = jdbc.update(sql);
		
		return result;
	}

	public List<StoreReplyList> getReplyList(String miid) {
		String sql = "select a.*, b.si_name from t_store_reply a join t_store_info b on a.si_id = b.si_id where mi_id = '" + miid + "' and sr_isview = 'y'";

		List<StoreReplyList> replyList = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			
			StoreReplyList srl = new StoreReplyList();
			srl.setSi_id(rs.getString("si_id"));
			srl.setSi_name(rs.getString("si_name"));
			srl.setSr_star(rs.getString("sr_star"));
			srl.setSr_content(rs.getString("sr_content"));
			srl.setSr_good(rs.getInt("sr_good"));
			srl.setSr_img1(rs.getString("sr_img1"));
			srl.setSr_img2(rs.getString("sr_img2"));
			srl.setSr_img3(rs.getString("sr_img3"));
			srl.setSr_date(rs.getString("sr_date"));
			
			return srl;
		});
		
		return replyList;
	}

	public List<HeartInfo> getHeartInfo(String miid) {
		String sql = "select a.*, b.si_name, b.si_img1, b.si_star, b.si_addr1, b.si_open, b.si_close from t_store_heart a join t_store_info b on a.si_id = b.si_id where mi_id = '" + miid + "'";
		
		List<HeartInfo> heartInfo = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			HeartInfo hi = new HeartInfo();
			hi.setMi_id(rs.getString("mi_id"));
			hi.setSi_id(rs.getString("si_id"));
			hi.setSi_name(rs.getString("si_name"));
			hi.setSi_img1(rs.getString("si_img1"));
			hi.setSi_star(rs.getString("si_star"));
			hi.setSi_addr1(rs.getString("si_addr1"));
			hi.setSi_open(rs.getString("si_open"));
			hi.setSi_close(rs.getString("si_close"));
			
			return hi;
		});
		
		return heartInfo;
	}

	public List<MemberInfo> getMemberInfo(String miid) {
		String sql = "select * from t_member_info where mi_id = '" + miid + "'";
		
		List<MemberInfo> memberInfo = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			MemberInfo mi = new MemberInfo();
			mi.setMi_name(rs.getString("mi_name"));
			mi.setMi_phone(rs.getString("mi_phone"));
			mi.setMi_email(rs.getString("mi_email"));
			
			return mi;
		});
		
		return memberInfo;
	}

	public int getInfoChange(String mi_name, String mi_email, String mi_phone, String mi_id) {
		String sql = "update t_member_info set mi_name = '" + mi_name + "', mi_email = '" + mi_email + "', mi_phone = '" + mi_phone + "' where mi_id = '" + mi_id + "'";
		
		int result = jdbc.update(sql);
		
		return result;
	}

	public int memberLeave(String miid) {
		String sql = "update t_member_info set mi_status = 'c' where mi_id = '" + miid + "'";
		int result = jdbc.update(sql);
		
		sql = "delete from t_store_heart where mi_id = '" + miid + "'";
		result = jdbc.update(sql);
		
		sql = "delete from t_store_bookmark where mi_id = '" + miid + "'";
		result = jdbc.update(sql);
		
		sql = "delete from t_store_reply_gnb where mi_id = '" + miid + "'";
		result = jdbc.update(sql);
		
		sql = "delete from t_store_reply where mi_id = '" + miid + "'";
		result = jdbc.update(sql);
		
		sql = "delete t_bookmark_folder_images from t_bookmark_folder_images join t_bookmark_folder on t_bookmark_folder_images.bf_idx = t_bookmark_folder.bf_idx where t_bookmark_folder.mi_id = '" + miid + "'";
		result = jdbc.update(sql);
		
		sql = "delete from t_bookmark_folder where mi_id = '" + miid + "'";
		result = jdbc.update(sql);
		
		return result;
	}

	public MemberInfo getFindIdCheck(String mi_name, String mi_email) {
	    String sql = "select * from t_member_info where mi_name = ? and mi_email = ?";
	    try {
	        return jdbc.queryForObject(sql, new Object[]{mi_name, mi_email}, (ResultSet rs, int rowNum) -> {
	            MemberInfo mi = new MemberInfo();
	            mi.setMi_id(rs.getString("mi_id"));
	            return mi;
	        });    
	    } catch (EmptyResultDataAccessException e) {
	        return null;  // 결과가 없을 경우 null 반환
	    }
	}

	public int PasswordChange(String td_pw, String miid, String mi_pw) {
		
	    String sql = "select mi_pw from t_member_info where mi_id = ?";
	    String currentPw = jdbc.queryForObject(sql, new Object[]{miid}, String.class);

	    // 현재 비밀번호가 일치하는지 확인
	    if (currentPw.equals(td_pw)) {
	        sql = "update t_member_info set mi_pw = ? where mi_id = ?";
	        int result = jdbc.update(sql, mi_pw, miid);
	        return result;
	    } else {
	        // 비밀번호가 일치하지 않으면 0을 반환
	        return 0;
	    }
	}

	public int getFindPwCheck(String mi_id, String mi_email) {
		String sql = "select count(*) from t_member_info where mi_id = '" + mi_id + "' and mi_email = '" + mi_email + "' ";
		
		int result = jdbc.queryForObject(sql, Integer.class);
		
		return result;
	}

	public MemberInfo PwUpdate(String mi_id, String mi_email) {
	    String sql = "update t_member_info set mi_pw = ? where mi_id = ? and mi_email = ?";
	    String newPwd = RandomStringUtils.randomAlphanumeric(10);
	    
	    int result = jdbc.update(sql, newPwd, mi_id, mi_email);
	    
	    if (result > 0) {
	        MemberInfo memberInfo = new MemberInfo();
	        
	        memberInfo.setMi_pw(newPwd); // 새로운 비밀번호 설정
	        
	        return memberInfo;
	    } else {
	        return null; // 업데이트 실패 시 null 반환
	    }
	}
}
