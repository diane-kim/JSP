package board.loghistory.ex;

import java.util.Date;

public class LogHistoryDTO {
	String log_num;
	String log_id;
	String log_name;
	String record;
	String log_time;
	
	public String getLog_num() {
		return log_num;
	}
	public void setLog_num(String log_num) {
		this.log_num = log_num;
	}
	public String getLog_id() {
		return log_id;
	}
	public void setLog_id(String log_id) {
		this.log_id = log_id;
	}
	public String getLog_name() {
		return log_name;
	}
	public void setLog_name(String log_name) {
		this.log_name = log_name;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public String getLog_time() {
		return log_time;
	}
	public void setLog_time(String log_time) {
		this.log_time = log_time;
	}
}
