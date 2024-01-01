//
//  Persistence.swift
//  CoreDataDemo
//
//  Created by 김종웅 on 12/20/23.
// 영구 컨트롤러 셍성 (데이터 스텍의 생성을 처리하고 기본적인 코어 데이커 기능에 추가적인 애플리케이션 메서드를 쉽게 추가할 수 있도록 서브클래싱되게 설계)

import CoreData

struct PersistenceController {
    // 영구 컨테이너 초기화
    static let shared  = PersistenceController()
    
//    let container: NSPersistentContainer
    let container: NSPersistentCloudKitContainer // 클라우드 킷 사용
    
    init() {
//        container = NSPersistentContainer(name: "Products")
        container = NSPersistentCloudKitContainer(name: "Products") // 클라우드 킷 사용
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true // 클라우드 킷 사용
    }
}
