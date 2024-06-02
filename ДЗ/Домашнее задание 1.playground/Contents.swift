// Задание 1 (сумма)

import Darwin

let arrayOfNumbers = [2.5, 9.7, 6.9, 8.2]
var sumOfInteger = 0
var sumOfFractional: Double = 0
var integer = 0
var fractional: Double = 0

for intNumbers in arrayOfNumbers {
    integer = Int(intNumbers)
    sumOfInteger += integer
}
print(sumOfInteger)

//for fractionalNumbers in arrayOfNumbers {
//    integer = Int(floor(fractionalNumbers))
//    fractional = fractionalNumbers.truncatingRemainder(dividingBy: Double(integer))
//    sumOfFractional += fractional
//}
//print(sumOfFractional)
//
//// Задание 2 (четность)
//
//if sumOfInteger % 2 == 0 {
//    print("Even Number")
//} else {
//    print("Odd number")
//}
//
//
//// Задание 3 (с занятия)
//
//var range = 400
//switch range {
//case 400...1000 : print("Error")
//case 200..<400 : print("Ok")
//case ..<200 : print("Internal Error")
//default:
//    print ("Out of Range")
//}
//
//if range >= 400 && range <= 1000  {
//    print("Error")
//} else if range >= 200 && range < 400 {
//    print(print("Ok"))
//} else if range < 200 {
//    print("Internal Error")
//} else {
//    print ("Out of Range")
//}
