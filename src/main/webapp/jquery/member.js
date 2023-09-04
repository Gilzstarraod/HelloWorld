/**
 * member.js
 */

console.log("member.js");

document.addEventListener("DOMContentLoaded", function() {
	// members.json 테이터 활용해서 초기데이터
	fetch('../AjaxMemberList.do')
		.then(result => result.json())
		.then(json => {
			console.log(json);
			for (let i = 0; i < json.length; i++) {
				document.getElementById('list').appendChild(makeTr(json[i]));
			}
		})
		.catch(error => console.log(error));



	//버튼 클릭 이벤트
	document.getElementById('addBtn').addEventListener('click', addBtnFnc);
	document.getElementById('editBtn').addEventListener('click', editBtnFnc);

	function addBtnFnc() {
		let no = document.querySelector('#no').value;
		let name = document.querySelector('#name').value;
		let phone = document.querySelector('#phone').value;
		let age = document.querySelector('#age').value;

		if (!no || !name || !phone || !age) {
			alert("값을 입력해주세요")
			return;
		}

		const memb = { no, name, phone, age }
		// json -> obj : JSON.PARSE()
		// obj -> json : JSON.stringfy()
		// ajax call
		fetch("../AjaxMemberAdd.do", {
			method: 'post',
			headers: {
				//'Content-Type': 'application/x-www-form-urlencoded'
				'Content-Type': 'application/json'
				},
			body: JSON.stringify(memb) //'no= ' + no + '&name= ' + name + '&Phone= ' + phone + "&age= " + age
		})
		.then(resolve => resolve.json())
		.then(result =>{
			console.log(result)
			if(result.retCode == 'Success'){
				document.getElementById('list').appendChild(makeTr(result.result));	
			} else if(result.retCode == 'Fail'){
				alert(result.result)}
			})
		.catch(console.log);
		
		//초기화(initialize)
		const nodelist = document.querySelectorAll('table input');
		console.log(nodelist);
		nodelist.forEach(function(item) {
			item.value = '';
		})
	}; //end od addBtnFnc
	
	function editBtnFnc(){
		let no = document.querySelector('#no').value;
		let name = document.querySelector('#name').value;
		let phone = document.querySelector('#phone').value;
		let age = document.querySelector('#age').value;
		
		const target = document.querySelector('#mem_'+no) 
		
		fetch('../AjaxMemberEdit.do', {
			method: "post",
			headers: {'Content-Type':'application/x-www-form-urlencoded'},
			body: 'no=' + no + '&name=' + name + '&Phone=' + phone + "&age=" + age
		})
		.then(resolve => resolve.json())
		.then(result => {
			console.log(result)
			if(result.retCode == 'Success'){
				target.children[1].innerText = name
				target.children[2].innerText = phone
				target.children[3].innerText = age	
			} else if(result.retCode == 'Fail'){
				alert(result.result)}
			})
		.catch(console.log);
	}

	function makeTr(member = {}) {
		let tr = document.createElement('tr');
		tr.setAttribute('id', 'mem_' + member.mbrId);
		tr.setAttribute('data-no', member.mbrId);
		tr.addEventListener('click', function() {
			document.querySelector('#no').value = tr.children[0].innerHTML;
			document.querySelector('#name').value = tr.children[1].innerHTML;
			document.querySelector('#phone').value = tr.children[2].innerHTML;
			document.querySelector('#age').value = tr.children[3].innerHTML;
		})
		for (let field in member) {
			let td = document.createElement('td');
			td.innerText = member[field];
			tr.appendChild(td);
		}
		//삭제버튼. td>button
		let btn = document.createElement('button');
		btn.addEventListener('click', deleteHandler)
		btn.innerText = '삭제';
		let td = document.createElement('td');
		td.appendChild(btn);
		tr.appendChild(td);

		return tr;
	}// end of makeTr
	function deleteHandler(e){
		e.stopPropagation();//event 전파 되는 것을 차단
		console.log(this.parentElement.parentElement.dataset.no)
		let delNo = this.parentElement.parentElement.dataset.no;
		fetch('../AjaxMemberDel.do',{
			method: "post",
			headers: {'Content-Type':'application/x-www-form-urlencoded'},
			body: 'no=' + delNo
		})
		.then(resolve => resolve.json())
		.then(result =>{
			console.log(result)
			if(result.retCode == 'Success'){
				this.parentElement.parentElement.remove();
			} else if(result.retCode == 'Fail'){
				alert(result.result)}
			})
		.catch();
	}
	
}); 