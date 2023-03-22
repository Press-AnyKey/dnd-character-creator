USE dnd_gen_storage;

START TRANSACTION;

CREATE TABLE IF NOT EXISTS dnd_gen_storage.kit (
    id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.item (
    id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
    class_name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.kit_to_item (
    kit_id VARCHAR(32) NOT NULL,
    item_id VARCHAR(32) NOT NULL,
    FOREIGN KEY (kit_id)
        REFERENCES dnd_gen_storage.kit (id)
        ON DELETE CASCADE,
    FOREIGN KEY (item_id)
        REFERENCES dnd_gen_storage.item (id)
        ON DELETE CASCADE		
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.background (
	id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.background_to_item (
	background_id VARCHAR(32) NOT NULL,
    item_id VARCHAR(32) NOT NULL,
    FOREIGN KEY (item_id)
        REFERENCES dnd_gen_storage.item (id)
        ON DELETE CASCADE,		
	FOREIGN KEY (background_id)
        REFERENCES dnd_gen_storage.background (id)
        ON DELETE CASCADE		    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.attribute (
	id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.super_class (
	id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)    
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.class (
	id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
    super_class_id VARCHAR(32) NOT NULL,
	PRIMARY KEY (id),   
    FOREIGN KEY (super_class_id)
        REFERENCES dnd_gen_storage.super_class (id)
        ON DELETE CASCADE	
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.class_attribute_priority (
	class_id VARCHAR(32) NOT NULL,
    attribute_id VARCHAR(32) NOT NULL, 
    priority VARCHAR(32) NOT NULL, 
    FOREIGN KEY (class_id)
        REFERENCES dnd_gen_storage.class (id)
        ON DELETE CASCADE,
	FOREIGN KEY (attribute_id)
        REFERENCES dnd_gen_storage.attribute (id)
        ON DELETE CASCADE
); 

CREATE TABLE IF NOT EXISTS dnd_gen_storage.choice(
	id VARCHAR(32) NOT NULL,
	super_class_id VARCHAR(32) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (super_class_id)
		REFERENCES dnd_gen_storage.super_class (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.choice_to_kit(
	choice_id VARCHAR(32) NOT NULL,
	kit_id VARCHAR(32) NOT NULL,
	FOREIGN KEY (choice_id)
		REFERENCES dnd_gen_storage.choice (id)
		ON DELETE CASCADE,
	FOREIGN KEY (kit_id)
		REFERENCES dnd_gen_storage.kit (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.choice_to_item(
	choice_id VARCHAR(32) NOT NULL,
	item_id VARCHAR(32) NOT NULL,
	FOREIGN KEY (choice_id)
		REFERENCES dnd_gen_storage.choice (id)
		ON DELETE CASCADE,
	FOREIGN KEY (item_id)
		REFERENCES dnd_gen_storage.item (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.super_race(
	id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
    size VARCHAR(255) NOT NULL,
    max_height FLOAT NOT NULL,
    min_weight FLOAT NOT NULL,
    max_weight FLOAT NOT NULL,
    min_height FLOAT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.super_race_attribute_bonus(
	super_race_id VARCHAR(32) NOT NULL,
	attribute_id VARCHAR(32) NOT NULL,
    bonus VARCHAR(32) NOT NULL,
	FOREIGN KEY (super_race_id)
		REFERENCES dnd_gen_storage.super_race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (attribute_id)
		REFERENCES dnd_gen_storage.attribute (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race(
	id VARCHAR(32) NOT NULL,
    name VARCHAR(255) NOT NULL,
    super_race_id VARCHAR(32) NOT NULL,
    skin_colr VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (super_race_id)
		REFERENCES dnd_gen_storage.super_race (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race_attribute_bonus(
	race_id VARCHAR(32) NOT NULL,
	attribute_id VARCHAR(32) NOT NULL,
    bonus BIGINT NOT NULL,
	FOREIGN KEY (race_id)
		REFERENCES dnd_gen_storage.race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (attribute_id)
		REFERENCES dnd_gen_storage.attribute (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.hair_color(
id VARCHAR(32) NOT NULL,
color VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race_to_hair_color(
	race_id VARCHAR(32) NOT NULL,
	hair_color_id VARCHAR(32) NOT NULL,
	FOREIGN KEY (race_id)
		REFERENCES dnd_gen_storage.race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (hair_color_id)
		REFERENCES dnd_gen_storage.hair_color (id)
		ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.eye_color(
id VARCHAR(32) NOT NULL,
color VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS dnd_gen_storage.race_to_eye_color(
	race_id VARCHAR(32) NOT NULL,
	eye_color_id VARCHAR(32) NOT NULL,
	FOREIGN KEY (race_id)
		REFERENCES dnd_gen_storage.race (id)
		ON DELETE CASCADE,
	FOREIGN KEY (eye_color_id)
		REFERENCES dnd_gen_storage.eye_color (id)
		ON DELETE CASCADE
);

COMMIT;