//
//  Int+UnixTime.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import Foundation

extension Int {
    func convertUnixTimeToString(format: String) -> String {
        let date = Date(timeIntervalSince1970: Double(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}
