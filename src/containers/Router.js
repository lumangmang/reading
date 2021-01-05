/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import MainContainer from "./MainContainer";
import Splash from '../page/splash/Splash';
import Category from "../page/category/Category";
import ReadingDetail from "../page/readpage/ReadingDetail";

export default [
    {
        name: "Splash", component: Splash,
        options: {headerShown: false},
    },
    {
        name: "Main", component: MainContainer,
        options: {headerShown: false, animationEnabled: false},
    },
    {
        name: "Category", component: Category,
        options: {headerShown: false},
    },

    {
        name: "ReadingDetail", component: ReadingDetail,
        options: {headerShown: true},
    },
];
