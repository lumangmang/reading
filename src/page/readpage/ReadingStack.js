/**
 * reading.
 * Create by Devin on 2021/1/4.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import React from "react";
import {View} from "react-native";
import {connect} from 'react-redux';
import {bindActionCreators} from 'redux';

import NavigationBar from "../../components/NavigationBar";
import * as readCreators from '../../actions/read';
import ReadingList from "./ReadingList";

const navigationBar = <NavigationBar
    title={"Reading"}
    style={{backgroundColor: 'white'}}
/>

const ReadingStack = props => (
    <View style={{flex: 1}}>
        {navigationBar}
        <ReadingList {...props} />
    </View>
)

// class ReadingStack extends PureComponent {
//
//     render() {
//         let navigationBar =
//             <NavigationBar
//                 title={"Reading"}
//                 style={{backgroundColor: 'white'}}
//             />;
//         return (
//             <View style={{flex: 1}}>
//                 {navigationBar}
//                 <ReadingList {...this.props} />
//             </View>
//         )
//     }
// }

// ES6
// 如果返回一个对象，需要特别注意，如果是单表达式要返回自定义对象，
// 不写括号会报错，因为和函数体的{ ... }有语法冲突。
// 注意，用小括号包含大括号则是对象的定义，而非函数主体
const mapStateToProps = state => ({
    read: state.read
});

const mapDispatchToProps = dispatch => {
    const readActions = bindActionCreators(readCreators, dispatch);
    return {
        readActions,
    }
};
export default connect(mapStateToProps, mapDispatchToProps)(ReadingStack);
