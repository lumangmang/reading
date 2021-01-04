/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, { PureComponent } from "react";

import SafeAreaViewPlus from "../components/SafeAreaViewPlus";
import TabBarNavigators from "./TabContainer";

export default function root (props) {
    return (
        <SafeAreaViewPlus>
            <TabBarNavigators />
        </SafeAreaViewPlus>
    );
}
