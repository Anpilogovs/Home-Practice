import UIKit

// ---------------------------------------------   Enum

enum ColorState: Int {
    case dead
    case new
    case old

    func color () -> UIColor {
        switch self {
        case .dead: return .brown
        case .new: return .blue
        case .old: return .cyan
        }
    }
}

ColorState.dead.color()

// --------------------------------------------- Class

class Tavern {
    var fighters: [Fightable] = []
    var movers: [Movable] = []

    func enterTavern(hero: Hero) {
        hero.fight()
        for i in movers {
            i.run()
        }
    }
    func fighters(hero: Hero) {
        hero.fight()

        for i in fighters {
            i.fight()
        }
    }
}
// ---------------------------------------------  Protocol



protocol Movable {
    func run()
}
protocol Fightable {
    func fight()
}

protocol Hero: Movable, Fightable {
    var name: String { get }
}

// --------------------------------------------- Struct
struct Farmer: Movable {
    func run() {
        print ("Farmer: Run")
    }
}

struct Human: Movable {
    func run() {
        print("Human: Run")
    }
}

struct SpriderMan: Hero {
    var name: String

    func run() {
        print("SpiderMan: Fust Run")
    }

    func fight() {
        print("Super Power: Web")
    }
}

struct IronMan: Hero {
    var name: String

    func run() {
        print("IronMan: Fast Fly on sky")
    }

    func fight() {
        print("IronMan: Blow to laser")
    }
}

struct Buther: Fightable {
    func fight() {
        print("Butcher: Fight")
    }
}

struct Killer: Fightable {
    func fight() {
        print("Killer: Fight")
    }
}




var framer = Farmer()
var human = Farmer()
var buther = Buther()
var killer = Killer()

var ironman = IronMan(name: "IronMan")
var spiderman = SpriderMan(name: "SpiderMan")


var taverna = Tavern()

taverna.movers = [spiderman,ironman,framer,human]
taverna.fighters = [spiderman,ironman,buther,killer]
taverna.enterTavern(hero: ironman)
taverna.enterTavern(hero: ironman)
taverna.fighters(hero: ironman)
taverna.fighters(hero: ironman)



// -------------------------------------------------- func
func changeValues<T>( a:  inout T, b:  inout T) {
    print("Input Value: A = \(a) and B = \(b)")
    let valueOne = a
    a = b
    b = valueOne
    print("Change Value: A = \(a) and  B = \(b)")
}
var number1 = "One"
var number2 = "Two"

changeValues(a: &number1, b: &number2)


// ------------------------------------------------ Struct
struct Stack<T> {
    var stackElement = [T]()
    init(element: T...) {
        self.stackElement = element
    }

    mutating func push(item: T) {
        stackElement.append(item)
    }
    
    mutating func pop() -> T {
        return stackElement.removeLast()
    }
}

var stackInt = Stack(element: 1,2,3,4,5)
stackInt.stackElement
var stackStr = Stack(element: "One","Two","Free","Four")
stackStr.stackElement



// --------------------------------------------- Extension
extension Double {
    var squre: Double { return self * self }
}

let numberInSquere = 6.squre



var literal = "Vasiliev Aleksei, Anatolii"

extension String {
    var firstWord: String { return String(self.prefix(16))}
    var wordToTheComm: String { return self.components(separatedBy: " ").first ?? "nil"}
    var proposal: String { self.appending("!")}
}
print(literal.firstWord)
print(literal.wordToTheComm)
print(literal.proposal)
