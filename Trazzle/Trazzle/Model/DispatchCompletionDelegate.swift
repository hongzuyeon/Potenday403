//
//  Delegate.swift
//  Trazzle
//
//  Created by joomin on 4/16/24.
//

import Foundation

protocol DispatchCompletionDelegate: class {
    func dispatchQueueDidFinishTask()
}
