package vo;

public class BookmarkInfo {
	private int bf_idx;
	private String si_id, mi_id, bf_title, bf_cnt;
	
	public int getBf_idx() {
		return bf_idx;
	}
	public void setBf_idx(int bf_idx) {
		this.bf_idx = bf_idx;
	}
	public String getSi_id() {
		return si_id;
	}
	public void setSi_id(String si_id) {
		this.si_id = si_id;
	}
	public String getMi_id() {
		return mi_id;
	}
	public void setMi_id(String mi_id) {
		this.mi_id = mi_id;
	}
	public String getBf_title() {
		return bf_title;
	}
	public void setBf_title(String bf_title) {
		this.bf_title = bf_title;
	}
	public String getBf_cnt() {
		return bf_cnt;
	}
	public void setBf_cnt(String bf_cnt) {
		this.bf_cnt = bf_cnt;
	}

}
