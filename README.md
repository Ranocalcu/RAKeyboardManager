# RAKeyboardManager
使用方法

1、在application:didFinishLaunchingWithOptions:里添加
    [[RAKeyboardManager shareManager] startObserver];

2、对唤起键盘有可能遮盖的textField或textView处理
    [[RAKeyboardManager shareManager] addObserveredView:textField];
