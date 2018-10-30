Survey
    .StylesManager
    .applyTheme("default");

var json = {
		 title: "Please help us to improve our product",
		 pages: [
		  {
		   name: "첫번째 질문",
		   elements: [
		    {
		     type: "checkbox",
		     name: "question1",
		     title: "배우고 싶은 종류는?",
		     choices: [
		      {
		       value: "photoshop",
		       text: "포토샵"
		      },
		      {
		       value: "indesign",
		       text: "인디자인"
		      },
		      {
		       value: "illust",
		       text: "일러스트"
		      }
		     ]
		    }
		   ],
		   title: "배우고 싶은 종류는 어떤 것인가요?"
		  },
		  {
		   name: "두번째질문",
		   elements: [
		    {
		     type: "checkbox",
		     name: "question2",
		     title: "수업을 원하는 요일은?",
		     choices: [
		      {
		       value: "mon",
		       text: "월"
		      },
		      {
		       value: "thu",
		       text: "화"
		      },
		      {
		       value: "wed",
		       text: "수"
		      },
		      {
		       value: "thr",
		       text: "목"
		      },
		      {
		       value: "fri",
		       text: "금"
		      },
		      {
		       value: "sat",
		       text: "토"
		      },
		      {
		       value: "sun",
		       text: "일"
		      }
		     ]
		    }
		   ],
		   visibleIf: "포토샵",
		   title: "원하는 요일은?"
		  },
		  {
		   name: "세번째질문",
		   elements: [
		    {
		     type: "radiogroup",
		     name: "question3",
		     title: "원하는 시간대는?",
		     choices: [
		      {
		       value: "am",
		       text: "오전"
		      },
		      {
		       value: "pm",
		       text: "오후"
		      },
		      {
		       value: "night",
		       text: "늦은저녁"
		      },
		      {
		       value: "nomatter",
		       text: "상관없음"
		      }
		     ]
		    }
		   ],
		   title: "시간은?\n"
		  }
		 ],
		 showTitle: false
		};
window.survey = new Survey.Model(json);


	survey
	.onComplete
	.add(function (result) {
	    document
	        .querySelector('#surveyResult')
	        .innerHTML = "result: " + JSON.stringify(result.data);
	});


$("#modal").click(function(){
	$("#surveyElement").SurveyWindow({model: survey, isExpanded: true});
});
	

