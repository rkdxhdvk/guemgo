package com.guem.go.eunbyul;

public class ExampleVo {
	private String example;
	private int ex_num;
	private int ques_num;
	
	public ExampleVo() {}
	
	public ExampleVo(String example, int ex_num, int ques_num) {
		super();
		this.example = example;
		this.ex_num = ex_num;
		this.ques_num = ques_num;
	}
	public String getExample() {
		return example;
	}
	public void setExample(String example) {
		this.example = example;
	}
	public int getEx_num() {
		return ex_num;
	}
	public void setEx_num(int ex_num) {
		this.ex_num = ex_num;
	}
	public int getQues_num() {
		return ques_num;
	}
	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}
	
	
	
}
