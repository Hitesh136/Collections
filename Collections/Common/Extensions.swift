//
//  Constants.swift
//  Collections
//
//  Created by Hitesh Agarwal on 07/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import Foundation
extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}

extension Date {
    static func date(year: Int, month: Int, day: Int) -> Date? {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar.current
        return calendar.date(from: dateComponents)
    }
}
