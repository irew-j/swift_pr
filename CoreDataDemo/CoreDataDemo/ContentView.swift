//
//  ContentView.swift
//  CoreDataDemo
//
//  Created by 김종웅 on 12/20/23.
// 코어 데이터

import SwiftUI
import CoreData


struct ContentView: View {
    
    @State var name: String = ""
    @State var quantity: String = ""
    
    @Environment(\.managedObjectContext) private var viewContext // viewContext대한 객체에 대한 접근 권한을 얻음
    
    // entity 추가되거나 제거 될 때 자동으로 업데이트 함,sortDescriptors 알파벳 오름차순 정렬
    @FetchRequest(entity: Product.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Product name", text: $name)
                TextField("Product quantity", text: $quantity)
                
                HStack {
                    Spacer()
                    Button("Add") {
                        addProduct()
                    }
                    Spacer()
                    NavigationLink(destination: ResultsView(name: name, viewContext: viewContext)) {
                        Text("Find")
                    }
                    Spacer()
                    Button("Clear"){
                        name = ""
                        quantity = ""
                    }
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                List {
                    ForEach(products) {product in
                        HStack {
                            Text(product.name ?? "Not found")
                            Spacer()
                            Text(product.quantity ?? "Not found")
                        }
                    }
                    // onDelete() 수정자를 이용해 함수 호출
                    .onDelete(perform: deleteProducts)
                }
                .navigationTitle("Product Database")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
    
    // 코어 데이터에 의해 영구 저장소에 저장 () 엔티티 속성에 할당
    private func addProduct() {
        withAnimation {
            let product = Product(context: viewContext)
            product.name = name
            product.quantity = quantity
            
            saveContext()
        }
    }
    
    // 삭제하기, 삭제하기 위해 사용자가 선택한 항목의 위치를 나타내는 offsets세트.
    private func deleteProducts(offsets: IndexSet) {
        withAnimation {
            offsets.map { products[$0]}.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    // 코어 데이터에 의해 영구 저장소에 저장
    private func saveContext() {
        do {
            try viewContext.save() // 영구저장소
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }
}

// 검색기능 ResultsView에 name상태 프로퍼티와 viewContext객체에대한 참조가 전달됨. 일치하는 제품의 검색결과를 List에 표시될 matches 상태프로퍼티 선언
// task() 수정자를 적용하여 검색이 비동기적으로 수행되며 검색이 실행되기 전에 뷰의 모든 속성이 초기화됨.
struct ResultsView: View {
    var name: String
    var viewContext: NSManagedObjectContext
    
    @State var matches: [Product]?
    
    var body: some View {
        return VStack {
            List {
                ForEach(matches ?? []) {match in
                    HStack {
                        Text(match.name ?? "Not found")
                        Spacer()
                        Text(match.quantity ?? "Not found")
                    }
                }
            }
            .navigationTitle("Results")
        }
        .task {
            let fetchRequest: NSFetchRequest<Product>  = Product.fetchRequest()
            fetchRequest.entity = Product.entity()
            // 모든 제품을 찾을 수 있도록 조건에 CONTAINS 키워드 사용. (부분적 일치하는 것도 찾는 LIKE 키워드 많은 유연성을 제공). NSPredicate일치한 항목을 찾는 인스턴스
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS %@", name)
            // 가져오기 요청 fetch() 메서드에 전달 결과는 matches상태 객체에 할당
            matches = try? viewContext.fetch(fetchRequest)

        }
    }
}

#Preview {
    ContentView()
}
