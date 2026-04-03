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
    password_hash VARCHAR(100) NOT NULL,
    role_id INTEGER REFERENCES Roles(role_id)
);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    article VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY,
    order_date DATE NOT NULL,
    delivery_date DATE,
    pickup_address VARCHAR(255),
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

INSERT INTO Products (article) VALUES 
('A112T4'),('F635R4'),('H782T5'),('G783F5'),('J384T6'),('D572U8'),
('F572H7'),('D329H3'),('B320R5'),('G432E4'),('S213E3'),('E482R4');

INSERT INTO Orders (order_id, order_date, delivery_date, pickup_address, user_id, pickup_code, status_id) VALUES
(1, '2025-02-27', '2025-04-20', '1', (SELECT user_id FROM Users WHERE full_name = 'Степанов Михаил Артёмович'), '901', 5),
(2, '2022-09-28', '2025-04-21', '11', (SELECT user_id FROM Users WHERE full_name = 'Никифорова Весения Николаевна'), '902', 5),
(3, '2025-03-21', '2025-04-22', '2', (SELECT user_id FROM Users WHERE full_name = 'Сазонов Руслан Германович'), '903', 5),
(4, '2025-02-20', '2025-04-23', '11', (SELECT user_id FROM Users WHERE full_name = 'Одинцов Серафим Артёмович'), '904', 5),
(5, '2025-03-17', '2025-04-24', '2', (SELECT user_id FROM Users WHERE full_name = 'Степанов Михаил Артёмович'), '905', 5),
(6, '2025-03-01', '2025-04-25', '15', (SELECT user_id FROM Users WHERE full_name = 'Никифорова Весения Николаевна'), '906', 5),
(7, '2025-02-28', '2025-04-26', '3', (SELECT user_id FROM Users WHERE full_name = 'Сазонов Руслан Германович'), '907', 5),
(8, '2025-03-31', '2025-04-27', '19', (SELECT user_id FROM Users WHERE full_name = 'Одинцов Серафим Артёмович'), '908', 1),
(9, '2025-04-02', '2025-04-28', '5', (SELECT user_id FROM Users WHERE full_name = 'Степанов Михаил Артёмович'), '909', 1),
(10, '2025-04-03', '2025-04-29', '19', (SELECT user_id FROM Users WHERE full_name = 'Степанов Михаил Артёмович'), '910', 1);

INSERT INTO OrderItems (order_id, product_article, quantity) VALUES
(1, 'A112T4',1),(1,'F635R4',1),
(2,'H782T5',1),(2,'G783F5',1),
(3,'J384T6',1),(3,'D572U8',1),
(4,'F572H7',1),(4,'D329H3',1),
(5,'A112T4',1),(5,'F635R4',1),
(6,'H782T5',1),(6,'G783F5',1),
(7,'J384T6',1),(7,'D572U8',1),
(8,'F572H7',1),(8,'D329H3',1),
(9,'B320R5',1),(9,'G432E4',1),
(10,'S213E3',1),(10,'E482R4',1);