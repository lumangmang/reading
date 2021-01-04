/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { combineReducers } from "redux";
import read from "./read";

const RootReducer = combineReducers({
    read,
});

export default RootReducer;
