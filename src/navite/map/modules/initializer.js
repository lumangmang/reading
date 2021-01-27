/**
 * reading.
 * Create by Devin on 2021/1/25.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */


import { NativeModules } from 'react-native'

const {MapInitializer} = NativeModules

export default {
    init(key: string) {
        return MapInitializer.init(key).then(value => {
            console.log(value)
        }).catch(error => {
            console.log(error.message)
        })
    }
}
