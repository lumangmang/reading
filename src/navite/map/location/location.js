/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { NativeModules, NativeEventEmitter, Platform } from 'react-native'

import { Location } from "../types";

const {LocationManager} = NativeModules
const eventEmitter = new NativeEventEmitter(LocationManager)

type Listener = (listener: {
    timestamp: number,
    altitude: number,
    speed: number,
} & Location) => {}

export default {
    init(key: string): Promise<void> {
        if (LocationManager.init) {
            return LocationManager.init(key)
        }
        return Promise.resolve()
    },

    addLocationListener: (listener: Listener) => eventEmitter.addListener('currentLocation', listener)
}


