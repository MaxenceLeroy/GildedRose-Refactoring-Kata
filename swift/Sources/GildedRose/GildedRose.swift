public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    private let minimumQuality = 0
    private let maximumQuality = 50
    
    public func updateQuality() {
        for i in 0 ..< items.count {
            if (items[i].itemType() != .cheese && items[i].itemType() != .backstagePass) {
                if (items[i].quality > minimumQuality) {
                    if (items[i].itemType() != .legendary) {
                        items[i].quality = items[i].quality - 1
                    }
                }
            } else {
                if (items[i].quality < maximumQuality) {
                    items[i].quality = items[i].quality + 1
                    
                    if (items[i].itemType() == .backstagePass) {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < maximumQuality) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                        
                        if (items[i].sellIn < 6) {
                            if (items[i].quality < maximumQuality) {
                                items[i].quality = items[i].quality + 1
                            }
                        }
                    }
                }
            }
            
            if (items[i].itemType() != .legendary) {
                items[i].sellIn = items[i].sellIn - 1
            }
            
            if (items[i].sellIn < 0) {
                if (items[i].itemType() != .cheese) {
                    if (items[i].itemType() != .backstagePass) {
                        if (items[i].quality > minimumQuality) {
                            if (items[i].itemType() != .legendary) {
                                items[i].quality = items[i].quality - 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if (items[i].quality < maximumQuality) {
                        items[i].quality = items[i].quality + 1
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
