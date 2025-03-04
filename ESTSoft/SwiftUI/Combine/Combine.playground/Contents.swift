import Foundation
import Combine

//let source = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//let delayed = source.delay(for: .seconds(2), scheduler: DispatchQueue.main)
//
//let sub1 = source.sink { print("⚪ Emitting: \($0)") }
//let sub2 = delayed.sink { print("🔵 Delayed: \($0)") }

//let source = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//let collected = source.collect(.byTimeOrCount(DispatchQueue.main, .seconds(2), 2)).flatMap { $0.publisher }
//
//let sub1 = source.sink { print("⚪ Emitting: \($0)") }
//let sub2 = collected.sink { print("🔵 Collected: \($0)") }
//let subject = PassthroughSubject<String, Never>()
//
//let debounced = subject
//    .debounce(for: .seconds(1.0), scheduler: DispatchQueue.main)
//    .share()
//
//let sub = debounced.sink { print("🔵 Debounced: \($0)") }
//
//// 빠르게 값을 방출
//subject.send("A")
//subject.send("B")
//subject.send("C")
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
//    subject.send("D")
//}
//let subject = PassthroughSubject<String, Never>()
//
//let throttled = subject
//    .throttle(for: .seconds(1.0), scheduler: DispatchQueue.main, latest: true)
//    .share()
//
//let sub = throttled.sink { print("🔵 Throttled: \($0)") }
//
//// 빠르게 값을 방출
//subject.send("A")
//subject.send("B")
//subject.send("C")
//
//DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
//    subject.send("D")
//}
//let subject = PassthroughSubject<Void, Never>()
//
//let timedOutSubject = subject
//    .timeout(.seconds(5), scheduler: DispatchQueue.main)
//    .sink(
//        receiveCompletion: { print("❌ Timeout: \($0)") },
//        receiveValue: { print("✅ Received event") }
//    )
//
//// 3초 후 이벤트 발생 (타임아웃보다 빠름)
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//    subject.send(())
//}
//
//// 6초 후 이벤트 발생 (타임아웃 발생 후라 무시됨)
//DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//    subject.send(())
//}
//let subject = PassthroughSubject<String, Never>()
//
//let measureSubject = subject.measureInterval(using: DispatchQueue.main)
//
//let startTime = Date()
//
//let sub1 = subject.sink {
//    let deltaTime = Date().timeIntervalSince(startTime)
//    print("+\(String(format: "%.2f", deltaTime))s: Subject emitted: \($0)")
//}
//
//let sub2 = measureSubject.sink {
//    let deltaTime = Date().timeIntervalSince(startTime)
//    print("+\(String(format: "%.2f", deltaTime))s: Measure emitted: \(Double($0.magnitude) / 1_000_000_000.0) sec")
//}
//
//// 값 방출 테스트
//DispatchQueue.main.asyncAfter(deadline: .now() + 1) { subject.send("A") }
//DispatchQueue.main.asyncAfter(deadline: .now() + 3) { subject.send("B") }
//DispatchQueue.main.asyncAfter(deadline: .now() + 6) { subject.send("C") }
//["J", "O", "H", "N"]
//    .first(where: { "Hello World".contains($0) })

//
//let publisher = ["A", "B", "C", "D"].publisher
//
//publisher
//  .print("publisher")
//  .output(at: 2)
//  .sink(receiveValue: { print("Value at index 2 is \($0)") })
//  .store(in: &subscriptions)

//["A", "B", "C", "D", "E"].publisher
//    .output(in: 1...3) // 1, 2, 3 각각 방출함
//    .sink(receiveValue: { print("\($0)") })
//    .store(in: &subscriptions)

//var subscriptions: Set<AnyCancellable> = []
//
//let publisher = ["A", "B", "C"].publisher
//publisher
//    .print("publisher")
//    .count()
//    .sink(receiveValue: { print("I have \($0) items") }) // 3
//    .store(in: &subscriptions)



