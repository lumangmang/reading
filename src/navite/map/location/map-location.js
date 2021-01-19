/**
 * reading.
 * Create by Devin on 2021/1/19.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { NativeModules, NativeEventEmitter } from 'react-native';
import { Location, ReGeocode } from "../types";

const {LocationManager} = NativeModules
const eventEmitter = new NativeEventEmitter(LocationManager);

/**
 * 连续定位
 */
export default {
    init: (key) => LocationManager.init(key),
    currentLocation: () => LocationManager.currentLocation(),
    start: () => LocationManager.start(),
    stop: () => LocationManager.stop(),
    addLocationListener: (type, listener: (location: Location & ReGeocode) => void) =>
        eventEmitter.addListener(type, listener)
}
