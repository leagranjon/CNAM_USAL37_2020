use tp_freelancer;

INSERT INTO customers_cats
(cat_id, cat_name)
VALUES
(1, 'Particulier'),
(2, 'Secteur public'),
(3, 'Entreprise privée');


INSERT INTO customers
(customer_id, customer_name, customer_email, cat_id)
VALUES 
(1, 'Mike', 'm@test.fr', 1),
(2, 'Jon', 'j@test.fr', 1),
(3, 'FISC', 'fisc@test.fr', 2),
(4, 'Plombier Machin', 'plombier@test.fr', 3);


INSERT INTO jobs 
(job_state, job_title, customer_id)
VALUES
('En cours', 'Site wordpress pour Mike', 1),
('Terminé', 'Site Prestashop pour Mike', 1),
('En cours', 'Site Drupal pour Jon', 2);

