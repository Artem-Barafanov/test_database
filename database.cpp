#include "database.h"
#include <iostream>

Database::Database(const std::string& host, const std::string& user, const std::string& password, const std::string& dbName)
    : host(host), user(user), password(password), dbName(dbName), conn(nullptr) {}

Database::~Database() {
    disconnect();
}

bool Database::connect() {
    conn = mysql_init(nullptr);
    if (!mysql_real_connect(conn, host.c_str(), user.c_str(), password.c_str(), dbName.c_str(), 0, nullptr, 0)) {
        std::cerr << "Error: " << mysql_error(conn) << std::endl;
        return false;
    }
    return true;
}

void Database::disconnect() {
    if (conn) {
        mysql_close(conn);
        conn = nullptr;
    }
}

bool Database::addFood(const std::string& name, double price, double weight) {
    std::string query = "INSERT INTO food (name_food, price_for_unit, unit_weight) VALUES ('" + name + "', " + std::to_string(price) + ", " + std::to_string(weight) + ")";
    if (mysql_query(conn, query.c_str())) {
        std::cerr << "Error: " << mysql_error(conn) << std::endl;
        return false;
    }
    return true;
}

bool Database::addAnimalType(const std::string& name, int foodId, double amount) {
    std::string query = "INSERT INTO `animal types` (name_type, id_food, amount_of_food) VALUES ('" + name + "', " + std::to_string(foodId) + ", " + std::to_string(amount) + ")";
    if (mysql_query(conn, query.c_str())) {
        std::cerr << "Error: " << mysql_error(conn) << std::endl;
        return false;
    }
    return true;
}

bool Database::addAnimal(int typeId, const std::string& name, const std::string& food) {
    std::string query = "INSERT INTO animals (id_type, name, food) VALUES (" + std::to_string(typeId) + ", '" + name + "', '" + food + "')";
    if (mysql_query(conn, query.c_str())) {
        std::cerr << "Error: " << mysql_error(conn) << std::endl;
        return false;
    }
    return true;
}

bool Database::addSell(int animalId, bool underRepair) {
    std::string query = "INSERT INTO sells (id, under_repair) VALUES (" + std::to_string(animalId) + ", " + (underRepair ? "1" : "0") + ")";
    if (mysql_query(conn, query.c_str())) {
        std::cerr << "Error: " << mysql_error(conn) << std::endl;
        return false;
    }
    return true;
}