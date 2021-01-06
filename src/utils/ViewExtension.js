/**
 * reading.
 * Create by Devin on 2021/1/6.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from "react";
import { TouchableOpacity, StyleSheet, View, Text } from "react-native";
import Ionicons from "react-native-vector-icons/Ionicons";

export default class ViewHelper {

    static leftBarButtonItem(callBack) {
        return <TouchableOpacity style={{ padding: 8, paddingLeft: 12 }}
                                 onPress={callBack}>
            <Ionicons
                name={"ios-arrow-back"}
                size={28}
                style={{ color: "black" }} />
        </TouchableOpacity>;
    }

    static rightBarButtonItem(title, Icon, callBack) {
        return <TouchableOpacity style={{ padding: 8 }}
                                 onPress={callBack}
        >
            {Icon}
        </TouchableOpacity>;
    }

    static shareButton(callBack) {
        return <TouchableOpacity
            underlayColor={"transparent"}
            onPress={callBack}
        >
            <Ionicons
                name={"md-share"}
                size={20}
                style={{ opacity: 0.9, marginRight: 10, color: "white" }} />
        </TouchableOpacity>;
    }

    static getItem(callBack, item, color, expandableIco) {
        return ViewExtension.getSettingItem(callBack, item.name, color, item.Icons, item.icon, expandableIco);
    }

    static getSettingItem(callBack, text, color, Icons, icon, expandableIco) {
        return (
            <TouchableOpacity
                onPress={callBack}
                style={styles.setting_item_container}
            >
                <View style={{ alignItems: "center", flexDirection: "row" }}>
                    {Icons && icon ?
                        <Icons name={icon}
                               size={20}
                               style={{ color: color, marginRight: 10 }}
                        /> : <View style={{ opacity: 1, width: 20, height: 20, marginRight: 10 }} />
                    }
                    <Text style={{ fontSize: 16 }}>{text}</Text>
                </View>
                <Ionicons
                    name={expandableIco ? expandableIco : "ios-arrow-forward"}
                    size={20}
                    style={{
                        alignSelf: "center",
                        color: color || "black",
                    }}
                />
            </TouchableOpacity>
        );
    }
}

const styles = StyleSheet.create({
    setting_item_container: {
        backgroundColor: "white",
        padding: 10, height: 60,
        alignItems: "center",
        justifyContent: "space-between",
        flexDirection: "row",
    },
});
