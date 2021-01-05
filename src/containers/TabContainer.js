/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, {PureComponent} from "react";
import {NavigationContainer} from "@react-navigation/native";
import {BottomTabBar, createBottomTabNavigator} from "@react-navigation/bottom-tabs";
import AntDesign from 'react-native-vector-icons/AntDesign';
import Feather from "react-native-vector-icons/Feather";

import HomePage from "../page/homepage/HomePage";
import MinePage from "../page/Mine/MinePage";

const Tab = createBottomTabNavigator();

const TABS = {
    HomePage: {
        screen: HomePage,
        navigationOptions: {
            tabBarLabel: "Reading",
            tabBarIcon: ({color, _}) => {
                return <AntDesign
                    name={'book'}
                    size={24}
                    style={{color: color}}
                />
            }
        },
    },

    MinePage: {
        screen: MinePage,
        navigationOptions: {
            tabBarLabel: "Mine",
            tabBarIcon: ({color, _}) => {
                return <Feather
                    name={"user"}
                    size={24}
                    style={{color: color}}
                />;
            },
        },
    },
};

class TabBarNavigators extends PureComponent {
    renderTabNavigator() {
        if (this.Tabs) return this.Tabs;
        const {HomePage, MinePage} = TABS;
        const tabs = {HomePage, MinePage};
        return this.Tabs = <NavigationContainer
            independent={true}
        >
            <Tab.Navigator
                tabBar={props => {
                    return <TabBarComponent {...props} />;
                }}
            >
                {
                    Object.entries(tabs).map(item => {
                        return <Tab.Screen
                            key={item[0]}
                            name={item[0]}
                            component={item[1].screen}
                            options={item[1].navigationOptions}
                        />;
                    })
                }
            </Tab.Navigator>
        </NavigationContainer>;
    }

    render() {
        return this.renderTabNavigator();
    }
}

class TabBarComponent extends PureComponent {
    render() {
        return <BottomTabBar
            {...this.props}
            activeTintColor={"red"}
        />;
    }
}
export default TabBarNavigators;
