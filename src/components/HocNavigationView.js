/**
 * reading.
 * Create by Devin on 2021/1/6.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React, {PureComponent} from "react";
import SafeAreaViewPlus from "./SafeAreaViewPlus";

/**
 * 高阶组件
 * @options 接受外部传递的参数
 */
const HocNavigationView = (options) => (WrapComponent) => {
    return class extends PureComponent {
        render() {
            return (
                <SafeAreaViewPlus style={{flex: 1}}
                                  topColor={options.backgroundColor || 'white'}
                >
                    <WrapComponent {...this.props}/>
                </SafeAreaViewPlus>
            )
        }
    }
}

export default HocNavigationView;
