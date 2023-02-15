create table posts
(
    id    bigserial primary key,
    text  text not null,
    votes int
);