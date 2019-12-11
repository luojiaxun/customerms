package core.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Order {
	private Integer order_id;
	private Date create_time;
	private Date end_time;	
	private String create_time_str;
	private String end_time_str;	
	private String create_time_str1;
	private String end_time_str1;
	private Integer fee;
	private String fee_type;
	private String order_username;
	private String payer_name;
	private Integer start;           
	private Integer rows;
	private Integer payer_id;
	private Integer order_userid;
	private String remindmessage;
	
	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Integer getPayer_id() {
		return payer_id;
	}
	public void setPayer_id(Integer payer_id) {
		this.payer_id = payer_id;
	}
	public Integer getOrder_userid() {
		return order_userid;
	}
	public void setOrder_userid(Integer order_userid) {
		this.order_userid = order_userid;
	}
	public void setFee(Integer fee) {
		this.fee = fee;
	}
	public String getCreate_time_str1() {
		if(create_time!=null)
		{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		create_time_str1=sdf.format(create_time);
		}
		return create_time_str1;
	}
	public void setCreate_time_str1(String create_time_str1) {
		this.create_time_str1 = create_time_str1;
	}
	public String getEnd_time_str1() {
		if(end_time!=null)
		{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		end_time_str1=sdf.format(end_time);
		}
		return end_time_str1;
	}
	public void setEnd_time_str1(String end_time_str1) {
		this.end_time_str1 = end_time_str1;
	}
	public String getRemindmessage() {
		return remindmessage;
	}
	public void setRemindmessage(String remindmessage) {
		this.remindmessage = remindmessage;
	}

	public String getCreate_time_str() {
		if(create_time!=null)
		{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		create_time_str=sdf.format(create_time);
		}
		return create_time_str;
	}
	public void setCreate_time_str(String create_time_str) {
		this.create_time_str = create_time_str;
	}
	public String getEnd_time_str() {
		if(end_time!=null)
		{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		end_time_str=sdf.format(end_time);
		}
		return end_time_str;
	}
	public void setEnd_time_str(String end_time_str) {
		this.end_time_str = end_time_str;
	}
	public String getOrder_username() {
		return order_username;
	}
	public void setOrder_username(String order_username) {
		this.order_username = order_username;
	}
	public String getPayer_name() {
		return payer_name;
	}
	public void setPayer_name(String payer_name) {
		this.payer_name = payer_name;
	}
	public Date getCreate_time() {
		
		return create_time;
	}
	public void setCreate_time(Date create_time) {		
		this.create_time = create_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public String getFee_type() {
		return fee_type;
	}
	public void setFee_type(String fee_type) {
		this.fee_type = fee_type;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public Integer getFee() {
		return fee;
	}
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", create_time=" + create_time + ", end_time=" + end_time
				+ ", create_time_str=" + create_time_str + ", end_time_str=" + end_time_str + ", create_time_str1="
				+ create_time_str1 + ", end_time_str1=" + end_time_str1 + ", fee=" + fee + ", fee_type=" + fee_type
				+ ", order_username=" + order_username + ", payer_name=" + payer_name + ", start=" + start + ", rows="
				+ rows + ", payer_id=" + payer_id + ", order_userid=" + order_userid + ", remindmessage="
				+ remindmessage + "]";
	}
          
	
}
