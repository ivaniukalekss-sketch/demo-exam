
CREATE TABLE Roles (
    role_id SERIAL PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE OrderStatuses (
    status_id SERIAL PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    login VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER REFERENCES Roles(role_id)
);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    article VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(200) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    brand VARCHAR(100),
    supplier VARCHAR(100),
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    unit VARCHAR(20) DEFAULT 'шт',
    quantity INTEGER NOT NULL DEFAULT 0,
    discount INTEGER DEFAULT 0,
    image_path VARCHAR(500),
    is_active INTEGER DEFAULT 1
);

CREATE TABLE PickupPoints (
    pickup_point_id SERIAL PRIMARY KEY,
    address VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE NOT NULL,
    delivery_date DATE,
    pickup_point_id INTEGER REFERENCES PickupPoints(pickup_point_id),
    user_id INTEGER REFERENCES Users(user_id),
    pickup_code VARCHAR(20),
    status_id INTEGER REFERENCES OrderStatuses(status_id)
);

CREATE TABLE OrderItems (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER REFERENCES Orders(order_id) ON DELETE CASCADE,
    product_article VARCHAR(50) REFERENCES Products(article),
    quantity INTEGER DEFAULT 1
);

INSERT INTO Roles (role_name) VALUES 
('Гость'),
('Авторизированный клиент'),
('Менеджер'),
('Администратор');

INSERT INTO OrderStatuses (status_id, status_name) VALUES 
(1, 'Новый'),
(2, 'Подтверждён'),
(3, 'В доставке'),
(4, 'Доставлен'),
(5, 'Завершен'),
(6, 'Отменён');

INSERT INTO Users (full_name, login, password_hash, role_id) VALUES
('Никифорова Весения Николаевна', '94d5ous@gmail.com', 'uzWC67', 4),
('Сазонов Руслан Германович', 'uth4iz@mail.com', '2L6KZG', 4),
('Одинцов Серафим Артёмович', 'yzls62@outlook.com', 'JIFRCZ', 4),
('Степанов Михаил Артёмович', '1diph5e@tutanota.com', '8ntwUp', 3),
('Ворсин Петр Евгеньевич', 'tjde7c@yahoo.com', 'YOyhfR', 3),
('Старикова Елена Павловна', 'wpmrc3do@tutanota.com', 'RSbVHv', 3),
('Михайлюк Анна Вячеславовна', '5d4zbu@tutanota.com', 'rwVDh9', 2),
('Ситдикова Елена Анатольевна', 'ptec8ym@yahoo.com', 'LdNyos', 2),
('Ворсин Петр Евгеньевич', '1qz4kw@mail.com', 'gynQMT', 2),
('Старикова Елена Павловна', '4np6se@mail.com', 'AtnDjr', 2);

INSERT INTO Products (article, name, category, description, brand, supplier, price, unit, quantity, discount, is_active) VALUES
('A112T4', 'Ботинки женские классические', 'Женская обувь', 'Женские ботинки из натуральной кожи', 'Kari', 'Kari', 1700.00, 'шт', 7, 2, 1),
('F635R4', 'Ботинки Marco Tozzi', 'Женская обувь', 'Ботинки Marco Tozzi на платформе', 'Marco Tozzi', 'Обувь для вас', 1800.00, 'шт', 14, 2, 1),
('H782T5', 'Ботинки мужские', 'Мужская обувь', 'Мужские ботинки кожаные', 'Rieker', 'Обувь для вас', 2100.00, 'шт', 3, 2, 1),
('G783F5', 'Ботинки мужские', 'Мужская обувь', 'Мужские ботинки повседневные', 'Poc', 'Kari', 4699.00, 'шт', 5, 2, 1),
('J384T6', 'Полуботинки', 'Мужская обувь', 'B3430/14 Полуботинки', 'Rieker', 'Обувь для вас', 9000.00, 'шт', 15, 17, 1),
('D572U8', 'Кеды женские', 'Женская обувь', 'Кеды женские дышащие', 'CROSBY', 'Обувь для вас', 500.00, 'шт', 0, 13, 1),
('F572H7', 'Туфли женские', 'Женская обувь', 'Туфли на каблуке', 'Rieker', 'Kari', 500.00, 'шт', 2, 20, 1),
('D329H3', 'Ботинки зимние', 'Женская обувь', 'Ботинки утеплённые', 'Rieker', 'Kari', 4300.00, 'шт', 6, 2, 1),
('B320R5', 'Кроссовки', 'Мужская обувь', 'Кроссовки спортивные', 'Rieker', 'Обувь для вас', 5400.00, 'шт', 18, 4, 1),
('G432E4', 'Сандалии', 'Женская обувь', 'Сандалии летние', 'Rieker', 'Обувь для вас', 4399.00, 'шт', 12, 3, 1),
('S213E3', 'Сапоги', 'Женская обувь', 'Сапоги зимние', 'CROSBY', 'Kari', 8900.00, 'шт', 4, 10, 1),
('E482R4', 'Мокасины', 'Мужская обувь', 'Мокасины кожаные', 'CROSBY', 'Обувь для вас', 3500.00, 'шт', 8, 5, 1);

