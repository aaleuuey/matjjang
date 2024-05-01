package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.dao.EmptyResultDataAccessException;
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
			if (rs.getString("si_week").equals("월,화,수,목,금,토,일"))		siweek = "매일";
			else if (rs.getString("si_week").equals("월,화,수,목,금"))		siweek = "평일";
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
			if (rs.getString("si_week").equals("월,화,수,목,금,토,일"))		siweek = "매일";
			else if (rs.getString("si_week").equals("월,화,수,목,금"))		siweek = "평일";
			else 														siweek = rs.getString("si_week");
			si.setSi_week(siweek);
			si.setSi_open(rs.getString("si_open"));
			si.setSi_close(rs.getString("si_close"));
			si.setSi_parking(rs.getString("si_parking"));
			si.setSi_addr1(rs.getString("si_addr1"));
			si.setSi_addr2(rs.getString("si_addr2"));
			si.setSi_review(rs.getInt("si_review"));
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
						+ "on a.mi_id = b.mi_id where a.sr_isview = 'y' and a.si_id = '" + siid + "' " + "order by a.sr_idx desc limit 10";
		
		System.out.println(sql);
	
		List<StoreReplyList> storeReplyList = jdbc.query(sql, (ResultSet rs, int rowNum) -> {
			StoreReplyList srl = new StoreReplyList();
			srl.setMi_id(rs.getString("mi_id"));
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
	
	public int getStoreReplyCount(String siid) {
		String sql = "select count(*) from t_store_reply where sr_isview = 'y' and si_id = '" + siid + "'";

		int srcnt = jdbc.queryForObject(sql, Integer.class);
		return srcnt;
	}
	
	public int getStoreReplyInsert(StoreReplyList srl) {
		String sql = "select ifnull(max(sr_idx) + 1, 1) from t_store_reply";
		int sridx = jdbc.queryForObject(sql, Integer.class);
		
		sql = "update t_store_info set si_review = si_review + 1 where si_id = '" + srl.getSi_id() + "'";
		int result = jdbc.update(sql);
		
		sql = "insert into t_store_reply (sr_idx, si_id, mi_id, sr_star, sr_content, sr_good, sr_img1, sr_img2, sr_img3) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		result = jdbc.update(sql, 
				sridx, srl.getSi_id(), srl.getMi_id(), srl.getSr_star(), srl.getSr_content(), srl.getSr_good(), 
				srl.getSr_img1(), srl.getSr_img2(), srl.getSr_img3()
		);
		
		return result;
	}

	public int replyGnb(int sridx, String siid, String mi_id) {
	    int result = 0;
	    
	    // 중복 여부를 확인하는 select 쿼리
	    String sql = "select count(*) from t_store_reply_gnb where sr_idx = ? and mi_id = ?";
	    
	    // t_store_reply_gnb 테이블에 해당 조합이 이미 존재하는지 확인
	    int count = jdbc.queryForObject(sql, Integer.class, sridx, mi_id);
	    
	    if (count > 0) {
	    	// 이미 존재할 경우 음식점 게시물 후기 개수 -1
	    	sql = "update t_store_info set si_review = si_review - 1 where si_id = '" + siid + "' ";
	    	result = jdbc.update(sql);
	    	
	        // 이미 존재할 경우 해당 댓글을 삭제
	    	sql = "update t_store_reply set sr_good = sr_good - 1 where sr_idx = " + sridx;
	    	result = jdbc.update(sql);
	    	
	        sql = "delete from t_store_reply_gnb where sr_idx = ? and mi_id = ?";
	        jdbc.update(sql, sridx, mi_id);
	        result = 0; // 이미 존재하는 경우 -1을 반환하거나 다른 처리를 수행할 수 있습니다.
	    } else {
	    	sql = "update t_store_info set si_review = si_review + 1 where si_id = '" + siid + "' ";
	    	result = jdbc.update(sql);
	    	
	        // 존재하지 않을 경우 새로운 댓글을 삽입
	    	sql = "update t_store_reply set sr_good = sr_good + 1 where sr_idx = " + sridx;
	    	result = jdbc.update(sql);
	    	
	        sql = "insert into t_store_reply_gnb (mi_id, sr_idx, srg_gnb) values (?, ?, 1)";
	        result = jdbc.update(sql, mi_id, sridx);
	    }
	    
	    return result;
	}


	public List<Integer> getStoreReplyGnb(List<Integer> srIdxList, String mi_id) {
		List<Integer> likedStatusList = new ArrayList<>();
	    
	    for (Integer srIdx : srIdxList) {
	        String sql = "select count(*) from t_store_reply_gnb where sr_idx = ? and mi_id = ?";
	        Object[] params = { srIdx, mi_id };
	        
	        try {
	            int replyGnb = jdbc.queryForObject(sql, params, Integer.class);
	            likedStatusList.add(replyGnb); // 댓글에 대한 좋아요 여부를 replyGnb에 담음
	        } catch (EmptyResultDataAccessException e) {
	            likedStatusList.add(0); // 댓글이 없거나 사용자가 해당 댓글에 좋아요를 누르지 않은 경우
	        }
	        

	    }
	    
        System.out.println(likedStatusList);
	    return likedStatusList;	
	}

	public List<StoreReplyList> getMoreReviews(int currentReviews, int addReviews, String siid) {
		
		String sql = "select a.*, b.mi_id, b.mi_name from t_store_reply a join t_member_info b on a.mi_id = b.mi_id where a.sr_isview = 'y' and a.si_id = ? order by a.sr_idx desc limit ?, ?";
		
		List<StoreReplyList> moreReviews = jdbc.query(sql, new Object[]{siid, currentReviews, addReviews}, (ResultSet rs, int rowNum) -> {	
	        StoreReplyList srl = new StoreReplyList();
	        srl.setMi_id(rs.getString("mi_id"));
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
	    
	    return moreReviews;
	}

	public int storeReplyDelete(int sridx,String siid, String mi_id) {
		String sql = "update t_store_info set si_review = si_review - 1 where si_review > 0 and si_id = '" + siid + "' ";
		int result = jdbc.update(sql);
		System.out.println(sql);
		
		sql = "update t_store_reply set sr_isview = 'n' where mi_id = '" + mi_id + "' and sr_idx = " + sridx;
		result = jdbc.update(sql);
		
		return result;
	}



}