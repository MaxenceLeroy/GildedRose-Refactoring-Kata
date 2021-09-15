public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    private let minimumQuality = 0
    private let maximumQuality = 50
    
    public func updateQuality() {
        for item in items {
            if (item.itemType() != .cheese && item.itemType() != .backstagePass) {
                if (item.quality > minimumQuality) {
                    if (item.itemType() != .legendary) {
                        item.quality = item.quality - 1
                    }
                }
            } else {
                if (item.quality < maximumQuality) {
                    item.quality = item.quality + 1
                    
                    if (item.itemType() == .backstagePass) {
                        if (item.sellIn < 11) {
                            if (item.quality < maximumQuality) {
                                item.quality = item.quality + 1
                            }
                        }
                        
                        if (item.sellIn < 6) {
                            if (item.quality < maximumQuality) {
                                item.quality = item.quality + 1
                            }
                        }
                    }
                }
            }
            
            if (item.itemType() != .legendary) {
                item.sellIn = item.sellIn - 1
            }
            
            if (item.sellIn < 0) {
                if (item.itemType() != .cheese) {
                    if (item.itemType() != .backstagePass) {
                        if (item.quality > minimumQuality) {
                            if (item.itemType() != .legendary) {
                                item.quality = item.quality - 1
                            }
                        }
                    } else {
                        item.quality = item.quality - item.quality
                    }
                } else {
                    if (item.quality < maximumQuality) {
                        item.quality = item.quality + 1
                    }
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
