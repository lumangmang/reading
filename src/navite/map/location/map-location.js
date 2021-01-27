/**
 * reading.
 * Create by Devin on 2021/1/26.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { NativeModules, NativeEventEmitter, Platform } from "react-native"
import { Location, ReGeocode, AppKey } from "../types"

const {LocationManager} = NativeModules;
const eventEmitter = new NativeEventEmitter(LocationManager);

/**
 * 初始化SDK
 *
 * @param key 开放平台应用key
 * @returns {*}
 */
const init = (key: AppKey): Promise<void> => LocationManager.init(Platform.select(key))

/**
 * 添加定位监听函数
 *
 * @param type 监听的key
 * @param listener
 * @returns {EmitterSubscription}
 */
const addLocationListener = (type: string, listener: (location: Location & ReGeocode) => void) =>
    eventEmitter.addListener(type, listener)

/**
 * 开始连续定位
 */
const start = () => LocationManager.start()

/**
 * 停止连续定位
 */
const stop = () => LocationManager.stop()

/**
 * 设定定位的最小更新距离（米）
 *
 * 默认为 `kCLDistanceFilterNone`,只要检测到设备位置发生变化就会更新位置信息
 * @param distance
 */
const setDistanceFilter = (distance: number) => {
    if (Platform.OS === 'ios') {
        LocationManager.setDistanceFilter(distance)
    }
}

/**
 * 设定期望的定位精度（米）
 * 默认为 `kCLLocationAccuracyBest`
 * 设置为 `kCLLocationAccuracyBest` 或 `kCLLocationAccuracyBestForNavigation` 时
 * 单次定位会在达到 `locationTimeout` 设定的时间后，将时间内获取到的最高精度的定位结果返回
 * @param desiredAccuracy
 */
const setDesiredAccuracy = (desiredAccuracy: number) => {
    if (Platform.OS === 'ios') {
        LocationManager.setDesiredAccuracy(desiredAccuracy)
    }
}

/**
 * 指定定位是否会被系统自动暂停
 * default false
 * @param isPause
 */
const setPausesLocationUpdatesAutomatically = (isPause: boolean) => {
    if (Platform.OS === 'ios') {
        LocationManager.setPausesLocationUpdatesAutomatically(isPause)
    }
}

/**
 * 是否允许后台定位
 * 只在iOS 9.0 及之后起作用。
 * 设置为YES的时候必须保证 `Background Modes` 中的 `Location updates` 处于选中状态，否则会抛出异常
 * 由于iOS系统限制，需要在定位未开始之前或定位停止之后，修改该属性的值才会有效果
 * @param isAllow
 */
const setAllowsBackgroundLocationUpdates = (isAllow: boolean) => {
    if (Platform.OS === "ios") {
        LocationManager.setAllowsBackgroundLocationUpdates(isAllow);
    }
}

/**
 * 指定单次定位超时时间（秒）
 * 最小值是 2s,在单次定位请求前设置
 * @param timeout
 */
const setLocationTimeout = (timeout: number) => {
    if (Platform.OS === "ios") {
        LocationManager.setLocationTimeout(timeout);
    }
}

/**
 * 指定单次定位逆地理超时时间（秒）
 * 最小值是 2s,在单次定位请求前设置
 * @param timeout
 */
const setReGeocodeTimeout = (timeout: number) => {
    if (Platform.OS === "ios") {
        LocationManager.setReGeocodeTimeout(timeout);
    }
}

/**
 * 连续定位是否返回逆地理编码
 * default false
 * @param isReGeocode
 */
const setLocatingWithReGeocode = (isReGeocode: boolean) => {
    if (Platform.OS === "ios") {
        LocationManager.setLocatingWithReGeocode(isReGeocode);
    }
}


export default {
    init,
    start,
    stop,
    addLocationListener,
    setDistanceFilter,
    setLocatingWithReGeocode,
    setReGeocodeTimeout,
    setLocationTimeout,
    setAllowsBackgroundLocationUpdates,
    setPausesLocationUpdatesAutomatically,
    setDesiredAccuracy
}
