import UIKit

// () 튜플
//let myTuple = (10, 432,433, "this is a String")
//let myString = myTuple.2

let myTuple = (count: 10, lenght: 432,433, message: "this is a String")
print(myTuple.message)

//: # as를 사용하여 컴파일러다 타입의 값을 알수 있게 해준다.  as! 강제적으로 형변환을 해준다.
/*:
 # 옵셔널
 옵셔널 ? 값이 할당되지 않은 상황을 처리하기 위해 사용
 * ? 값이 할당되어 있으면 래핑(wrapped) 되어있다 함
 * 래핑된 값을 사용하려면 강제 언래핑(forced wrapped) 이라는 개념을 사용
 * 래핑된 값은 옵셔널 ? 데이터 타입에서 옵셔널 이름 뒤에 ! 시용

 */
//: # 강제 언래핑
var index: Int?
index = 3
var treeArray = ["Oak", "pine", "Yew", "Birch"]

if index != nil{
    print(treeArray[index!])
} else {print("index does not contain a value")}

//: # 옵셔널 바인딩

if let myvalue = index{
    print(treeArray[myvalue])
}else{print("index does not contain a value")}

if let index{
    print(treeArray[index])
}else{print("index does not contain a value")}


var pet1: String?
var pet2: String?

pet1 = "cat"
pet2 = "dog"

if let pet1,let pet2{
    print(pet1)
    print(pet2)
}else{print("insufficient pet")}

//: #  암묵적 언래핑 ? 대신 ! 사용

// 닫힌 범위 연산자 = x...y x 부터 y 까지
// 반 개방 범위 연산자 = x..<y x부터 시작해서 y는 포함하지 않음
// 단 방향 범위 연산자 = x... or ...y  2(x)... 3번째 문자부터 마지막 문자 까지,   ...6(y) 첫 번째 문자부터 7번째 문자까지.

//: # 삼항 연산자 = 조건문 ? true인 경우의 표현식 : false인 경우의 표현식
let t = 10
let f = 20
print("Largest number is \(t > f ? t : f)")

// nil 병합 연산자 (??)
//let customerName: String? = nil
let customerName: String? = "kim"
print("Welcome back, \(customerName ?? "customer")")

var count = 0

for _ in 1...5{
    count += 1
}

var myCount = 0

while myCount < 10{
    myCount +=  1
}

var i = 10
repeat{
    i -= 1
}while (i > 0)

var j = 10
for _ in 0..<100{
    j += j
    if j > 100 {break}
    print("j = \(j)")
}

var k = 1
while k < 20{
    k += 1
    if (i%2) != 0{continue}
    print("k = \(k)")
}
 
//: # guard 구문 = guard <조건문(불리언 표현식)> else{조건문이 false일 때 실행될 코드 <종료 구문>} 조건문이 ture일 떼 실행될 코드>
func multiplyByTen(value: Int?){
    guard let number = value, number < 10 else{
        print("Number is to hight")
        return
    }
    let result = number * 10
    print(result)
}
multiplyByTen(value: 5)
multiplyByTen(value: 10)

// 외부 매개 변수명은 다음과 같이 지역 매개 변수명 앞에 (_) 문자를 사용 (매개 변수명 없이 호출하여 사용가능)

// 입출력 매개변수는 inout 키워드 사용, 함수를 호출할 때는 입출력 매개 변수앞에 &를 사용

//: # 클로저 표현식
let sayhello = {print("hello")}
sayhello()

let mlutiply = {(_ val1: Int, _ val2: Int) -> Int in return val1 * val2}
let result = mlutiply(10, 20)
// 클로저 표현식은 독립적인 코드 블록, 상수로 할당 상수로 참조 호출
// 클로저는 독립적은 코드블록과 코드블록 주변에 하나 이상의 변수가 결합된 것.

//: # class

class BankAccount{
    var accountBalance: Float = 0
    var accountNumber: Float = 0
    let fees: Float = 25.00
    
    //연산 프로퍼티에서 게터와 세터 생성
    var balanceLessFees: Float{
        get{
            return accountBalance - fees
        }
        set(newBalance){
            accountBalance = newBalance - fees
        }
    }
    
