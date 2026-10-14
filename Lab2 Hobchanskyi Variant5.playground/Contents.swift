
import Foundation

// MARK: - 5. Перелік можливих операційних систем

enum OperatingSystem: String {
    case iOS = "iOS"
    case Android = "Android"
    case WindowsPhone = "Windows Phone"
}

// MARK: - 1. Структура телефона

struct Phone {
    var model: String
    var manufacturer: String
    var memoryGB: Int?
    var operatingSystem: String?
    var operatingSystemType: OperatingSystem?

    // Метод повертає повний опис телефона у вигляді рядка.
    func description() -> String {
        let memoryText: String

        // Optional binding: перевіряємо, чи відомий обсяг пам'яті.
        if let memoryGB = memoryGB {
            memoryText = "\(memoryGB) GB"
        } else {
            memoryText = "не вказано"
        }

        // Якщо назва ОС відсутня, підставляємо текст за замовчуванням.
        let osVersionText = operatingSystem ?? "не вказана"

        // Отримуємо текстове значення enum.
        let osTypeText = operatingSystemType?.rawValue ?? "не вказана"

        return """
        Модель: \(model)
        Виробник: \(manufacturer)
        Обсяг пам'яті: \(memoryText)
        Назва або версія ОС: \(osVersionText)
        Тип ОС (enum): \(osTypeText)
        """
    }
}

// MARK: - 2. Звичайна функція

func phoneDescription(phone: Phone) {
    print(phone.description())
}

// Додатковий клас із аналогічним методом опису телефона.
class PhoneInfoPrinter {
    func phoneDescription(phone: Phone) {
        print("Опис телефона через метод класу:")
        print(phone.description())
    }
}

// MARK: - 4. Клас користувача

class User {
    var name: String
    var phone: Phone?

    // Ініціалізатор задає початкові дані користувача.
    init(name: String, phone: Phone?) {
        self.name = name
        self.phone = phone
    }

    // Метод показує телефон, якщо він існує.
    func showPhoneInfo() {
        print("\nКористувач: \(name)")

        // guard let перевіряє наявність телефона.
        guard let phone = phone else {
            print("\(name) не має телефона.")
            return
        }

        print("Телефон користувача:")
        print(phone.description())
    }
}

// MARK: - 3. Створення масиву телефонів

let phones: [Phone] = [
    Phone(
        model: "iPhone 16",
        manufacturer: "Apple",
        memoryGB: 256,
        operatingSystem: "iOS 18",
        operatingSystemType: .iOS
    ),

    Phone(
        model: "Galaxy S25",
        manufacturer: "Samsung",
        memoryGB: 512,
        operatingSystem: "Android 15",
        operatingSystemType: .Android
    ),

    Phone(
        model: "Lumia 950",
        manufacturer: "Microsoft",
        memoryGB: 32,
        operatingSystem: "Windows Phone 8.1",
        operatingSystemType: .WindowsPhone
    ),

    Phone(
        model: "Невідомий телефон",
        manufacturer: "Невідомий виробник",
        memoryGB: nil,
        operatingSystem: nil,
        operatingSystemType: nil
    )
]

// Виводимо характеристики всіх телефонів.
print("========== МАСИВ ТЕЛЕФОНІВ ==========")

for phone in phones {
    phoneDescription(phone: phone)
    print("------------------------------")
}

// Перевіряємо аналогічний метод класу.
let printer = PhoneInfoPrinter()
printer.phoneDescription(phone: phones[0])

// Перевіряємо користувача, у якого є телефон.
let userWithPhone = User(name: "Олена", phone: phones[0])
userWithPhone.showPhoneInfo()

// Перевіряємо користувача без телефона.
let userWithoutPhone = User(name: "Андрій", phone: nil)
userWithoutPhone.showPhoneInfo()

// MARK: - Додатково: перетворення типів даних

let memoryAsInt: Int = phones[0].memoryGB ?? 0
let memoryAsDouble: Double = Double(memoryAsInt)
let memoryAsString: String = String(memoryAsInt)

print("\nОбсяг пам'яті як Int: \(memoryAsInt)")
print("Обсяг пам'яті як Double: \(memoryAsDouble)")
print("Обсяг пам'яті як String: \(memoryAsString)")

// MARK: - Додатково: копіювання структури

var originalPhone = phones[0]
var copiedPhone = originalPhone

copiedPhone.model = "iPhone 16 Pro (копія)"

print("\nОригінальна модель: \(originalPhone.model)")
print("Модель копії: \(copiedPhone.model)")

