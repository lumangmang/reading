/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from "react";
import { Provider } from "react-redux";
import configureStore from "./store/configureStore";
import App from "./containers/App";

const store = configureStore();

const Root = () => (
    <Provider store={store}>
        <App />
    </Provider>
);

export default Root;
