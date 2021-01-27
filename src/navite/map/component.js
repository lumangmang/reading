/**
 * reading.
 * Create by Devin on 2021/1/25.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { PureComponent } from 'react'
import { findNodeHandle, UIManager } from 'react-native'

export default class Component extends PureComponent {
    nativeComponentName: string

    call(command: string, params?: any[]) {
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager[this.nativeComponentName].Commands[command],
            params,
        )
    }

    handlers(events: string[]) {
        return events.reduce((handlers, name) => {
            const handler = this.props[name]
            if (handler) {
                handlers[name.replace(/^on/, 'onBaiduMap')] = event =>
                    handler(event.nativeEvent)
            }
            return handlers
        }, {})
    }
}
