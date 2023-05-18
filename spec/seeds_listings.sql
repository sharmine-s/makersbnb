TRUNCATE TABLE users, listings, dates, requests RESTART IDENTITY;

INSERT INTO users(name, username, email, password) VALUES
('John Smith', 'user1', 'john1@smith.com', 'password1'),
('John Smith', 'user2', 'john2@smith.com', 'password2'),
('Jane Doe', 'jdoe', 'jane@gmail.com', 'password3'),
('Halle Berry', 'halle', 'halle@berry.com', 'catwoman');


INSERT INTO listings(title, description, img, price, location, user_id) VALUES 
('HollyWood Mansion', 'A beautiful mansion right under the hollywood sign in LA', 'https://img.gtsstatic.net/reno/imagereader.aspx?imageurl=https%3A%2F%2Fapi-prod.corelogic.com%2Ftrestle%2FMedia%2FCRMLS%2FProperty%2FPHOTO-jpeg%2F1013309050%2F1%2FMTU3Mi8yMjU2LzE5%2FMTkvODYyMy8xNjY2MzU5MzMy%2F_6mUwpQWQj53sOa1IBCE020pr-hhR0aS3syDBif_gPc%3Fdate%3D2023-02-15&option=N&h=472&permitphotoenlargement=false', 100.00, 'Hollywood,LA', '1'),
('HollyWood Penthouse', 'A beautiful mansion right over the hollywood sign in LA','https://dwgyu36up6iuz.cloudfront.net/heru80fdn/image/upload/c_fill,d_placeholder_architecturaldigest.png,fl_progressive,g_face,h_1080,q_80,w_1920/v1658974205/architecturaldigest_on-the-market-inside-a-50000-dollars-000-west-hollywood-penthouse.jpg', 150.00, 'Hollywood,LA', '2');


INSERT INTO dates(listing_id, date, guest_id) VALUES 
('1', '2024-02-11', null),
('2', '2024-02-11', '1'),
('2', '2024-02-12', '1'),
('2', '2024-02-13', '3'),
('2', '2024-02-14', null),
('2', '2024-02-15', null),
('2', '2024-02-16', '4');


INSERT INTO requests(listing_id, date, guest_id) VALUES
('2', '2024-02-14', '4'),
('2', '2024-02-15', '4');