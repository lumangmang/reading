/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { EmitterSubscription } from 'react-native'
import { Location, Position, EventTypes } from "../types";
import { LocationError } from "./location-error";
import MapLocation from './map-location'

let watchId = 0;
const watchMap: { [watchId: number]: EmitterSubscription } = {};

export default class Geolocation {
    /**
     * 初始化定位SDK,必须最先调用
     * @param key api key
     * @returns {Promise<void>|*}
     */
    static init(key: string): Promise<void> {
        return MapLocation.init(key)
    }

    /**
     * 单次定位
     * @param success 定位成功回调位置
     * @param error 定位失败回调错误信息
     */
    static fetchCurrentLocation(
        success: (position: Position) => void,
        error?: (error: LocationError) => void,
    ) {
        MapLocation.currentLocation()
        const listener = MapLocation.addLocationListener(EventTypes.currentLocation,
            (location) => {
                if (location.errorCode) {
                    error && error(new LocationError(location.errorCode, location.errorMessage, location))
                    return listener.remove()
                }
                success(formatLocation(location))
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
        success: (position: Position) => void,
        error?: (error: LocationError) => void,
    ) {
        watchMap[++watchId] = MapLocation.addLocationListener(EventTypes.onLocationUpdate,
            (location) => {
                if (location.errorCode) {
                    error && error(new LocationError(location.errorCode, location.errorMessage, location));
                } else {
                    success(formatLocation(location))
                }
            })
        MapLocation.start()
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
}

/**
 * 格式化位置信息
 * @param location
 */
function formatLocation(location: Location) {
    return {
        location,
        coords: {
            latitude: location.latitude,
            longitude: location.longitude,
            altitude: location.altitude,
            accuracy: location.accuracy,
            heading: location.heading,
            speed: location.speed,
        },
    }
}
