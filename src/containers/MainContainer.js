/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from "react";
import SafeAreaViewPlus from "../components/SafeAreaViewPlus";
import TabBarNavigators from "./TabContainer";
import Navigator from "../utils/Navigator";

export default (props) => (
    Navigator.navigation = props.navigation,
     <SafeAreaViewPlus>
        <TabBarNavigators />
    </SafeAreaViewPlus>
)
