import Foundation
import Capacitor


let shortBufLen: Int = 256

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(GoGetterPlugin)
public class GoGetterPlugin: CAPPlugin {
    private let implementation = GoGetter()

    @objc func echo(_ call: CAPPluginCall) {
        let buffer = UnsafeMutablePointer<Int8>.allocate(capacity: shortBufLen)
        buffer.initialize(to: 0)
        print("ff GoodMorning")
        GoodMorning(buffer, Int32(shortBufLen))
        let p = String(cString: buffer)
        let value = call.getString("value") ?? ""
        print("ff GoodMorning: \(p)")
        call.resolve(["value": "\(value) -- \(p)"])
    }
}
