/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import MainContainer from "./MainContainer";
import Splash from '../page/splash/Splash'

export default [
    {
        name: "Splash", component: Splash,
        options: {headerShown: false},
    },
    {
        name: "Main", component: MainContainer,
        options: {headerShown: false, animationEnabled: false},
    },
];
