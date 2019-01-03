//
//  Generator.swift
//  Animation
//
//  Created by Student on 02.01.2019.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation

class Generator<Value> {
    
    private let index: Atomic<Int>
    private let objects: Atomic<[Value]>
    
    init(objects: [Value]) {
        self.objects = Atomic(objects)
        self.index = Atomic(0)
    }
    
    convenience init(objects: Value...) {
        self.init(objects: objects)
    }
    
    func next() -> Value {
        let index: Int = self.index.modify { index in
            defer { index = (index + 1) % self.objects.value.count }
            
            return index
        }
        
        return self.objects.value[index]
    }
}
