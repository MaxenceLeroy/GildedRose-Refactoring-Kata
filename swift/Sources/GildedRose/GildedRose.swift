public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    private let minimumQuality = 0
    private let maximumQuality = 50
    
    private func increaseItemQuality(item: Item, amount: Int) {
        item.quality = min(item.quality + amount, maximumQuality)
    }
    
    private func decreaseItemQuality(item: Item, amount: Int) {
        item.quality = max(item.quality - amount, minimumQuality)
    }
    
    public func updateQuality() {
        for item in items {
            if (item.itemType() != .cheese && item.itemType() != .backstagePass) {
                if (item.itemType() != .legendary) {
                    decreaseItemQuality(item: item, amount: 1)
                }
            } else {
                increaseItemQuality(item: item, amount: 1)
                
                if (item.itemType() == .backstagePass) {
                    if (item.sellIn < 11) {
                        increaseItemQuality(item: item, amount: 1)
                    }
                    
                    if (item.sellIn < 6) {
                        increaseItemQuality(item: item, amount: 1)
                    }
                }
            }
            
            if (item.itemType() != .legendary) {
                item.sellIn = item.sellIn - 1
            }
            
            if (item.sellIn < 0) {
                if (item.itemType() != .cheese) {
                    if (item.itemType() != .backstagePass) {
                        if (item.itemType() != .legendary) {
                            decreaseItemQuality(item: item, amount: 1)
                        }
                    } else {
                        decreaseItemQuality(item: item, amount: item.quality)
                    }
                } else {
                    increaseItemQuality(item: item, amount: 1)
                }
            }
        }
    }
}

enum ItemType {
    case normal, cheese, backstagePass, legendary
}

extension Item {
    func itemType() -> ItemType {
        if name == "Aged Brie" {
            return .cheese
        } else if name == "Backstage passes to a TAFKAL80ETC concert" {
            return .backstagePass
        } else if name == "Sulfuras, Hand of Ragnaros" {
            return .legendary
        } else {
            return .normal
        }
    }
}
