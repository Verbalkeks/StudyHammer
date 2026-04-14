DROP TABLE IF EXISTS answer, question, question_type, subcategory, category CASCADE;

create table category(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_name varchar(50) NOT NULL,
    category_description varchar
);

create table subcategory(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cid int
    subcategory_name varchar(50) NOT NULL,
    subcategory_description varchar,
    constraint subcategory_fk_category foreign key (cid) references category(id) ON DELETE SET NULL
);

create table question_type(
    id int id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    question_type_name varchar NOT NULL
    question_type_description varchar
);

create table question(
  id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  cid int,
  scid int,
  qtid int NOT NULL,
  question_text varchar NOT NULL,
  constraint question_fk_category foreign key (cid) references category(id) ON DELETE SET NULL,
  constraint question_fk_subcategory foreign key (scid) references subcategory(id) ON DELETE SET NULL,
  constraint question_fk_type foreign key (qtid) references question_type(id) ON DELETE RESTRICT
);

create table answer(
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    qid int NOT NULL,
    qtid in NOT NULL,
    answer_text varchar NOT NULL,
    is_right_answer boolean,
    constraint answer_fk_category foreign key (qid) references question(id) ON DELETE CASCADE,
    constraint answer_fk_question_type foreign key (qtid) references question_type(id) ON DELETE RESTRICT
);
