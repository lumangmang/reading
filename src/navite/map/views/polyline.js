/**
 * reading.
 * Create by Devin on 2021/1/28.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { ColorPropType, requireNativeComponent, ViewPropTypes } from 'react-native'
import PropTypes from 'prop-types'
import { LatLngPropType } from '../prop-types'

export default requireNativeComponent('MapPolyline', {
    propTypes: {
        ...ViewPropTypes,
        points: PropTypes.arrayOf(LatLngPropType).isRequired,
        width: PropTypes.number,
        color: ColorPropType,
        colors: PropTypes.arrayOf(ColorPropType),
    },
})
