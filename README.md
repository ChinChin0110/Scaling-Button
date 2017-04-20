## Synopsis

A simple and easy use scaling button.

## Code Example

```Swift
class ViewController: UIViewController {

    let scalingButton = ScalingButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scalingButton)
        scalingButton.addTarget(self, action: #selector(handleTouchDown), for: .primaryActionTriggered)      
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bounds = UIScreen.main.bounds
        scalingButton.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        scalingButton.center = CGPoint(x: bounds.width / 2 ,y: bounds.height / 2)
    }

    func handleTouchDown(scalingButton: ScalingButton) {
        print("button did trigger")
    }
    
}
```

## Motivation

I need a scaling button ,which can scale large by how long you press and scale small when you unpress.
I creat it and share to anyone who needs it.

## Installation

Just downlond the project and copy <b>ScalingButton.swift</b> & <b>BasicLayer.swift</b> to your project.

## API Reference

comming soon.

## License

MIT
