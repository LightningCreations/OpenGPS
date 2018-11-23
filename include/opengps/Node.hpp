/*
 * Node.hpp
 *
 *  Created on: Nov 22, 2018
 *      Author: chorm
 */

#ifndef __INCLUDE_NODE_HPP__2018_11_22_00_08_03
#define __INCLUDE_NODE_HPP__2018_11_22_00_08_03

#include <lclib/Vector.hpp>
#include <lclib/UUID.hpp>
#include <lclib/IOWrapper.hpp>
#include <cstdint>
#include <list>
#include <optional>
#include <unordered_map>
#include <string>
#include <string_view>
#include <filesystem>

struct Node{
	const Node* parent;
	UUID id;
	std::string name;
	Vec2<std::uint64_t> pos;
	std::list<UUID> children;
	friend DataOutputStream& operator<<(DataOutputStream&,const Node&);
	friend DataInputStream& operator>>(DataInputStream&,Node&);
};

constexpr UUID GLOBE{0,0};

const Node& getNodeById(UUID);
void openMap(const std::filesystem::path&);

enum class Direction{
	NORTH, SOUTH, EAST, WEST
};

struct Connection{
	const Node* first;
	const Node* second;
	double weight;
	Direction dir;
	friend DataOutputStream& operator<<(DataOutputStream&,const Connection&);
	friend DataInputStream& operator>>(DataInputStream&,Connection&);
};

struct Route{
	const Node* origin;
	const Node* target;
	std::list<const Connection*> path;
};

#endif /* __INCLUDE_NODE_HPP__2018_11_22_00_08_03 */
