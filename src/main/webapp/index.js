let Student_radio = document.getElementById('Student_radio');
let professoer_radio = document.getElementById('professoer_radio');
let student_register_details = document.getElementsByClassName('student-register-details');
let professor_register_details = document.getElementsByClassName('professor-register-details');
console.log(student_register_details);
let student_fun = function () {

   student_register_details[0].style.display = "block";
   professor_register_details[0].style.display = "none";
   window.scrollBy(0, 100);

}
let professor_fun = function () {

   professor_register_details[0].style.display = "block";
   student_register_details[0].style.display = "none";
   window.scrollBy(0, 100);


}

Student_radio.addEventListener("click", student_fun)
professoer_radio.addEventListener("click", professor_fun)	