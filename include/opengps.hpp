/*
 * opengps.hpp
 *
 *  Created on: Nov 21, 2018
 *      Author: chorm
 */

#ifndef OPENGPS_HPP
#define OPENGPS_HPP

#include <lclib/Config.hpp>
#include <cstdint>
#include <lclib/Vector.hpp>

struct GPSCoord{
	uint8_t degrees;
	uint8_t minutes;
	double seconds;
};

Vec2<std::uint64_t> fromGPSCoords(Vec2<GPSCoord>);
Vec2<GPSCoord> toGPSCoords(Vec2<std::int64_t>);




#endif /* OPENGPS_HPP */
