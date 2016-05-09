create table IF NOT EXISTS users (
  username varchar(255) PRIMARY KEY,
  password varchar(255),
  enabled boolean
);

create table IF NOT EXISTS user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(255) NOT NULL,
  role varchar(255) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));

create table IF NOT EXISTS authorities (
  username varchar(255),
  authority varchar(255)
);

create table IF NOT EXISTS oauth_client_details (
  client_id varchar(255) PRIMARY KEY,
  resource_ids varchar(255),
  client_secret varchar(255),
  scope varchar(255),
  authorized_grant_types varchar(255),
  web_server_redirect_uri varchar(255),
  authorities varchar(255),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information TEXT,
  autoapprove varchar(255)
);

create table IF NOT EXISTS oauth_client_token (
  token_id varchar(255),
  token BLOB,
  authentication_id varchar(255),
  user_name varchar(255),
  client_id varchar(255)
);

create table IF NOT EXISTS oauth_access_token (
  token_id varchar(255),
  token BLOB,
  authentication_id varchar(255),
  user_name varchar(255),
  client_id varchar(255),
  authentication BLOB,
  refresh_token varchar(255)
);

create table IF NOT EXISTS oauth_refresh_token (
  token_id varchar(255),
  token BLOB,
  authentication BLOB
);

create table IF NOT EXISTS oauth_code (
  code varchar(255), authentication BLOB
);

