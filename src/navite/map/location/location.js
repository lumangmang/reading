/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { EmitterSubscription } from 'react-native'
import { EventTypes } from "../types"
import MapLocation from './map-location'
import type { Location, ReGeocode } from "../types"

let watchId = 0
const watchMap: { [watchId: number]: EmitterSubscription } = {}

class LocationError {
    code: number
    message: string
    location: Location

    constructor(code: number, message: string, location: Location) {
        this.code = code
        this.message = message
        this.location = location
    }
}

export default class Geolocation {

    /**
     * 单次定位
     * @param success 定位成功回调位置
     * @param error 定位失败回调错误信息
     */
    static fetchCurrentLocation(
        success: (position: (Location & ReGeocode)) => void,
        error?: (error: LocationError) => void,
    ) {
        MapLocation.currentLocation()
        const listener = MapLocation.addLocationListener(EventTypes.currentLocation,
            (location) => {
                if (location.errorCode) {
                    error && error(new LocationError(location.errorCode, location.errorMessage, location))
                    return listener.remove()
                }
                success(location)
                return listener.remove()
            })
    }

    /**
     * 添加连续定位监听器
     * @param success
     * @param error
     * @returns {number}
     */
    static watchPosition(
        success: (position: (Location & ReGeocode)) => void,
        error?: (error: LocationError) => void,
    ) {
        watchMap[++watchId] = MapLocation.addLocationListener(EventTypes.onLocationUpdate,
            (location) => {
                if (location.errorCode) {
                    error && error(new LocationError(location.errorCode, location.errorMessage, location));
                } else {
                    success(location)
                }
            })
        return watchId
    }

    /**
     * 移除连续定位监听,并不会停止定位
     * 停止定位调用stop
     * @param id listener id
     */
    static clearWatch(id: number) {
        const listener = watchMap[id]
        if (listener) {
            listener.remove()
        }
    }

    /**
     * 停止定位
     */
    static stop() {
        MapLocation.stop()
    }

    /**
     * 开始连续定位
     */
    static start() {
        MapLocation.start()
    }
}



