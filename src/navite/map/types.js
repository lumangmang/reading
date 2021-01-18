/**
 * reading.
 * Create by Devin on 2021/1/18.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

export type Location = {
    accuracy: number
    latitude: number
    longitude: number
    direction: number
}

export type Position = {
    timestamp: number;
    location: Location;
}
