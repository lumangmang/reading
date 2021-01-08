/**
 * reading.
 * Create by Devin on 2021/1/8.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { NativeModules, Platform } from 'react-native'

const {BaiduMapInitializer} = NativeModules

export default {
    init(key: string) {
        return new Promise((resolve, reject) => {
            if (Platform.OS === 'android') {
                return BaiduMapInitializer.init()
            }
            return BaiduMapInitializer.init(key).then(value => {
                resolve(value)
            }).catch(error => {
                reject(error)
            })
        })
    }
}
