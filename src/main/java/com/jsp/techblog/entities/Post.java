package com.jsp.techblog.entities;
import java.sql.Timestamp;
public class Post {
	private int pid;
	private String ptitle;
	private String pcontent;
	private String pcode;
	private String pPic;
	private Timestamp pdate;
	private int cid;
	private int userid;
	public Post() {
		super();
	}
	public Post(int pid, String ptitle, String pcontent, String pcode, String pPic, Timestamp pdate, int cid,
			int userid) {
		super();
		this.pid = pid;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pPic = pPic;
		this.pdate = pdate;
		this.cid = cid;
		this.userid = userid;
	}
	public Post(String ptitle, String pcontent, String pcode, String pPic, Timestamp pdate, int cid, int userid) {
		super();
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcode = pcode;
		this.pPic = pPic;
		this.pdate = pdate;
		this.cid = cid;
		this.userid = userid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPtitle() {
		return ptitle;
	}
	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getpPic() {
		return pPic;
	}
	public void setpPic(String pPic) {
		this.pPic = pPic;
	}
	public Timestamp getPdate() {
		return pdate;
	}
	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	

}
