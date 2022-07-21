//
//  a.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 17.07.22.
//

extension RangeReplaceableCollection {
    // Возвращает новую коллекцию в случайном порядке
    var shuffled: Self { .init(shuffled()) }
    // Перемешивает эту коллекцию на месте
    @discardableResult
    mutating func shuffledInPlace() -> Self {
        self = shuffled
        return self
    }
    func choose(_ n: Int) -> SubSequence { shuffled.prefix(n) }
}
