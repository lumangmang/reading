/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from "react";
import { NavigationContainer } from "@react-navigation/native";
import { createStackNavigator } from "@react-navigation/stack";
import routers from "./Router";

// import { Location } from '../navite/map'

const Stack = createStackNavigator();

// Location.init("NNzd3TcBpigM4V9zmCUGWuq9yPWEQBKm")
//
//
//
// Location.fetchCurrentLocation('bd09ll').then(value => {
//     console.log('-------------', value)
// }).catch(error => {
//     console.log('+++++++++++++', error)
// })

export default function App() {
    return (
        <NavigationContainer>
            <Stack.Navigator>
                {routers.map((item, index) => (
                    <Stack.Screen
                        key={index}
                        name={item.name}
                        component={item.component}
                        options={item.options}
                    />
                ))}
            </Stack.Navigator>
        </NavigationContainer>
    );
}
