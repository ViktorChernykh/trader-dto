//
//  Date+Extension.swift
//  trader-dto
//
//  Created by Victor Chernykh on 29.01.2025.
//

import Foundation

public extension Date {

	@inline(__always)
	static func makeRage(for year: Int, month: Int? = nil, day: Int? = nil) throws -> [Encodable & Sendable] {
		guard year > 0, year < 3000 else {
			throw "Invalid year."
		}
		var calendar: Calendar = .init(identifier: .gregorian)
		let timeZone: TimeZone = .init(identifier: "Europe/Moscow")!
		calendar.timeZone = timeZone

		let componentsFrom: DateComponents
		let componentsTo: DateComponents

		if month == nil, day == nil {
			componentsFrom = .init(calendar: calendar, timeZone: timeZone, year: year, month: 1, day: 1)
			componentsTo = .init(calendar: calendar, timeZone: timeZone, year: year + 1, month: 1, day: 1)
		} else if let month, day == nil {
			componentsFrom = .init(calendar: calendar, timeZone: timeZone, year: year, month: month, day: 1)
			componentsTo = .init(calendar: calendar, timeZone: timeZone, year: year, month: month + 1, day: 1)
		} else if let month, let day {
			componentsFrom = .init(calendar: calendar, timeZone: timeZone, year: year, month: month, day: day)
			componentsTo = .init(calendar: calendar, timeZone: timeZone, year: year, month: month, day: day + 1)
		} else {
			let day: Int = day ?? 1
			componentsFrom = .init(calendar: calendar, timeZone: timeZone, year: year, month: 1, day: day)
			componentsTo = .init(calendar: calendar, timeZone: timeZone, year: year, month: 1, day: day + 1)
		}

		guard let from: Date = componentsFrom.date,
			  let to: Date = componentsTo.date else {
			throw "Invalid date components."
		}

		return [from, to]
	}

	@inline(__always)
	static func makeDate(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int, minute: Int, second: Int = 0) -> Date {
		var calendar: Calendar = .init(identifier: .gregorian)
		let timeZone: TimeZone = .init(identifier: "Europe/Moscow")!
		calendar.timeZone = timeZone

		var components: DateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
		if let year {
			components.year = year
		}
		if let month {
			components.month = month
		}
		if let day {
			components.day = day
		}
		components.hour = hour
		components.minute = minute
		components.second = second
		components.nanosecond = 0
		return calendar.date(from: components)!
	}

	@inline(__always)
	func makeDateEnd(timeZone: TimeZone = .init(identifier: "Europe/Moscow")!) -> Date {
		var calendar: Calendar = .init(identifier: .gregorian)
		calendar.timeZone = timeZone

		var components: DateComponents = calendar.dateComponents([.year, .month, .day], from: self)
		components.hour = 23
		components.minute = 59
		components.second = 59
		components.nanosecond = 999_999_999
		return calendar.date(from: components)!
	}

	@inline(__always)
	func makeDateBegin(timeZone: TimeZone = .init(identifier: "Europe/Moscow")!) -> Date {
		var calendar: Calendar = .init(identifier: .gregorian)
		calendar.timeZone = timeZone

		var components: DateComponents = calendar.dateComponents([.year, .month, .day], from: self)
		components.hour = 0
		components.minute = 0
		components.second = 0
		components.nanosecond = 0
		return calendar.date(from: components)!
	}