//let publisher = ["A", "B", "C", "D", "E"].publisher
//let letter = "C"
//
//publisher
//    .print("publisher")
//    .contains(letter)
//    .sink(receiveValue: { contains in
//        print(contains ? "Publisher emitted \(letter)!" : "Publisher never emitted \(letter)!")
//    })
//    .store(in: &subscriptions)

//struct Person {
//    let id: Int
//    let name: String
//}
//
//var subscriptions: Set<AnyCancellable> = []
//
//let people = [
//    (456, "Scott Gardner"),
//    (123, "Shai Mishali"),
//    (777, "Marin Todorv"),
//    (214, "Florent Pillet")
//]
//.map(Person.init)
//.publisher
//
//people
//    .contains(where: { $0.id == 800 || $0.name == "Marin Todorv"}) // 이런식으로 조건문 작성
//    .sink(receiveValue: { contains in
//        print(contains ? "Criteria matches!" : "Couldn't find a match for the criteria")
//    })
//    .store(in: &subscriptions)

//let publisher = stride(from: 0, to: 5, by: 2).publisher
//
//publisher
//    .print("publisher")
//    .allSatisfy { $0 % 2 == 0 }
//    .sink(receiveValue: { allEven in
//        print(allEven ? "All numbers are even" : "Something is odd...")
//    })
//    .store(in: &subscriptions)

//var subscriptions: Set<AnyCancellable> = []

//let publisher = ["Hel", "lo", "Wor", "ld", "!"].publisher
//
//publisher
//    .print("publisher")
//    .reduce("") { index, value in
//        index + value
//    } // .reduce("", +) 이렇게도 표현 가능
//    .sink(receiveValue: { print("Reduced into: \($0)") })
//    .store(in: &subscriptions)


//let runLoop = RunLoop.main
//
//runLoop.schedule(
//    after: runLoop.now,
//    interval: .seconds(1),
//    tolerance: .milliseconds(100)
//) {
//    print("Timer fired")
//}.store(in: &subscriptions)
//
//var subscriptions: Set<AnyCancellable> = []
//
//let subscription = Timer
//    .publish(every: 1.0, on: .main, in: .common)
//    .autoconnect()
//    .scan(0) { counter, _ in counter + 1 }
//    .sink { counter in
//        print("Counter is \(counter)")
//    }

//
//let queue = DispatchQueue.main
//let source = PassthroughSubject<Int, Never>()
//
//var counter = 0
//
//// 일정 간격으로 값을 방출하는 타이머
//let cancellable = queue.schedule(
//    after: queue.now,
//    interval: .seconds(1)
//) {
//    source.send(counter)   // 값 방출
//    counter += 1           // counter 증가
//}
//
//let subscription = source.sink {
//    print("Timer emitted \($0)")   // 방출된 값 출력
//}
//
//RunLoop.main.run()
//var subscriptions: Set<AnyCancellable> = []
//let queue = OperationQueue()
//
//// Combine을 사용하여 OperationQueue의 operationCount를 관찰
//let subscription = queue.publisher(for: \.operationCount)
//    .sink { operationCount in
//        print("Outstanding operations in queue: \(operationCount)")
//    }
//
//queue.addOperation {
//    // 첫 번째 작업
//    sleep(2) // 2초 동안 대기
//    print("First operation completed.")
//}
//
//queue.addOperation {
//    // 두 번째 작업
//    sleep(1)
//    print("Second operation completed.")
//}
//
//queue.addOperation {
//    // 세 번째 작업
//    sleep(3)
//    print("Third operation completed.")
//}
class MonitorObject: ObservableObject {
    @Published var someProperty = false
    @Published var someOtherProperty = ""
}

let object = MonitorObject()
let subscription = object.objectWillChange.sink {
    print("object will change")
}

object.someProperty = true
object.someOtherProperty = "Hello world"
