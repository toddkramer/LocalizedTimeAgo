//
//  LocalizedTimeAgo.swift
//
//  Copyright (c) 2017 Todd Kramer (http://www.tekramer.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

fileprivate class Constants {
    static let resource = "LocalizedTimeAgo"
}

fileprivate extension Bundle {
    
    static var moduleBundle: Bundle {
        guard let path = Bundle(for: Constants.self).resourcePath else { return .main }
        return Bundle(path: path.appending("/\(Constants.resource).bundle")) ?? .main
    }

}

fileprivate extension String {

    func adjustedKey(forValue value: Int) -> String {
        let code = Bundle.main.preferredLocalizations.first ?? "en"
        if code != "ru" && code != "uk" { return self }
        let xy = Int(floor(Double(value)).truncatingRemainder(dividingBy: 100))
        let y = Int(floor(Double(value)).truncatingRemainder(dividingBy: 10))
        if(y == 0 || y > 4 || (xy > 10 && xy < 15)) { return self }
        if(y > 1 && y < 5 && (xy < 10 || xy > 20))  { return "_" + self }
        if(y == 1 && xy != 11) { return "__" + self }
        return self
    }

    func localized() -> String {
        return NSLocalizedString(self, tableName: Constants.resource, bundle: Bundle.moduleBundle, value: "", comment: "")
    }

}

public extension Date {

    private var calendar: Calendar { return .current }

    private var components: DateComponents {
        let unitFlags = Set<Calendar.Component>([.second,.minute,.hour,.day,.weekOfYear,.month,.year])
        let now = Date()
        return calendar.dateComponents(unitFlags, from: self, to: now)
    }

    func timeAgo(numericDates: Bool = false, numericTimes: Bool = false) -> String {
        let components = self.components
        if let year = components.year, year > 0 {
            if year >= 2 { return String(format: "%d years ago".adjustedKey(forValue: year).localized(), year) }
            return numericDates ? "1 year ago".localized() : "Last year".localized()
        } else if let month = components.month, month > 0 {
            if month >= 2 { return String(format: "%d months ago".adjustedKey(forValue: month).localized(), month) }
            return numericDates ? "1 month ago".localized() : "Last month".localized()
        } else if let week = components.weekOfYear, week > 0 {
            if week >= 2 { return String(format: "%d weeks ago".adjustedKey(forValue: week).localized(), week) }
            return numericDates ? "1 week ago".localized() : "Last week".localized()
        } else if let day = components.day, day > 0 {
            let isYesterday = calendar.isDateInYesterday(self)
            if day >= 2 && !isYesterday { return String(format: "%d days ago".adjustedKey(forValue: day).localized(), day) }
            return numericDates ? "1 day ago".localized() : "Yesterday".localized()
        } else if let hour = components.hour, hour > 0 {
            if hour >= 2 { return String(format: "%d hours ago".adjustedKey(forValue: hour).localized(), hour) }
            return numericDates ? "1 hour ago".localized() : "An hour ago".localized()
        } else if let minute = components.minute, minute > 0 {
            if minute >= 2 { return String(format: "%d minutes ago".adjustedKey(forValue: minute).localized(), minute) }
            return numericDates ? "1 minute ago".localized() : "A minute ago".localized()
        } else if let second = components.second, second >= 3 {
            return String(format: "%d seconds ago".adjustedKey(forValue: second).localized(), second)
        }
        return numericTimes ? "1 second ago".localized() : "Just now".localized()
    }

    func shortTimeAgo() -> String {
        let components = self.components
        if let year = components.year, year > 0 {
            return String(format: "%dy".localized(), year)
        } else if let month = components.month, month > 0 {
            return String(format: "%dM".localized(), month)
        } else if let week = components.weekOfYear, week > 0 {
            return String(format: "%dw".localized(), week)
        } else if let day = components.day, day > 0 {
            if calendar.isDateInYesterday(self) { return "1d" }
            return String(format: "%dd".localized(), day)
        } else if let hour = components.hour, hour > 0 {
            return String(format: "%dh".localized(), hour)
        } else if let minute = components.minute, minute > 0 {
            return String(format: "%dm".localized(), minute)
        } else if let second = components.second, second > 0 {
            return String(format: "%ds".localized(), second)
        }
        return "1s".localized()
    }

}
