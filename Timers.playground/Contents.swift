//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

protocol BXTimer {
    func run(closure: @escaping ()-> Void) -> BXTimer?
    func clear()
}

final public class DelayTimer: BXTimer {
    fileprivate let interval: TimeInterval
    fileprivate let queue = DispatchQueue(label: "com.bencoding.timer.delay", attributes: [.concurrent])
    fileprivate var timer: Timer?
    
    init(interval: TimeInterval) {
        self.interval = interval
    }
    
    func run(closure: @escaping ()-> Void) -> BXTimer? {
        guard timer == nil else {
            print("timer already set, call clear before running again.")
            return self
        }
        timer = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: false, block: {(timer) in
            self.queue.async {
                closure()
                self.clear()
            }
            
        })
        
        return self
    }
    
    func clear() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    deinit {
        self.clear()
    }
    
}

final public class RepeatTimer: BXTimer {
    fileprivate let interval: TimeInterval
    fileprivate let queue = DispatchQueue(label: "com.bencoding.timer.repeat", attributes: [.concurrent])
    fileprivate var timer: Timer?
    
    init(interval: TimeInterval) {
        self.interval = interval
    }
    
    func run(closure: @escaping ()-> Void) -> BXTimer? {
        guard timer == nil else {
            print("timer already set, call clear before running again.")
            return self
        }
        timer = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true, block: {(timer) in
            self.queue.async {
                closure()
            }
        })
        
        return self
    }
    
    func clear() {
        self.timer?.invalidate()
    }
    
    deinit {
        self.clear()
    }
    
}

var tCounter: Int = 0
let t = RepeatTimer(interval: 1)

t.run(closure: {
    if tCounter > 15 {
        print("stopping t")
        return t.clear()
    }
    print("hello from t")
    tCounter += 1
})

let t2 = RepeatTimer(interval: 10).run(closure: {
    print("hello from t2")
})


let y = DelayTimer(interval: 2).run(closure: {
    print("y timer")
})
