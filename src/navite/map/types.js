/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

export type Location = {
    accuracy: number,
    latitude: number,
    longitude: number,
    altitude?: number,
    speed?: number,
    heading?: number,
    errorCode?: number,
    errorMessage?: string,
    locationDetail?: string,
    coordinateType?: "WGS84" | "GCJ02";
    direction: number,
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
    poiName?: string;
}

export type Coordinates = {
    latitude: number;
    longitude: number;
    altitude: number;
    accuracy: number;
    altitudeAccuracy: number;
    heading: number;
    speed: number;
}

export type Position = {
    coords: Coordinates;
    location: Location;
}

// 事件类型
export const EventTypes = {
    // 单次定位
    currentLocation: 'CURRENTLOCATIONEVENT',
    onLocationUpdate: 'ONLOCATIONUPDATE',
}
