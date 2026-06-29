CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio INT NOT NULL
);

INSERT INTO productos (nombre, precio) VALUES
('Producto demo 1', 1000),
('Producto demo 2', 2000);