	@inline(__always)
	func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
		calendar.dateComponents(Set(components), from: self)
	}

	/// Returns the value for one component of a date.
	///
	/// - parameters:
	///   - component: The component to calculate, like Component.year, .month, .day, .hour, .minute, .second, etc.
	///   - calendar: encapsulates information about systems of reckoning time in which the beginning, length, and divisions of a year are defined.
	/// - returns: The value for the component.
	@inline(__always)
	func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
		calendar.component(component, from: self)
	}

	@inline(__always)
	func convertTimeZone(to timeZone: TimeZone) -> Date {
		 let delta: Int = timeZone.secondsFromGMT(for: self) - TimeZone.current.secondsFromGMT(for: self)
		 return addingTimeInterval(TimeInterval(delta))
	}

	/// Converts a date and time from the current time zone to UTC.
	///
	/// - Returns: A `Date` object representing the same time in UTC.
	@inline(__always)
	func convertToUTC() -> Date {
		// Calculate the offset in seconds between the current time zone and UTC
		let delta: Int = TimeZone.current.secondsFromGMT(for: self)
		return addingTimeInterval(TimeInterval(delta))
	}

	@inline(__always)
	var daysInMonth: Int? {
		let calendar: Calendar = .current
		let components: DateComponents = calendar.dateComponents([.year, .month], from: self)

		// Try to get the first day of the month
		guard let date: Date = calendar.date(from: components) else {
			return nil
		}

		// Get the range of days in the month
		let range: Range<Int>? = calendar.range(of: .day, in: .month, for: date)
		return range?.count
	}

	@inline(__always)
	func roundBy5() -> Date {
		let hour: Int = get(.hour)
		let minutes: Int = get(.minute)

		var calendar: Calendar = .current
		calendar.timeZone = TimeZone(identifier: "Europe/Moscow")!

		return if minutes < 5 {
			calendar.date(bySettingHour: hour, minute: 5, second: 0, of: self)!
		} else if minutes < 10 {
			calendar.date(bySettingHour: hour, minute: 10, second: 0, of: self)!
		} else if minutes < 15 {
			calendar.date(bySettingHour: hour, minute: 15, second: 0, of: self)!
		} else if minutes < 20 {
			calendar.date(bySettingHour: hour, minute: 20, second: 0, of: self)!
		} else if minutes < 25 {
			calendar.date(bySettingHour: hour, minute: 25, second: 0, of: self)!
		} else if minutes < 30 {
			calendar.date(bySettingHour: hour, minute: 30, second: 0, of: self)!
		} else if minutes < 35 {
			calendar.date(bySettingHour: hour, minute: 35, second: 0, of: self)!
		} else if minutes < 40 {
			calendar.date(bySettingHour: hour, minute: 40, second: 0, of: self)!
		} else if minutes < 45 {
			calendar.date(bySettingHour: hour, minute: 45, second: 0, of: self)!
		} else if minutes < 50 {
			calendar.date(bySettingHour: hour, minute: 50, second: 0, of: self)!
		} else if minutes < 55 {
			calendar.date(bySettingHour: hour, minute: 55, second: 0, of: self)!
		} else {
			calendar.date(bySettingHour: hour + 1, minute: 0, second: 0, of: self)!
		}
	}

	@inline(__always)
	var minuteMoex: String {
		Constants.moexMinuteDateFormatter.string(from: self)
	}

	@inline(__always)
	var dayMoex: String {
		Constants.moexDayDateFormatter.string(from: self)
	}

	@inline(__always)
	var monthMoex: String {
		Constants.moexMonthDateFormatter.string(from: self)
	}

	@inline(__always)
	var yearMoex: String {
		Constants.moexYearDateFormatter.string(from: self)
	}

	@inline(__always)
	var datetimeMoex: String {
		Constants.moexDatetimeFormatter.string(from: self)
	}

	@inline(__always)
	var dateMoex: String {
		Constants.moexDateFormatter.string(from: self)
	}

	/// Full time with nanoseconds.
	@inline(__always)
	var moscow: String {
		Constants.moscowDatetimeFormatter.string(from: self)
	}

	@inline(__always)
	var daysSince1970: Int {
		Int(self.timeIntervalSince1970 / 86400)
	}

	@inline(__always)
	var daysSince2000: Int {
		let calendar: Calendar = .current
		let startOf2000: Date = calendar.date(from: DateComponents(year: 2000, month: 1, day: 1))!
		return calendar.dateComponents([.day], from: startOf2000, to: self).day ?? 0
	}

	@inline(__always)
	var timestampSec: String {
		"\(Int(self.timeIntervalSince1970))"
	}

	@inline(__always)
	var timestamp: String {
		"\(self.timeIntervalSince1970)"
	}
}
