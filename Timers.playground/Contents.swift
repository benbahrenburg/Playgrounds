//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit

PlaygroundPage.current.needsIndefiniteExecution = true

final public class DelayTimer {
    fileprivate let interval: TimeInterval
    fileprivate var timer: Timer?
    
    init(interval: TimeInterval) {
        self.interval = interval
    }
    
    func run(closure: @escaping ()-> Void) -> DelayTimer? {
        guard timer == nil else {
            print("timer already set, call clear before running again.")
            return self
        }
        timer = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: false, block: {(timer) in
            closure()
            self.clear()
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

final public class RepeatTimer {
    fileprivate let interval: TimeInterval
    fileprivate var timer: Timer?
    
    init(interval: TimeInterval) {
        self.interval = interval
    }
    
    func run(closure: @escaping ()-> Void) -> RepeatTimer? {
        guard timer == nil else {
            print("timer already set, call clear before running again.")
            return self
        }
        timer = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true, block: {(timer) in
                closure()
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
let t = RepeatTimer(interval: 2)

t.run(closure: {
    if tCounter > 15 {
        print("stopping t")
        return t.clear()
    }
    print("hello from t")
    tCounter += 1
})

let t2 = RepeatTimer(interval: 12).run(closure: {
    print("hello from t2")
})


let y = DelayTimer(interval: 3).run(closure: {
    print("y timer")
})
