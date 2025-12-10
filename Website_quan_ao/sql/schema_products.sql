-- Schema for product management (products + categories + sample data)
-- Database: csdl_webbanquanao

CREATE DATABASE IF NOT EXISTS `csdl_webbanquanao` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `csdl_webbanquanao`;

-- Categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Products
CREATE TABLE IF NOT EXISTS `products` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `category_id` INT DEFAULT NULL,
  `image` VARCHAR(255),
  `stock` INT DEFAULT 0,
  `status` TINYINT DEFAULT 1 COMMENT '1=active,0=inactive',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample categories
INSERT INTO `categories` (`name`, `description`) VALUES
('Áo', 'Các loại áo nam nữ'),
('Quần', 'Các loại quần'),
('Phụ kiện', 'Giày dép, túi xách, trang sức');

-- Sample products
INSERT INTO `products` (`name`, `description`, `price`, `category_id`, `image`, `stock`) VALUES
('Áo Thun Trơn', 'Áo thun cotton basic', 120000.00, 1, 'images/products/ao_thun_tron.jpg', 50),
('Quần Jean Xanh', 'Quần jean nam/ nữ', 250000.00, 2, 'images/products/quan_jean_xanh.jpg', 30),
('Dây Chuyền Bạc', 'Dây chuyền thời trang', 80000.00, 3, 'images/products/day_chuyen_bac.jpg', 15);

-- Indexes
CREATE INDEX idx_products_name ON products(name);
CREATE INDEX idx_products_category ON products(category_id);

-- End of schema
