//
//  Date+.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 30/01/26.
//

import Foundation

extension Date {
    func timeAgoString() -> String {
        let now = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents(
            [.minute, .hour, .day, .month, .year],
            from: self,
            to: now
        )

        if let year = components.year, year > 0 {
            return year == 1 ? "1 year ago" : "\(year) years ago"
        }

        if let month = components.month, month > 0 {
            return month == 1 ? "1 month ago" : "\(month) months ago"
        }

        if let day = components.day {
            if day == 1 {
                return "Yesterday"
            } else if day > 1 {
                return "\(day) days ago"
            }
        }

        if let hour = components.hour, hour > 0 {
            let minutes = components.minute ?? 0
            if minutes > 0 {
                return "\(hour)h \(minutes)m ago"
            } else {
                return "\(hour)h ago"
            }
        }

        if let minute = components.minute, minute > 0 {
            return "\(minute) min ago"
        }

        return "Just now"
    }
}
