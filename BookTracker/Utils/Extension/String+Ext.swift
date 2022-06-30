//
//  String+Ext.swift
//  BookTracker
//
//  Created by Raphaël Payet on 30/06/2022.
//

import Foundation

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func prepareForQueries() -> String {
        return self.replace(string: " ", replacement: "+")
    }
  }
