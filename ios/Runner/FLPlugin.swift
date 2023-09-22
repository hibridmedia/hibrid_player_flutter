//
//  FLPlugin.swift
//  Runner
//
//  Created by WAH on 9/22/23.
//
import Flutter
import UIKit

class FLPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
        registrar.register(factory, withId: "HybridPlayer")
    }
}
