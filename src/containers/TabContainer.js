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
import Ionicons from "react-native-vector-icons/Ionicons";
import ReadingPage from "../page/readpage/ReadingStack";
import MinePage from "../page/mine/MinePage";
import CategoryPage from "../page/category/CategoryPage";

const Tab = createBottomTabNavigator();

const TABS = {
    ReadingPage: {
        screen: ReadingPage,
        navigationOptions: {
            tabBarLabel: "Reading",
            tabBarIcon: ({color}) => {
                return <AntDesign
                    name={'book'}
                    size={24}
                    style={{color: color}}
                />
            }
        },
    },

    CategoryPage: {
        screen: CategoryPage,
        navigationOptions: {
            tabBarLabel: "Cate",
            tabBarIcon: ({color}) => {
                return <Ionicons
                    name={'md-pricetags'}
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
            tabBarIcon: ({color}) => {
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
        const {ReadingPage, CategoryPage, MinePage} = TABS;
        const tabs = {ReadingPage, CategoryPage, MinePage};
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

const TabBarComponent = (props) => {
    return (
        <BottomTabBar
            {...props}
            activeTintColor={'#017dcc'}
        />
    )
}

export default TabBarNavigators;
