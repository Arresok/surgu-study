// #1

// function checkNumber(number) {
//     if (number > 0) {
//         console.log("Число положительное!")
//     }
//     else if (number < 0 ){
//         console.log("Число отрицательное!")
//     }
//     else {
//         console.log("Число равно 0")
//     }

//     if (number % 2==0) {
//         console.log("Число чётное!")
//     }
//     else{
//         console.log("Число не чётное!")

//     }
// }
// checkNumber(7)




// #2

// const numbers = [4,8,15,16,23,42]
// let sum =0
// let max=0
// let newMassiv= []

// for (let i = 0; i < numbers.length; i++) {
//     //sum
//     sum += numbers[i];
//     //max
//     if (numbers[i]> max) {
//         max = numbers[i];
//     }
//     //>10
//     if (numbers[i] > 10 ){
//         newMassiv.push(numbers[i])
//     }

// }
// console.log("Сумма:", sum)
// console.log("Макс число:",max)
// console.log("Числа > 10:", newMassiv)




// #2.1

// const numbers = [4,8,15,16,23,42]
// const sum= numbers.reduce((acc,number)=> acc+number,0)
// const max= numbers.reduce((max,number)=> {
//     return number > max ? number : max;}, numbers[0]);
// const bolse10 = numbers.filter(number => number > 10);

// console.log("Сумма:", sum)
// console.log("Макс число:",max)
// console.log("Числа > 10:", bolse10)




// #3

// const students = [
//     {name: "Goha", grade: 5},
//     {name: "Alexandre", grade: 4},
//     {name: "Roman", grade: 3},
//     {name: "Artem", grade: 5},
//     {name: "Kirill", grade: 4}
// ];
// const minGrade= 4;
// const filterStidents = students.filter(student => student.grade > minGrade);

// console.log("Ученики с оценкой выше", minGrade + ":")
// filterStidents.forEach(student => {
//     console.log(student.name, "-", student.grade)
// })

// const averageGrade = students.reduce((sum,student)=> sum + student.grade,0) / students.length;
// console.log('Средняя оценка', averageGrade);




//#4

// function RandomNumber() {
//     const secretNumber = Math.floor(Math.random() * 10) + 1;
//     let chance = 4;

//     while (chance > 0) {
//         const userNumber = Number(prompt("Угадай число от 1 до 10:"));
        
//         if (userNumber === secretNumber) {
//             console.log("Поздравляю! Вы угадали число!");
//         } else if (userNumber < secretNumber) {
//             console.log("Загаданное число больше!");
//         } else {
//             console.log("Загаданное число меньше!");
//         }

//         chance--;
//         console.log("Попыток осталось:" + chance );
//     }
//     console.log("Попытки законичлись! Загаданное число:", secretNumber);
    
// }
// RandomNumber();
