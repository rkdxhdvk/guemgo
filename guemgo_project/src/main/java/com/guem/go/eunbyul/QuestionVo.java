package com.guem.go.eunbyul;

public class QuestionVo {
	private int ques_num;
	private String ques;
	
	public QuestionVo() {}
	
	public QuestionVo(int ques_num, String ques) {
		super();
		this.ques_num = ques_num;
		this.ques = ques;
	}
	public int getQues_num() {
		return ques_num;
	}
	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}
	public String getQues() {
		return ques;
	}
	public void setQues(String ques) {
		this.ques = ques;
	}
	

	
	
}
