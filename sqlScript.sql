USE dnd_gen_storage;

START TRANSACTION;

CREATE TABLE IF NOT EXISTS dnd_gen_storage.kit (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.item (
    id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    class_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.kit_to_item (
    kit_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    FOREIGN KEY (kit_id)
        REFERENCES dnd_gen_storage.kit (id)
        ON DELETE CASCADE,
    FOREIGN KEY (item_id)
        REFERENCES dnd_gen_storage.item (id)
        ON DELETE CASCADE		
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.background (
	id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.background_to_item (
	background_id BIGINT NOT NULL,
    item_id BIGINT NOT NULL,
    FOREIGN KEY (item_id)
        REFERENCES dnd_gen_storage.item (id)
        ON DELETE CASCADE,		
	FOREIGN KEY (background_id)
        REFERENCES dnd_gen_storage.background (id)
        ON DELETE CASCADE		    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.attribute (
	id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.super_class (
	id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.class (
	id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    super_class_id BIGINT NOT NULL,
	PRIMARY KEY (id),   
    FOREIGN KEY (super_class_id)
        REFERENCES dnd_gen_storage.super_class (id)
        ON DELETE CASCADE	
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.class_attribute_priority (
	class_id BIGINT NOT NULL,
    attribute_id BIGINT NOT NULL, 
    priority BIGINT NOT NULL, 
    FOREIGN KEY (class_id)
        REFERENCES dnd_gen_storage.class (id)
        ON DELETE CASCADE,
	FOREIGN KEY (attribute_id)
        REFERENCES dnd_gen_storage.attribute (id)
        ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.choice(
	id BIGINT NOT NULL,
	super_class_id BIGINT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (super_class_id)
		REFERENCES dnd_gen_storage.super_class (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.choice_to_kit(
	choice_id BIGINT NOT NULL,
	kit_id BIGINT NOT NULL,
	FOREIGN KEY (choice_id)
		REFERENCES dnd_gen_storage.choice (id)
		ON DELETE CASCADE,
	FOREIGN KEY (kit_id)
		REFERENCES dnd_gen_storage.kit (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.choice_to_item(
	choice_id BIGINT NOT NULL,
	item_id BIGINT NOT NULL,
	FOREIGN KEY (choice_id)
		REFERENCES dnd_gen_storage.choice (id)
		ON DELETE CASCADE,
	FOREIGN KEY (item_id)
		REFERENCES dnd_gen_storage.item (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.super_race(
	id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    appearence_id BIGINT NOT NULL,
    max_height BIGINT NOT NULL,
    size VARCHAR(255) NOT NULL,
    min_weight BIGINT NOT NULL,
    max_weight BIGINT NOT NULL,
    min_height BIGINT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.super_race_attribute_bonus(
	super_race_id BIGINT NOT NULL,
	attribute_id BIGINT NOT NULL,
    bonus BIGINT NOT NULL,
	FOREIGN KEY (super_race_id)
		REFERENCES dnd_gen_storage.super_race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (attribute_id)
		REFERENCES dnd_gen_storage.attribute (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race(
	id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    super_race_id BIGINT NOT NULL,
    skin_colr VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (super_race_id)
		REFERENCES dnd_gen_storage.super_race (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race_attribute_bonus(
	race_id BIGINT NOT NULL,
	attribute_id BIGINT NOT NULL,
    bonus BIGINT NOT NULL,
	FOREIGN KEY (race_id)
		REFERENCES dnd_gen_storage.race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (attribute_id)
		REFERENCES dnd_gen_storage.attribute (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.hair_color(
id BIGINT NOT NULL,
color VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race_to_hair_color(
	race_id BIGINT NOT NULL,
	hair_color_id BIGINT NOT NULL,
	FOREIGN KEY (race_id)
		REFERENCES dnd_gen_storage.race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (hair_color_id)
		REFERENCES dnd_gen_storage.hair_color (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.eye_color(
id BIGINT NOT NULL,
color VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race_to_eye_color(
	race_id BIGINT NOT NULL,
	eye_color_id BIGINT NOT NULL,
	FOREIGN KEY (race_id)
		REFERENCES dnd_gen_storage.race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (eye_color_id)
		REFERENCES dnd_gen_storage.eye_color (id)
		ON DELETE CASCADE
);

COMMIT;