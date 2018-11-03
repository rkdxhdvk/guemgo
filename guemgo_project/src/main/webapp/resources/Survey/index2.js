var surveyValueChanged = function (sender, options) {
    var el = document.getElementById(options.name);
    if (el) {
        el.value = options.value;
    }
};

Survey
    .StylesManager
    .applyTheme("default");

/*var json = {
		 title: "111",pages: [{ name: "aaaa",elements: [{type: "checkbox",name: "question1",title: "aaaa?",
		     choices: [{value: "photoshop",text: "포토샵"},{value: "indesign",text: "인디자인"},{value: "illust",text: "일러스트"}]}]}],
		   title: "222",pages: [{name: "두번째질문",elements: [{type: "checkbox",name: "question2",title: "수업을 원하는 요일은?",
		     choices: [{value: "mon", text: "월"},{value: "thu",text: "화"},{value: "wed",text: "수"},{value: "thr",text: "목"}]}]}],
		   title: "333",pages: [{name: "세번째질문",elements: [{type: "radiogroup",name: "question3",title: "원하는 시간대는?",
		     choices: [{value: "am",text: "오전"},{value: "pm",text: "오후"},{value: "nomatter",text: "상관없음"}]}]}],
		 showTitle: false
		};*/


var question1=document.getElementById("id").value;
var json = {
		 "title": "24시간 이내에 고수를 매칭해드립니다.",
		 "pages": [
		  {
		   "name": "page1",
		   "elements": [
		    {
		     "type": "checkbox",
		     "name": "question1",
		     "title": question1,
		     "choices": [
		      {
		       "value": "watercolor",
		       "text": "수채화"
		      },
		      {
		       "value": "oil",
		       "text": "유화"
		      },
		      {
		       "value": "drawing",
		       "text": "드로잉"
		      },
		      {
		       "value": "acrylics",
		       "text": "아크릴화"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page2",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question2",
		     "title": "레슨을 받는 목적이 무엇인가요?",
		     "choices": [
		      {
		       "value": "hobby",
		       "text": "취미"
		      },
		      {
		       "value": "IPSE",
		       "text": "입시"
		      },
		      {
		       "value": "work",
		       "text": "학업/직업"
		      },
		      {
		       "value": "gift",
		       "text": "선물"
		      },
		      {
		       "value": "others",
		       "text": "기타",
		        type: "text"
		      }
		     ]
			
		    }/*,
		    {
	            type: "text",
	            visibleIf: "{question2} = 'others'"
	            
	        }*/
		   ]
		  },
		  
		  {
		   "name": "page3",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question2",
		     "title": "경력이 있나요?",
		     "choices": [
		      {
		       "value": "start",
		       "text": "입문"
		      },
		      {
		       "value": "1year",
		       "text": "1년이하"
		      },
		      {
		       "value": "3year",
		       "text": "3년이하"
		      },
		      {
		       "value": "5year",
		       "text": "5년이상"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page4",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question3",
		     "title": "학생은 몇 살 입니까?",
		     "choices": [
		      {
		       "value": "10",
		       "text": "0~10"
		      },
		      {
		       "value": "20",
		       "text": "11~20"
		      },
		      {
		       "value": "30",
		       "text": "21~30"
		      },
		      {
		       "value": "40",
		       "text": "31~40"
		      },
		      {
		       "value": "50",
		       "text": "50이상"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page5",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question4",
		     "title": "어떤 레슨 형태를 원하십니까?",
		     "choices": [
		      {
		       "value": "individual",
		       "text": "개인레슨"
		      },
		      {
		       "value": "group",
		       "text": "그룹레슨"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page6",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question6",
		     "title": "희망 레슨 횟수는 어떻게 되시나요?",
		     "choices": [
		      {
		       "value": "week1",
		       "text": "주 1회"
		      },
		      {
		       "value": "week2",
		       "text": "주 2회"
		      },
		      {
		       "value": "week3",
		       "text": "주 3회이상"
		      },
		      {
		       "value": "month1",
		       "text": "한달에 한번"
		      },
		      {
		       "value": "oneday",
		       "text": "원데이클래스"
		      },
		      {
		    	  
		    	"value": "other",
		    	"text": "기타"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page7",
		   "elements": [
		    {
		     "type": "checkbox",
		     "name": "question5",
		     "title": "레슨받기 좋은 요일은 언제인가요?",
		     "choices": [
		      {
		       "value": "mon",
		       "text": "월",
		      },
		      {
		       "value": "tue",
		       "text": "화"
		      },
		      {
		       "value": "wed",
		       "text": "수"
		      },
		      {
		       "value": "thu",
		       "text": "목"
		      },
		      {
		       "value": "fri",
		       "text": "금"
		      },
		      {
		       "value": "sat",
		       "text": "토"
		      },
		      {
		       "value": "sun",
		       "text": "일"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page8",
		   "elements": [
		    {
		     "type": "checkbox",
		     "name": "question7",
		     "title": "희망하는 레슨 시간은 언제인가요?",
		     "choices": [
		      {
		       "value": "am",
		       "text": "오전"
		      },
		      {
		       "value": "lunch",
		       "text": "점심"
		      },
		      {
		       "value": "pm",
		       "text": "오후"
		      },
		      {
		       "value": "dinner",
		       "text": "저녁"
		      },
		      {
		       "value": "nomatter",
		       "text": "무관"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page9",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question8",
		     "title": "레슨을 시작하고 싶은 날이 있나요?",
		     "choices": [
		      {
		       "value": "start1",
		       "text": "협의 간능해요"
		      },
		      {
		       "value": "start2",
		       "text": "일주일 이내면 돼요"
		      },
		      {
		       "value": "start3",
		       "text": "가능한 빨리 하고 싶어요"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page10",
		   "elements": [
		    {
		     "type": "text",
		     "name": "question9",
		     "title": "고수가 알아야 할 다른 사항이 있나요?"
		    }
		   ]
		  },
		  {
		   "name": "page11",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question10",
		     "title": "선호하는 성별이 있나요?",
		     "choices": [
		      {
		       "value": "woman",
		       "text": "여자"
		      },
		      {
		       "value": "man",
		       "text": "남자"
		      },
		      {
		       "value": "nomatter",
		       "text": "무관"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page12",
		   "elements": [
		    {
		     "type": "dropdown",
		     "name": "question11",
		     "title": "서비스가 필요한 근처 주소가 어디인가요?",
		     "choices": [
		      {
		       "value": "item1",
		       "text": "은평구"
		      },
		      {
		       "value": "item2",
		       "text": "종로구"
		      },
		      {
		       "value": "item3",
		       "text": "성북구"
		      },
		      {
		       "value": "item4",
		       "text": "중구"
		      }
		     ]
		    }
		   ]
		  },
		  {
		   "name": "page13",
		   "elements": [
		    {
		     "type": "radiogroup",
		     "name": "question12",
		     "title": "어떤 방식으로 진행 하는게 좋을까요?",
		     "choices": [
		      {
		       "value": "come",
		       "text": "제가 있는 위치로 오기를 바랍니다."
		      },
		      {
		       "value": "go",
		       "text": "고수가 있는 위치로 이동할게요."
		      },
		      {
		       "value": "nomatter",
		       "text": "상관없습니다."
		      }
		     ]
		    }
		   ]
		  }
		 ],
		 "showTitle": false
		};




window.survey = new Survey.Model(json);
	survey
	.onComplete
	.add(function (result) {
	    document
	        .querySelector('#surveyResult')
	        .innerHTML = "result: " + JSON.stringify(result.data);
	});
//var data=document.getElementById( 'abc' ).getAttribute( 'value' );
//	survey.data = {
//		    first : data
//		};

$("#modal2").click(function(){
	$("#surveyElement").SurveyWindow({model: survey, isExpanded: true});
});
	

