//
//  ViewController.swift
//  27_Lesson_Concurrency
//
//  Created by Karina Kovaleva on 9.11.22.
//

import UIKit

class ViewController: UIViewController {

    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Таймеры существуют в ранлупах, в большинстве случаев доп. создавать не стоит
//        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
//            timer.invalidate()
//        }
//
//        RunLoop.main.add(timer, forMode: .common)
        
        
//    Многопоточность:
//        1. pthread
//        2. Thread
//        3. GCD -> Queue
//        4. OperationQueue
//        5. SwiftConcurrency
        
//        2. Thread
        
//        let thread = Thread {
//            print("Hello, Thread")
//        }
//        thread.start()
        
//        3. GCD -> Queue
        
        let queue = DispatchQueue(label: "123",
                                  qos: .userInteractive)
        
//        print("Start")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            print("Operation finished")
//        }
//        print("Operation started")
        
        print("Start")
        
        let item = DispatchWorkItem(qos: .userInteractive, flags: [.barrier]) {
            sleep(1)
            print("Operation 0 finished")
            self.group.leave()
        }
        
        var count: Int = 0 {
            didSet {
                if count > 3 {
                    
                }
            }
        }
        group.enter()
        queue.async {
            sleep(1)
            count += 1
            print("Operation 0 finished")
            self.group.leave()
        }
        
        group.enter()
        queue.async {
            sleep(1)
            count += 1
            print("Operation 1 finished")
            self.group.leave()        }
        
        group.enter()
        queue.async {
            sleep(1)
            count += 1
            print("Operation 2 finished")
            self.group.leave()        }
        
        group.notify(queue: queue) {
            print("Operation started")
        }
    }
}
