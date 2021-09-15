@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testFoo() throws {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "foo")
    }

    func testDecreaseSellIn() {
        let items = [Item(name: "foo", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 1)
    }

    func testNotDecreaseSellInLegedaryItem() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 2, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 2)
    }

    func testSellInCanGoNegative() {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, -1)
    }

    static var allTests = [
        ("testFoo", testFoo),
        ("testDecreaseSellIn", testDecreaseSellIn),
        ("testNotDecreaseSellInLegedaryItem", testNotDecreaseSellInLegedaryItem),
        ("testSellInCanGoNegative", testSellInCanGoNegative)
    ]
}
