/**
 * reading.
 * Create by Devin on 2021/1/19.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { Location } from "../types";

export class LocationError {
    code: number;
    message: string;
    location: Location;

    constructor(code: number, message: string, location: Location) {
        this.code = code;
        this.message = message;
        this.location = location;
    }
}
