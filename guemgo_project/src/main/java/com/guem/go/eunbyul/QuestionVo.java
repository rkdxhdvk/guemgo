package com.guem.go.eunbyul;

public class QuestionVo {
	private int ques_num;
	private String question;
	
	public QuestionVo() {}
	
	public QuestionVo(int ques_num, String question) {
		super();
		this.ques_num = ques_num;
		this.question = question;
	}
	public int getQues_num() {
		return ques_num;
	}
	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	

	
	
}
