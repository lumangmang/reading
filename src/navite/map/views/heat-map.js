/**
 * reading.
 * Create by Devin on 2021/2/1.
 *
 * Copyright (c) 2021-present, Devin.
 * All rights reserved.
 *
 */


import { requireNativeComponent, ViewPropTypes } from 'react-native'
import PropTypes from 'prop-types'

const Point = PropTypes.shape({
    latitude: PropTypes.number.isRequired,
    longitude: PropTypes.number.isRequired,
    intensity: PropTypes.number,
})

export default requireNativeComponent('MapHeatMap', {
    propTypes: {
        ...ViewPropTypes,
        points: PropTypes.arrayOf(Point).isRequired,
        radius: PropTypes.number,
        opacity: PropTypes.number,
    },
})
