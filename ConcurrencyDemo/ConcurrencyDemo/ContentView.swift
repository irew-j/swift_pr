//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by 김종웅 on 11/17/23.
//

import SwiftUI

actor TimeStore {
    var timeStampes: [Int:Date] = [:]
    func addStampe(task: Int, date: Date){
        timeStampes[task] = date
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomething()
            }
        }) {
            Text("Do Someting")
        }
    }
    /*
     구조화되지 않은 동시성: Task 객체를 사용해서 개별적 작업을 만듬. 동기함수 내에서 비동기 함수를 호출
     
     
     백그라운드 작업을 중지하기 위해
     백그라운드 활동을 취소하는 방법을 사용자에게 제공해야 하는 경우
     우선순위 지정가능 (.high)
     
    let task = Task(priority: .high) {
        await doSomething()
    }
     
     task 인스턴스에 대한 참조반환 작업을 취소하거나 작업범위 외부에서 작업이 이미 취소 되었는지 여부를 확인하는데 사용
     if (!task.isCancelled){
        task.cancel()
     }
     */
    
//-------------------------------------------------------------------------------------------------------
    
    /*
     분리된 작업: 구조화되지 않은 동시성의 또 다른 형태로 호출하는 부모로부터 속성을 상속하지 않음 Task.detached()
    
     Task.detached {
        await doSomething()
    }
    
     우선순위 값이 전달될 수 있고 취소 여부 확인가능
    let detachTask = Task.detached(priority: .medium) {
        await doSomething()
    }
    
    if (!detachTask.isCancelled){
        detachTask.cancel()
    }
     */
    
    /*
     작업관리자: 구조화된 작업인지 아닌지 상관없이 Task 클래스는 작업 범위 내에서 작업을 관리하는 데 사용할수 있는 정적 매소드 속성 제공
     
     우선순위를 식별하기 위해 currentPriority속성 사용, 읽기 전용 속성
    Task {
        let priority = Task.currentPriority
        await doSomething()
    }

     작업취소 확인.
    if Task.isCancelled {
        // 작업정리 수행
    }
    
    do {
        try Task.checkCancellation()
    } catch {
        // 작업 정리 수행
    }
     언제든 자신의 작업을 취소할 수 있음
    Task.cancel()
    
     실행을 안전하게 일시 중단할 수 있는 위치가 있다면 사용가능.
    Task.yield()
     */
    
    // takesTooLong() 지연값을 매개변수로 받아서 만약에 지연이 특정 범위를 벗어나면 오류를 발생시킴/\.
    enum DurationError: Error {
        case tooLong
        case tooShort
    }
    /*
    // 작업 그룹: 여러 작업을 동시에 생성하고 실행함. (5초동안 지연이 발생)
    //addTask 이외에 작업:  cancelAll(): 그룹의 모든 작업을 취소
    // isCanelled: 이미 취소되었는지 여부를 나타냄
    // isEmpty: 작업이 아직 남아있는지.
    func doSomething() async {
        await withTaskGroup(of: Void.self) {group in
            for i in 1...5 {
                group.addTask {
                    let result = await takesTooLong()
                    print("Completd Task \(i) = \(result)")
                }
            }
        }
    }
     */
    
    /*
//    데이터 경쟁 피하기: 그룹은 작업을 저장하지 못함. 딕셔너리 갹채애 작업을 저장. (데이터 경쟁) 조건이 발생하여 오류가 생김. (Int, Date)를 튜플로 받음.
     for-await 표현식을 사용하면 비동기적으로 반환되는 값이 하나씩 루푸를 돌고 동시 작업에서 반환되는 값의 수신을 기다릴수 있다.
     
    func doSomething() async {
        var timeStamps: [Int: Date] = [:]
        
        await withTaskGroup(of: (Int, Date).self) { group in
            for i in 1...5{
                group.addTask {
                    return(i, await takesTooLong())
                }
            }
            for await (task, date) in group {
                timeStamps[task] = date
            }
        }
        for (task, date) in timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
     */
    
    /*
     비동기 속성: 함수뿐만 아니라 클래스와 구조체 내에서 비동기 속성도 지원함.
     
    struct MyStruct {
        var myResult: Date {
            get async {
                return await self.getTime()
            }
        }
        func getTime() async -> Date {
            sleep(5)
            return Date()
        }
    }
    
    func doSomething() async {
        let myStruct = MyStruct()
        
        Task {
            let date = await myStruct.myResult
        }
    }
    */
    
    func doSomething() async {
        let store = TimeStore()
        
        await withTaskGroup(of: Void.self) {group in
            for i in 1...5 {
                group.addTask {
                    await store.addStampe(task: i, date: takesTooLong())
                }
            }
        }
        for (task, date) in await store.timeStampes {
            print("Task = \(task), Date = \(date)")
        }
    }
    
    
    /*
     오류 핸들링: takesTooLong() 지연값을 매개변수로 받아서 만약에 지연이 특정 범위를 벗어나면 오류를 발생시킴
    func takesTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
        }
        
        sleep(delay)
        print("Anync task completed at \(Data())")
    }
     */
    
    
    func takesTooLong() async -> Date {
        sleep(5)
        return Date()
    }
    
}

#Preview {
    ContentView()
}
