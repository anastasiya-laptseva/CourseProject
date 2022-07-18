//
//  a.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

extension RangeReplaceableCollection {
    /// Returns a new Collection shuffled
    var shuffled: Self { .init(shuffled()) }
    /// Shuffles this Collection in place
    @discardableResult
    mutating func shuffledInPlace() -> Self  {
        self = shuffled
        return self
    }
    func choose(_ n: Int) -> SubSequence { shuffled.prefix(n) }
}
