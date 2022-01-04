const { Client } = require('pg');
const config = {
  host: 'localhost',
  port: 5432,
  database: 'fm_test',
  user: 'postgres',
  password: 'postgres',
};
const user = {
  first_name:'Pew',
  last_name: 'Pew',
  email: 'empty@asdf.com',
  is_male:true,
  birthday: '2020-01-01',
  height: 180
}

const client = new Client(config);
start();

async function start(){
  await client.connect();
  const res = await client.query(`
  CREATE TABLE "from_js"(
    "id" serial PRIMARY KEY
  );
  `);
  console.log(res);
  await client.end();
}