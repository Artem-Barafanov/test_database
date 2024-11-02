#include <iostream>
#include "database.h"

int main() {
    Database db("localhost", "root", "password", "zoo_1");

    if (!db.connect()) {
        std::cerr << "Failed to connect to the database!" << std::endl;
        return 1;
    }

    db.addFood("Carrot", 0.5, 0.1);
    db.addAnimalType("Rabbit", 1, 0.2);
    db.addAnimal(1, "Bugs Bunny", "Carrot");
    db.addSell(1, false);

    db.disconnect();

    return 0;
}