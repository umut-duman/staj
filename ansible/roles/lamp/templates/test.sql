CREATE TABLE IF NOT EXISTS test (
	content VARCHAR(255)
) ENGINE MyISAM DEFAULT CHARSET=utf8;
INSERT INTO test(content) VALUES("First item");
INSERT INTO test(content) VALUES("Second item");
INSERT INTO test(content) VALUES("Third item");

