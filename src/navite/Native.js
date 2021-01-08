/**
 * reading.
 * Create by Devin on 2021/1/6.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */
// import PropTypes from "prop-types";
// import React, {PureComponent} from "react";
// import {requireNativeComponent, View, findNodeHandle, UIManager} from "react-native";

// requireNativeComponent:第一个参数是要导入的原生组件的文件名,要与项目中继承自RCTViewManager的类的名字一致,
// 第二个参数可以为 null, 也可以为要封装的原生组件,这样可rn 可以在底层检查原生属性和包装类的属性类型是否一致.
// 注意:这里并没有直接使用导出的组件,而是将导出的组件重新封装成一个新组件,
// 这样做逻辑比较清晰,而且可以在项目中复用,可以添加额外的组件.
// const NativeView = requireNativeComponent("NativeView");
// export default class Native extends PureComponent {
//     static propTypes = {
//         ...View.PropTypes,
//         title: PropTypes.string,
//         onClick: PropTypes.func,
//     };
//
//     nativeFunc = (obj) => {
//         UIManager.dispatchViewManagerCommand(
//             findNodeHandle(this),
//             UIManager.getViewManagerConfig("NativeView").Commands.nativeFunc,
//             [
//                 obj,
//             ],
//         );
//     };
//
//     render() {
//         return <NativeView {...this.props} />;
//     }
// }
