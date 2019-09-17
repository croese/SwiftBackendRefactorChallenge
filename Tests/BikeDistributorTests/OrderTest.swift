import XCTest
@testable import BikeDistributor

final class OrderTest: XCTestCase {
    static var allTests = [
        ("testReceiptOneDefy", testReceiptOneDefy),
        ("testReceiptOneElite", testReceiptOneElite),
        ("testReceiptOneDuraAce", testReceiptOneDuraAce),
        ("testHtmlReceiptOneDefy", testHtmlReceiptOneDefy),
        ("testHtmlReceiptOneElite", testHtmlReceiptOneElite),
        ("testHtmlReceiptOneDuraAce", testHtmlReceiptOneDuraAce),
    ]
    
    
    private static let defy = Bike(brand: "Giant", model: "Defy 1", price: Bike.oneThousand)
    private static let elite = Bike(brand: "Specialized", model: "Venge Elite", price: Bike.twoThousand)
    private static let duraAce = Bike(brand: "Specialized", model: "S-Works Venge Dura-Ace", price: Bike.fiveThousand)
    
    private static let resultStatementOneDefy = """
Order Receipt for Anywhere Bike Shop
\t1 x Giant Defy 1 = $1,000.00
Sub-Total: $1,000.00
Tax: $72.50
Total: $1,072.50
"""
    
    func testReceiptOneDefy() {
        var order = Order(company: "Anywhere Bike Shop")
        order.add(line: Line(bike: OrderTest.defy, quantity: 1))
        XCTAssertEqual(OrderTest.resultStatementOneDefy, order.receipt())
    }
    
    private static let resultStatementOneElite = """
Order Receipt for Anywhere Bike Shop
\t1 x Specialized Venge Elite = $2,000.00
Sub-Total: $2,000.00
Tax: $145.00
Total: $2,145.00
"""
    
    func testReceiptOneElite() {
        var order = Order(company: "Anywhere Bike Shop")
        order.add(line: Line(bike: OrderTest.elite, quantity: 1))
        XCTAssertEqual(OrderTest.resultStatementOneElite, order.receipt())
    }
    
    private static let resultStatementOneDuraAce = """
Order Receipt for Anywhere Bike Shop
\t1 x Specialized S-Works Venge Dura-Ace = $5,000.00
Sub-Total: $5,000.00
Tax: $362.50
Total: $5,362.50
"""
    
    func testReceiptOneDuraAce() {
        var order = Order(company: "Anywhere Bike Shop")
        order.add(line: Line(bike: OrderTest.duraAce, quantity: 1))
        XCTAssertEqual(OrderTest.resultStatementOneDuraAce, order.receipt())
    }
    
    private static let htmlResultStatementOneDefy = "<html><body><h1>Order Receipt for Anywhere Bike Shop</h1><ul><li>1 x Giant Defy 1 = $1,000.00</li></ul><h3>Sub-Total: $1,000.00</h3><h3>Tax: $72.50</h3><h2>Total: $1,072.50</h2></body></html>"
    
    func testHtmlReceiptOneDefy() {
        var order = Order(company: "Anywhere Bike Shop")
        order.add(line: Line(bike: OrderTest.defy, quantity: 1))
        XCTAssertEqual(OrderTest.htmlResultStatementOneDefy, order.htmlReceipt())
    }
    
    private static let htmlResultStatementOneElite = "<html><body><h1>Order Receipt for Anywhere Bike Shop</h1><ul><li>1 x Specialized Venge Elite = $2,000.00</li></ul><h3>Sub-Total: $2,000.00</h3><h3>Tax: $145.00</h3><h2>Total: $2,145.00</h2></body></html>"
    
    func testHtmlReceiptOneElite() {
        var order = Order(company: "Anywhere Bike Shop")
        order.add(line: Line(bike: OrderTest.elite, quantity: 1))
        XCTAssertEqual(OrderTest.htmlResultStatementOneElite, order.htmlReceipt())
    }
    
    private static let htmlResultStatementOneDuraAce = "<html><body><h1>Order Receipt for Anywhere Bike Shop</h1><ul><li>1 x Specialized S-Works Venge Dura-Ace = $5,000.00</li></ul><h3>Sub-Total: $5,000.00</h3><h3>Tax: $362.50</h3><h2>Total: $5,362.50</h2></body></html>"
    
    func testHtmlReceiptOneDuraAce() {
        var order = Order(company: "Anywhere Bike Shop")
        order.add(line: Line(bike: OrderTest.duraAce, quantity: 1))
        XCTAssertEqual(OrderTest.htmlResultStatementOneDuraAce, order.htmlReceipt())
    }
}
