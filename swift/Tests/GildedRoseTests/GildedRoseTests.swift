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
    
    func testQualityDecreaseByOneForNormalItemEveryDay() {
        let items = [Item(name: "foo", sellIn: 2, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 19)
    }
    
    func testQualityDecreaseByTwoOnceSellInIsExperied() {
        let items = [Item(name: "foo", sellIn: 0, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 18)
    }
    
    func testQualityCanNotBeNegative() {
        let items = [Item(name: "foo", sellIn: 2, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }

    func testBrieIncreaseQuality() {
        let items = [Item(name: "Aged Brie", sellIn: 11, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 11)
    }

    func testBrieIncreaseDoubleQualityAfterSellIn() {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 12)
    }
    
    func testBrieQualityLimit() {
        let items = [Item(name: "Aged Brie", sellIn: 10, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 50)
    }

    func testBackstageIncreaseQuality() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 11, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 11)
    }
    
    func testBackstageIncreaseQualityLessThanTenDays() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 12)
    }
    
    func testBackstageIncreaseQualityLessThanFiveDays() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 13)
    }
    
    func testBackstageDecreaseQualityLessAfterSellIn() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testBackstageQualityDoesntGoNegative() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 0)
    }
    
    func testBackstageQualityLimit() {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 50)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 50)
    }
    
    func testQualityLegendaryItemDoesntChange() {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 2, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 80)
    }
    
    func testUpdateWithTwoItems() {
        let items = [Item(name: "foo", sellIn: 2, quality: 10), Item(name: "bar", sellIn: 20, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].sellIn, 1)
        XCTAssertEqual(app.items[0].quality, 9)
        XCTAssertEqual(app.items[1].sellIn, 19)
        XCTAssertEqual(app.items[1].quality, 19)
    }

    static var allTests = [
        ("testFoo", testFoo),
        ("testDecreaseSellIn", testDecreaseSellIn),
        ("testNotDecreaseSellInLegedaryItem", testNotDecreaseSellInLegedaryItem),
        ("testSellInCanGoNegative", testSellInCanGoNegative),
        ("testQualityDecreaseByOneForNormalItemEveryDay", testQualityDecreaseByOneForNormalItemEveryDay),
        ("testQualityDecreaseByTwoOnceSellInIsExperied", testQualityDecreaseByTwoOnceSellInIsExperied),
        ("testQualityCanNotBeNegative", testQualityCanNotBeNegative),
        ("testBrieIncreaseQuality", testBrieIncreaseQuality),
        ("testBrieIncreaseDoubleQualityAfterSellIn", testBrieIncreaseDoubleQualityAfterSellIn),
        ("testBrieQualityLimit", testBrieQualityLimit),
        ("testBackstageIncreaseQuality", testBackstageIncreaseQuality),
        ("testBackstageIncreaseQualityLessThanTenDays", testBackstageIncreaseQualityLessThanTenDays),
        ("testBackstageIncreaseQualityLessThanFiveDays", testBackstageIncreaseQualityLessThanFiveDays),
        ("testBackstageDecreaseQualityLessAfterSellIn", testBackstageDecreaseQualityLessAfterSellIn),
        ("testBackstageQualityDoesntGoNegative", testBackstageQualityDoesntGoNegative),
        ("testBackstageQualityLimit", testBackstageQualityLimit),
        ("testQualityLegendaryItemDoesntChange", testQualityLegendaryItemDoesntChange),
        ("testUpdateWithTwoItems", testUpdateWithTwoItems)
    ]
}