INSERT INTO PickupPoints (address) VALUES
('420151, г. Лесной, ул. Вишневая, 32'),
('125061, г. Лесной, ул. Подгорная, 8'),
('630370, г. Лесной, ул. Шоссейная, 24'),
('400562, г. Лесной, ул. Зеленая, 32'),
('614510, г. Лесной, ул. Маяковского, 47'),
('410542, г. Лесной, ул. Светлая, 46'),
('620839, г. Лесной, ул. Цветочная, 8'),
('443890, г. Лесной, ул. Коммунистическая, 1'),
('603379, г. Лесной, ул. Спортивная, 46'),
('603721, г. Лесной, ул. Гоголя, 41'),
('410172, г. Лесной, ул. Северная, 13'),
('614611, г. Лесной, ул. Молодежная, 50'),
('454311, г. Лесной, ул. Новая, 19'),
('660007, г. Лесной, ул. Октябрьская, 19'),
('603036, г. Лесной, ул. Садовая, 4'),
('394060, г. Лесной, ул. Фрунзе, 43'),
('410661, г. Лесной, ул. Школьная, 50'),
('625590, г. Лесной, ул. Коммунистическая, 20'),
('625683, г. Лесной, ул. 8 Марта'),
('450983, г. Лесной, ул. Комсомольская, 26'),
('394782, г. Лесной, ул. Чехова, 3'),
('603002, г. Лесной, ул. Дзержинского, 28'),
('450558, г. Лесной, ул. Набережная, 30'),
('344288, г. Лесной, ул. Чехова, 1'),
('614164, г. Лесной, ул. Степная, 30'),
('394242, г. Лесной, ул. Коммунистическая, 43'),
('660540, г. Лесной, ул. Солнечная, 25'),
('125837, г. Лесной, ул. Шоссейная, 40'),
('125703, г. Лесной, ул. Партизанская, 49'),
('625283, г. Лесной, ул. Победы, 46'),
('614753, г. Лесной, ул. Полевая, 35'),
('426030, г. Лесной, ул. Маяковского, 44'),
('450375, г. Лесной, ул. Клубная, 44'),
('625560, г. Лесной, ул. Некрасова, 12'),
('630201, г. Лесной, ул. Комсомольская, 17'),
('190949, г. Лесной, ул. Мичурина, 26');

INSERT INTO Orders (order_id, order_date, delivery_date, pickup_point_id, user_id, pickup_code, status_id) VALUES
(1, '2025-02-27', '2025-04-20', 1, 4, '901', 5),
(2, '2022-09-28', '2025-04-21', 11, 1, '902', 5),
(3, '2025-03-21', '2025-04-22', 2, 2, '903', 5),
(4, '2025-02-20', '2025-04-23', 11, 3, '904', 5),
(5, '2025-03-17', '2025-04-24', 2, 4, '905', 5),
(6, '2025-03-01', '2025-04-25', 15, 1, '906', 5),
(7, '2025-02-28', '2025-04-26', 3, 2, '907', 5),
(8, '2025-03-31', NULL, 19, 3, '908', 1),
(9, '2025-04-02', NULL, 1, 4, '909', 1),
(10, '2025-04-03', NULL, 19, 4, '910', 1);

INSERT INTO OrderItems (order_id, product_article, quantity) VALUES
(1, 'A112T4', 1),
(1, 'F635R4', 1),
(2, 'H782T5', 1),
(2, 'G783F5', 1),
(3, 'J384T6', 1),
(3, 'D572U8', 1),
(4, 'F572H7', 1),
(4, 'D329H3', 1),
(5, 'A112T4', 1),
(5, 'F635R4', 1),
(6, 'H782T5', 1),
(6, 'G783F5', 1),
(7, 'J384T6', 1),
(7, 'D572U8', 1),
(8, 'F572H7', 1),
(8, 'D329H3', 1),
(9, 'B320R5', 1),
(9, 'G432E4', 1),
(10, 'S213E3', 1),
(10, 'E482R4', 1);