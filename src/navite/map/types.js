/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

export type AppKey = {
    ios: string,
    android: string,
}

export type Location = {
    latitude: number,
    longitude: number,
    errorCode?: number,
    errorMessage?: string,
}

export type ReGeocode = {
    address?: string;
    country?: string;
    province?: string;
    city?: string;
    cityCode?: string;
    district?: string;
    street?: string;
    streetNumber?: string;
    adCode?: string,
}


// 事件类型
export const EventTypes = {
    // 单次定位
    currentLocation: 'ON_CURRENT_LOCATION',
    onLocationUpdate: 'ON_LOCATION_UPDATE',
}
