package vo;

import java.util.List;

public class StoreReplyGnb {
	private String mi_id;
	private int srg_idx, sr_idx, srg_gnb;
	private List<Integer> srIdxList;	// List를 사용하여 여러 개의 sr_idx를 저장

    public List<Integer> getSrIdxList() {
        return srIdxList;
    }

    public void setSrIdxList(List<Integer> srIdxList) {
        this.srIdxList = srIdxList;
    }
    
	public String getMi_id() {
		return mi_id;
	}
	public void setMi_id(String mi_id) {
		this.mi_id = mi_id;
	}
	public int getSrg_gnb() {
		return srg_gnb;
	}
	public void setSrg_gnb(int srg_gnb) {
		this.srg_gnb = srg_gnb;
	}
	public int getSrg_idx() {
		return srg_idx;
	}
	public void setSrg_idx(int srg_idx) {
		this.srg_idx = srg_idx;
	}
	public int getSr_idx() {
		return sr_idx;
	}
	public void setSr_idx(int sr_idx) {
		this.sr_idx = sr_idx;
	}
	
	
}
