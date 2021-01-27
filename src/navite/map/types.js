/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

/**
 * 开放平台应用key
 */
export interface AppKey {
    ios: string;
    android: string;
}

/**
 * 定位信息
 */
export interface Location {
    // 定位精度
    accuracy: number;
    // 经纬度
    latitude: number;
    longitude: number;
    // 海拔
    altitude?: number;
    // 移动速度
    speed?: number;
    // 移动方向
    heading?: number;
    // 定位时间(毫秒)
    timestamp?: number;
    // 错误码
    errorCode?: number;
    // 错误信息
    errorMessage?: string;
}

/**
 * 逆地理编码信息
 */
export interface ReGeocode {
    // 详细地址
    address?: string;
    // 国家
    country?: string;
    // 省份
    province?: string;
    // 城市
    city?: string;
    // 城市编码
    cityCode?: string;
    // 地区
    district?: string;
    // 街道
    street?: string;
    // 门牌号
    streetNumber?: string;
}

// 事件类型
export const EventTypes = {
    // 单次定位
    currentLocation: 'ON_CURRENT_LOCATION',
    onLocationUpdate: 'ON_LOCATION_UPDATE',
}