    //  init은 초기화 작업을 하기위함
    init(accountBalance: Float, accountNumber: Float) {
        self.accountBalance = accountBalance
        self.accountNumber = accountNumber
    }
    deinit{
        // 필요한 정리 작업을 여기서 수행
    }
    // 클래스 인스턴스의 메서드
    func displayBalance(){
        print("Number \(accountNumber)")
        print("Current balance is \(accountBalance)")
    }
    // 타입 메서드
    class func getMaxBalance() -> Float{
        return 100000.00
    }
    
}

// lazy로 선언하면 프로퍼티가 최초로 접근할 때만 초기화된다. 리소스를 많이 사용하는 작업 관련에서 리소스 집약적인 활동을 미룰 수 있다.

// 상속
class SavingsAccount:BankAccount{
    var interestRate: Float = 0.0
    
    init(accountNumber: Float, accountBalance: Float, interestRate: Float) {
        self.interestRate = interestRate
        super.init(accountBalance: accountBalance, accountNumber: accountNumber)
    }
    
    func calculateInterset() -> Float{
        return interestRate * accountBalance
    }
    
    override func displayBalance() {
        super.displayBalance()
        print("Prevailing interest rate is \(interestRate)")
    }
}

let savings1 = SavingsAccount(accountNumber: 12311, accountBalance: 600.00, interestRate: 0.07)
print(savings1.calculateInterset())
savings1.displayBalance()

// 익스텐션: 클래스 확장 sdk에 내장된 클래스에 기능을 추가할 때 효츌적임
extension Double{
    var squared: Double{
        return self * self
    }
    var cubed: Double{
        return self * self * self
    }
}

let dou: Double = 3.0
print(dou.squared)
print(3.0.squared)

// 구조체는 복사본 각자의 값만 바뀜 (값 타입) 클래스의 기능이 필요한게 아니면 일반적으로(클래스에 비해 더 효율적, 안정적) 구조체 사용
// 클래스는 참조체가 만들어져 많은 복사본중 하나만 바꿔도 전체 내용이 바뀜 (참조 타입)


//: # 프로토콜은 클래스가 충족해야하는 최소한의 요구사항을 정의하는 규칙들의 집합
protocol MessageBuilder{
    var name: String {get}
    func buildMessage() -> String
}

class MyClass: MessageBuilder{
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func buildMessage() -> String {
        "hello" + name
    }
}
//불투명 반환타입 Equatable이 따르는 프로톨의 모든 타입의 결과가 반환 된다.
func doubleFunce1(value: Int) -> some Equatable{
    value * 2
}

//// 열거형 enum
//enum Temperature{
//    case hot
//    case warm
//    case cold
//}

// 열거형 switch문 연결
//func displayTemperature(temp: Temperature){
//    switch temp{
//    case .hot: 
//        print("It is hot")
//    case .warm:
//        print("It is warm")
//    case .cold:
//        print("It is cold")
//    }
//}
//
//displayTemperature(temp: Temperature.warm)

// 조건
enum Temperature{
    case hot
    case warm
    case cold(centigerade: Int)
}

func displayTemperature(temp: Temperature){
    switch temp{
    case .hot:
        print("hot")
    case .warm:
        print("warm")
    
    case .cold(centigerade: let centigerade) where centigerade <= 0:
        print("Ice warning: \(centigerade) degrees")
    case .cold(centigerade: _):
        print("It is cold but not freezing")
    }
}

displayTemperature(temp: Temperature.cold(centigerade: -10))


// 프로퍼티 래퍼: 기본적으로 연산프로퍼티의 기능을 개별 클래스와 구조체와 분리할 수 있게 하며 재사용 가능.
//struct Address{
//    private var cityname: String = ""
//    var city: String {
//        get {cityname}
//        set {cityname = newValue.uppercased()}
//    }
//}
//var address = Address()
//address.city = "London"
//print(address.city)

@propertyWrapper
struct FixCaes{
    private(set) var value: String = ""
    var wrappedValue: String{
        get {value}
        set {value = newValue.uppercased()}
    }
    init(wrappedValue initiakValue: String){
        self.wrappedValue = initiakValue
    }
}

struct Contact{
    @FixCaes var name: String
    @FixCaes var city: String
    @FixCaes var conuntry: String
}

var contact = Contact(name: "some", city: "London", conuntry: "United")
print("\(contact.name), \(contact.city), \(contact.conuntry)")

@propertyWrapper
struct MinMaxVal<V: Comparable> {
    var value: V
    let max: V
    let min: V
    
