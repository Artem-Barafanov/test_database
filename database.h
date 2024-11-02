#ifndef DATABASE_H
#define DATABASE_H

#include <mysql/mysql.h>
#include <string>

class Database {
public:
    Database(const std::string& host, const std::string& user, const std::string& password, const std::string& dbName);
    ~Database();

    bool connect();
    void disconnect();

    bool addFood(const std::string& name, double price, double weight);
    bool addAnimalType(const std::string& name, int foodId, double amount);
    bool addAnimal(int typeId, const std::string& name, const std::string& food);
    bool addSell(int animalId, bool underRepair);

private:
    std::string host;
    std::string user;
    std::string password;
    std::string dbName;
    MYSQL* conn;
};

#endif // DATABASE_H