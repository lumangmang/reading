/**
 * reading.
 * Create by Devin on 2021/1/5.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { StackActions } from "@react-navigation/native";

export default class Navigator {

    static goPage(params, page) {
        const navigation = Navigator.navigation;
        if (!navigation) {
            console.log("navigation empty");
            return;
        }

        navigation.navigate(
            page,
            {
                ...params,
            },
        );
    }

    static goBack(navigation) {
        navigation.goBack();
    }

    static restRoot(params) {
        const { navigation } = params;
        navigation.dispatch(
            StackActions.replace("Main", {}),
        );
    }

    static restPage(params, page) {
        const { navigation } = params;
        navigation.dispatch(
            StackActions.replace(page, {}),
        );
    }
}