    init(wrappedValue: V, max: V, min: V) {
        value = wrappedValue
        self.max = max
        self.min = min
    }
    
    var wrappedValue: V{
        get {return value}
        set{
            if newValue > max{
                value = max
            } else if newValue < min{
                value = min
            } else{
                value = newValue
            }
        }
    }
}

struct Demo{
    @MinMaxVal(max: 200, min: 100) var value: Int = 100
}

var demo = Demo()
demo.value = 150
print(demo.value)

demo.value = 250
print(demo.value)

// 클로저 표현식 ($0) forEach() 메서드는 for-in 과 같은 기능
let treeArry = ["Pine", "Oak", "Yew", "Maple", "Birch", "Myrtle"]
treeArry.forEach{ tree in print(tree)}
treeArry.forEach{print($0)}

let mixedArrray: [Any] = ["A String", 432, 34.989]

//: # 딕셔너리 시퀀스 기반 .zip() 키, 값을 합쳐줌
let keys = ["100-432112", "200-542874", "202-39495", "104-2304"]
let values = ["wind", "Tale", "sense", "Island"]

let bookDict = Dictionary(uniqueKeysWithValues: zip(keys, values))
print(bookDict)

for (bookid, title) in bookDict{
    print("Bookid: \(bookid) Title: \(title)")
}

var bookDicts = Dictionary(uniqueKeysWithValues: zip(1..., values))
print(bookDicts)

//: # 에러 핸들링
let connentionOK = true
let connentionSpeed = 30.00
let fileFound = false

//에러 타입선언 원격 파일 전송시 메서드가 있다면 이 메서드의 여러 원인(네트워크 연결x, 네트워크 속도 느림, 전송 파일을 찾지 못함)으로 인하여 전송 실패 가능성이 있음. 열거형 내에서 표시되도록 하는법
enum FileTransferErrer: Error{
    case noConnention
    case lowBandwidth
    case fileNotFound
}
// 메서드와 함수가 에러 던지기 throws 와 guard문을 결합하여 사용.
func fileTransfer() throws {
    guard connentionOK else {
        throw FileTransferErrer.noConnention
    }
    guard connentionSpeed > 30 else {
        throw FileTransferErrer.lowBandwidth
    }
    guard fileFound else{
        throw FileTransferErrer.fileNotFound
    }
}
// 메서드나 함수가 에러를 던지도록 선언했다면 일반적인 방법으로는 호출할 수 없다. 호출을 하려면 try를 사용하야함.
try fileTransfer()
// try구문 외에도 호출하는 방법이 있음. 던져딘 모든 에러를 잡아서 처리하는 do-catch 구문 내에서 호출할 수 있다. 모든 에러에 대한 처리를 해야함(394 ~ 395) 모든 에러 처리
func sendFile() -> String{
    do{
        try fileTransfer()
    } catch FileTransferErrer.noConnention {
        return("No Network Connection")
    } catch FileTransferErrer.lowBandwidth {
        return("File Tranfer Speed too Low")
    } catch FileTransferErrer.fileNotFound {
        return("file not Found")
    } catch {
        return("Unknown error")
    }
    return("Successful tranfer")
}
// catch 구문에서 가장 필요한 것은 객체에 접근하여 앱코드 내에서 취할수 있는 가장 적절한 동작을 실행하는 것. 에러 객체에 접근 하는 방법
//새로운 파일 시스템 디렉터리를 생성하고자 할때 catch구문 내에서 에러 객체를 접근 한는 법.

//do{
//    try FileManager.createDirectory(atPath: "newDir", withIntermediateDirectories: true, attributes: [FileAttributeKey : Any]?)
//} catch let error {
//    print("Error: \(error.localizedDescription)")
//}

// defer: 메서드가 결과를 반환하기 직전에 실행되어야 하는 일련의 코드를 지정할 수 있게해줌.

//func sendFiles() -> String{
//
//    defer {
//        removeTmpFiles()
//        closeConnection()
//    }
//    do{
//        try fileTransfer()
//    } catch FileTransferErrer.noConnention {
//        return("No Network Connection")
//    } catch FileTransferErrer.lowBandwidth {
//        return("File Tranfer Speed too Low")
//    } catch FileTransferErrer.fileNotFound {
//        return("file not Found")
//    } catch {
//        return("Unknown error")
//    }
//    return("Successful tranfer")
//}

