/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import thunk from "redux-thunk";
import { createStore, applyMiddleware } from "redux";
import RootReducer from "../reducers";

const middlewares = [
    thunk,
];

const configureStore = () => {
    const store = createStore(
        RootReducer,
        applyMiddleware(...middlewares),
    );
    return store;
};

export default configureStore;
