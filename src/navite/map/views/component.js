/**
 * reading.
 * Create by Devin on 2021/1/28.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { PureComponent } from 'react'
import { findNodeHandle, UIManager } from 'react-native'

export default class Component<T> extends PureComponent<T> {

    /**
     * 原生组件名称
     * 如果需要调用原生组件的方法，必须实现此属性
     * @type {string}
     */
    nativeComponentName: string

    /**
     * 调用原生方法
     * @param command 原生方法名
     * @param params 给原生传递的参数
     */
    call(command: string, params?: any[]) {
        UIManager.dispatchViewManagerCommand(
            findNodeHandle(this),
            UIManager[this.nativeComponentName].Commands[command],
            params,
        )
    }

    /**
     * 替换原生事件名
     * @param events
     * @returns {{}}
     */
    handlers(events: string[]) {
        return events.reduce((handlers, name) => {
            const handler = this.props[name]
            if (handler) {
                handlers[name.replace(/^on/, 'onBaiduMap')] =
                    event => handler(event.nativeEvent)
            }
            return handlers
        }, {})
    }
}
