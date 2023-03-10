CREATE TABLE user_date
(
    user_id              int PRIMARY KEY,
    name                 varchar(255),
    surname              varchar(255),
    date_of_registration Date
);

CREATE TABLE wallet
(
    wallet_id int PRIMARY KEY,
    currency  varchar(255),
    amount    decimal(10, 2),
    user_id   int,
    created   Date,
    FOREIGN KEY (user_id) REFERENCES user_date (user_id)
);

INSERT INTO user_date (user_id, name, surname, date_of_registration)
VALUES (1, 'Tom', 'Wed', '2023-02-01'),
       (2, 'Miky', 'Smig', '2023-06-10');

INSERT INTO wallet (wallet_id, currency, amount, user_id, created)
VALUES (1, 'UAH', 1000.10, 1, '2023-02-02'),
       (2, 'USD', 30.33, 1, '2023-02-03'),
       (3, 'UAH', 122.10, 2, '2023-07-10'),
       (4, 'USD', 2.33, 2, '2023-08-10');

SELECT user_date.name, user_date.surname, wallet.currency, wallet.amount
FROM user_date
         JOIN wallet ON user_date.user_id = wallet.user_id
