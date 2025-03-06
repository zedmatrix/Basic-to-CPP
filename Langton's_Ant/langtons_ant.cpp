#include <SFML/Graphics.hpp>
#include <iostream>

int main() {
    constexpr int width = 800, height = 800;
    sf::RenderWindow window(sf::VideoMode(width, height), "Langton's Ant (escape to close)");

    int x = width / 2, y = height / 2;
    int dx = -1, dy = 0;

    sf::Image image;
    image.create(width, height, sf::Color::Black);

    // Initialize edges with grey border
    sf::Color grey(128, 128, 128);
    for (int i = 0; i < width; ++i) {
        image.setPixel(i, 0, grey);
        image.setPixel(i, height - 1, grey);
    }
    for (int j = 0; j < height; ++j) {
        image.setPixel(0, j, grey);
        image.setPixel(width - 1, j, grey);
    }
    sf::Texture texture;
    texture.loadFromImage(image);
    sf::Sprite sprite(texture);


    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed)
                window.close();
        }

        // Check current pixel color BEFORE movement
        sf::Color color = image.getPixel(x, y);

        // Draw or erase point based on color
        if (color == sf::Color::Black) {
            image.setPixel(x, y, grey);
            // Turn left (counterclockwise)
            int temp = dx;
            dx = -dy;
            dy = temp;
        } else {
            image.setPixel(x, y, sf::Color::Black);
            // Turn right (clockwise)
            int temp = dx;
            dx = dy;
            dy = -temp;
        }

        // Move and wrap around
        x = (x + dx + width) % width;
        y = (y + dy + height) % height;

        // Update texture and display
        texture.update(image);
        window.clear();
        window.draw(sprite);
        window.display();

        // Exit on ESC key
        if (sf::Keyboard::isKeyPressed(sf::Keyboard::Escape))
            window.close();
    }

    return 0;
}
