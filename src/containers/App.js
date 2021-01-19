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

const Stack = createStackNavigator();

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
