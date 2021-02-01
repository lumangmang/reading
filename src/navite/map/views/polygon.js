/**
 * reading.
 * Create by Devin on 2021/2/1.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */

import { ColorPropType, requireNativeComponent, ViewPropTypes } from 'react-native'
import PropTypes from 'prop-types'
import { LatLngPropType } from '../prop-types'

export default requireNativeComponent('MapPolygon', {
    propTypes: {
        ...ViewPropTypes,
        points: PropTypes.arrayOf(LatLngPropType).isRequired,
        strokeWidth: PropTypes.number,
        strokeColor: ColorPropType,
        fillColor: ColorPropType,
    }
})
