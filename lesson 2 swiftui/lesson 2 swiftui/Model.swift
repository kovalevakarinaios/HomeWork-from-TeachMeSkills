//
//  Model.swift
//  lesson 2 swiftui
//
//  Created by Karina Kovaleva on 12.12.22.
//

import Foundation
import Combine

struct Photo: Codable {
    var albumId: Int
    var id : Int
    var title: String
    var url: URL
    var thumbnailUrl: URL
}

class Model: ObservableObject {
//
//    @Published var int: Int = 0
//    @Published var string = ""
    
    @Published var photos: [Photo] = []
    
    var int = CurrentValueSubject<Int, Error>(0)
    var string = PassthroughSubject<String, Never>()
    @Published var time: Int = 0
    var cancelables: Set<AnyCancellable> = []
    
    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23]
    var arrayOfStrings: [String] = []
    
    func load() {
        let cancelable = int
            .map { String($0) }
//            .sink(receiveValue: <#T##((String) -> Void)##((String) -> Void)##(String) -> Void#>)
//            .assign(to: &$string)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { string in
                self.string.send(string)
            }
            .store(in: &cancelables)
//        cancelable.cancel()
//        cancelables.insert(cancelable)
    }
    
    func loadData() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
        
        publisher
            .map(\.data)
            .decode(type: [Photo].self, decoder: JSONDecoder())
//            .catch({ <#Publishers.Decode<Publishers.MapKeyPath<URLSession.DataTaskPublisher, JSONDecoder.Input>, [Photo], JSONDecoder>.Failure#> in
//                <#code#>
//            })
//                .flatMap({ <#[Photo]#> in
//                    <#code#>
//                })
//            .retry(<#T##retries: Int##Int#>)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
            } receiveValue: { [weak self] data in
                self?.photos = data
            }
            .store(in: &cancelables)
    }
    
    func loadArray() {
        array.publisher
            .map { String($0) }
            .sink { [weak self] string in
                self?.arrayOfStrings.append(string)
            }
            .store(in: &cancelables)
    }
    
    func loadInt() {
//        .fail
        Just(1)
            .map { String($0) }
            .sink { [weak self] string in
                self?.arrayOfStrings.append(string)
            }
            .store(in: &cancelables)
    }
    
    func loadTimer() {
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink { [weak self] timer in
                self?.time += 1
            }
            .store(in: &cancelables)
    }
}
