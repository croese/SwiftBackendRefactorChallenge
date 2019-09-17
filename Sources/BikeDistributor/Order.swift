//
//  Order.swift
//  BikeDistributor
//
//  Created by Christian Roese on 9/17/19.
//

import Foundation

public struct Order {
    private let taxRate = 0.0725
    private var lines = [Line]()
    private let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        return formatter
    }()
    
    public let company: String
    
    public init(company: String) {
        self.company = company
    }
    
    public mutating func add(line: Line) {
        lines.append(line)
    }
    
    public func receipt() -> String {
        var totalAmount = 0.0
        var result = "Order Receipt for \(company)\n"
        
        for line in lines {
            var thisAmount = 0.0
            switch(line.bike.price) {
            case Bike.oneThousand:
                if line.quantity >= 20 {
                    thisAmount += Double(line.quantity) * Double(line.bike.price) * 0.9
                } else {
                    thisAmount += Double(line.quantity) * Double(line.bike.price)
                }
            case Bike.twoThousand:
                if line.quantity >= 10 {
                    thisAmount += Double(line.quantity) * Double(line.bike.price) * 0.8
                } else {
                    thisAmount += Double(line.quantity) * Double(line.bike.price)
                }
            case Bike.fiveThousand:
                if line.quantity >= 5 {
                    thisAmount += Double(line.quantity) * Double(line.bike.price) * 0.8
                } else {
                    thisAmount += Double(line.quantity) * Double(line.bike.price)
                }
                
            default:
                thisAmount += Double(line.quantity) * Double(line.bike.price)
            }
            
            result.append("\t\(line.quantity) x \(line.bike.brand) \(line.bike.model) = \(currencyFormatter.string(for: thisAmount)!)\n")
            totalAmount += thisAmount
        }
        
        result.append("Sub-Total: \(currencyFormatter.string(for: totalAmount)!)\n")
        let tax = totalAmount * taxRate
        result.append("Tax: \(currencyFormatter.string(for: tax)!)\n")
        let totalString = currencyFormatter.string(for: totalAmount + tax)!
        result.append("Total: \(totalString)")
        
        return result
    }
    
    public func htmlReceipt() -> String {
        var totalAmount = 0.0
        var result = "<html><body><h1>Order Receipt for \(company)</h1>"
        
        if !lines.isEmpty {
            result.append("<ul>")
            for line in lines {
                var thisAmount = 0.0
                switch(line.bike.price) {
                case Bike.oneThousand:
                    if line.quantity >= 20 {
                        thisAmount += Double(line.quantity) * Double(line.bike.price) * 0.9
                    } else {
                        thisAmount += Double(line.quantity) * Double(line.bike.price)
                    }
                case Bike.twoThousand:
                    if line.quantity >= 10 {
                        thisAmount += Double(line.quantity) * Double(line.bike.price) * 0.8
                    } else {
                        thisAmount += Double(line.quantity) * Double(line.bike.price)
                    }
                case Bike.fiveThousand:
                    if line.quantity >= 5 {
                        thisAmount += Double(line.quantity) * Double(line.bike.price) * 0.8
                    } else {
                        thisAmount += Double(line.quantity) * Double(line.bike.price)
                    }
                    
                default:
                    thisAmount += Double(line.quantity) * Double(line.bike.price)
                }
                
                result.append("<li>\(line.quantity) x \(line.bike.brand) \(line.bike.model) = \(currencyFormatter.string(for: thisAmount)!)</li>")
                totalAmount += thisAmount
            }
            result.append("</ul>")
        }
        
        result.append("<h3>Sub-Total: \(currencyFormatter.string(for: totalAmount)!)</h3>")
        let tax = totalAmount * taxRate
        result.append("<h3>Tax: \(currencyFormatter.string(for: tax)!)</h3>")
        let totalString = currencyFormatter.string(for: totalAmount + tax)!
        result.append("<h2>Total: \(totalString)</h2>")
        result.append("</body></html>")
        
        return result
    }
}
