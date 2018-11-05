package com.guem.go.eunbyul;

public class AnswerVo {
	private int ans_num;
	private int matchnum;
	private int ques_num;
	private String answer;
	
	public AnswerVo() {}

	public AnswerVo(int ans_num, int matchnum, int ques_num, String answer) {
		super();
		this.ans_num = ans_num;
		this.matchnum = matchnum;
		this.ques_num = ques_num;
		this.answer = answer;
	}

	public int getAns_num() {
		return ans_num;
	}

	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}

	public int getMatchnum() {
		return matchnum;
	}

	public void setMatchnum(int matchnum) {
		this.matchnum = matchnum;
	}

	public int getQues_num() {
		return ques_num;
	}

	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	};
	
	
	
}
