//: A UIKit based Playground for presenting user interface
  
import UIKit
import RxRelay
import RxSwift
import RxCocoa
import RxSwiftExt

import PlaygroundSupport

class UPError: Error {
    var localizedDescription: String {
        return "Unespected error"
    }
}

class ViewModel {
    fileprivate let dispose = DisposeBag()
    
    var count = 0
    
    // input
    let resultText = BehaviorRelay<String>(value: "Waiting for result")
    
    // events
    let submit = PublishRelay<Void>()
    
    // output
    var showMessage: Observable<String>!
    var response: Observable<String>!
    var btnTapped: Observable<Bool>!
    
    // events
    var resultEvent: Observable<Event<String>>!
    
    let disponse = DisposeBag()
    
    init() {
        resultEvent = submit.flatMap { value -> Observable<Event<String>> in
            return self.perform().materialize()
        }
        
        resultEvent.elements()
        .map({ $0 }).bind(to: resultText).disposed(by: disponse)
        
        showMessage = resultEvent.errors()
        .map({ $0.localizedDescription })
        
    }
    
    func perform() -> Observable<String> {
        return Observable.create { [weak self] observer -> Disposable in
            guard let self = self else {
                return Disposables.create()
            }
            self.count += 1
            let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Deu Ruim"])
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
                observer.onNext("Count: \(self.count)")
            }
            
            observer.onCompleted()
            return Disposables.create()
        }
    }
}

class ViewController : UIViewController {
    let viewModel = ViewModel()
    let dispose = DisposeBag()
    
    var button: UIButton!
    var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        activateConstraints()
        setupRx()
    }
    
    func setupViews() {
        button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        resultLabel = UILabel()
        resultLabel.textAlignment = .center
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(resultLabel)
    }
    
    func setupRx() {
        button.rx.tap.bind(to: viewModel.submit).disposed(by: dispose)
        viewModel.resultText.bind(to: resultLabel.rx.text).disposed(by: dispose)
        
    }
    
    func activateConstraints() {
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            resultLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            resultLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }
}

// Config the view controller
let vc = ViewController()
vc.view.frame = Screen.iPhone8
vc.view.backgroundColor = .white

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc
