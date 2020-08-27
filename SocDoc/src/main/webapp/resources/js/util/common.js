
  	// 시군구 선택 옵션을 배열에 담기
   
   	var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');
      
   	var cat2_name = new Array(); 
   
   	cat2_name['서울'] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
      
   	cat2_name['부산'] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
   
   	cat2_name['대구'] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');
   
   	cat2_name['인천'] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
   
   	cat2_name['광주'] = new Array('광산구','남구','동구','북구','서구');
   
   	cat2_name['대전'] = new Array('대덕구','동구','서구','유성구','중구');
   
   	cat2_name['울산'] = new Array('남구','동구','북구','중구','울주군');
   
   	cat2_name['강원'] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');
   
  	cat2_name['경기'] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');
   
   	cat2_name['경남'] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');
   
   	cat2_name['경북'] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
   
   	cat2_name['전남'] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
   
   	cat2_name['전북'] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
   
   	cat2_name['제주'] = new Array('서귀포시','제주시','남제주군','북제주군');
   
   	cat2_name['충남'] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
   
   	cat2_name['충북'] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
   
   
   	var cat3_name = new Array();
   	
   	cat3_name['강남구'] = new Array('개포동', '논현동', '대치동', '도곡동', '삼성동', '세곡동', '수서동', '신사동', '압구정동', '역삼동', '율현동', '일원동', '자곡동', '청담동');
   	cat3_name['강동구'] = new Array('강일동', '고덕동', '길동', '둔촌동', '명일동', '상일동', '성내동', '암사동', '천호동');
   	cat3_name['강북구'] = new Array('미아동', '번동', '수유동', '우이동');
   	cat3_name['중구'] = new Array('광희동1가', '광희동2가', '남대문로1가', '남대문로2가','남대문로3가','남대문로4가','남대문로5가','남산동1가','남산동2가','남산동3가','남찬동','남학동','다동','만리동1가','만리동2가','명동1가','명동2가','무교동','무학동','묵정동','방산동','봉래동1가','봉래동2가','북창동','산림동','삼각동','서소문동','소공동','수표동','수하동','순화동','신당동','쌍림동','예관동','예장동','오장동','을지로1가','을지로1가','을지로2가','을지로3가','을지로4가','을지로5가','을지로6가','을지로7가');
   	
   	
   	var cat4_name = new Array('내과','이비인후과','정형외과','안과','산부인과','치과','외과','성형외과','정신건강의학과','피부과');
   



	// change 이벤트 함수 정의 
   	function cat1_change(key,sel){
	   	if(key == '') {
	   		return;
	   	}
	   	
	  	var name = cat2_name[key];
	  	
	   
	   	sel.options[0] = new Option('군 전체','','true');
	   
	   	for(i=0; i<name.length; i++) {
		   	sel.options[i+1] = new Option(name[i]);
	   	}
   	}
   	

   	function cat2_change(key,sel){
	   	if(key == '') {
	   		return;
	   	}
	   	
	  	var name = cat3_name[key];
	  	
	   	sel.options[0] = new Option('동 전체','', 'true');
	   
	   	for(i=0; i<name.length; i++) {
		   	sel.options[i+1] = new Option(name[i]);
	   	}
   	}



   	// ================ 검색 ================
   	function goSearch(){  
      
      	var h_area1 = $("#h_area1").val().trim();    // 시도선택
      	var h_area2 = $("#h_area2").val().trim();    // 구군선택
      	var h_area3 = $("#h_area3").val().trim();    // 진료과목선택
      	var myInput = $("#myInput").val().trim();    // 병원명입력창
      
      	if(! (h_area1 == "시도선택" && h_area2 == "구군선택" && h_area3 == "전체" && myInput=="")){ 
         	alert("검색완료");
      	} else {
         	alert("찾으시는 병원 정보를 선택해주세요.");
      	}
   	}
   	
   	
   	function exportAsExcel(id, title) {
			var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
			tab_text = tab_text
					+ '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
			tab_text = tab_text
					+ '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
			tab_text = tab_text + '<x:Name>Test Sheet</x:Name>';
			tab_text = tab_text
					+ '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
			tab_text = tab_text
					+ '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
			tab_text = tab_text + "<table border='1px'>";
			var exportTable = $('#' + id).clone();
			exportTable.find('input').each(function(index, elem) {
				$(elem).remove();
			});
			tab_text = tab_text + exportTable.html();
			tab_text = tab_text + '</table></body></html>';
			var data_type = 'data:application/vnd.ms-excel';
			var ua = window.navigator.userAgent;
			var msie = ua.indexOf("MSIE ");
			var fileName = title + '.xls';
			//Explorer 환경에서 다운로드
			if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
				if (window.navigator.msSaveBlob) {
					var blob = new Blob([ tab_text ], {
						type : "application/csv;charset=utf-8;"
					});
					navigator.msSaveBlob(blob, fileName);
				}
			} else {
				var blob2 = new Blob([ tab_text ], {
					type : "application/csv;charset=utf-8;"
				});
				var filename = fileName;
				var elem = window.document.createElement('a');
				elem.href = window.URL.createObjectURL(blob2);
				elem.download = filename;
				document.body.appendChild(elem);
				elem.click();
				document.body.removeChild(elem);
			}
	}
	
	
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
	