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
  is_male: true,
  birthday: '2020-01-01',
  height: 1.80
}

const client = new Client(config);
start();

async function start(){
  await client.connect();
  const res = await client.query(`
  INSERT INTO "users"("first_name","last_name","email","is_male","birthday","height")
  VALUES
  ('${user.first_name}','${user.last_name}','${user.email}', '${user.is_male}', '${user.birthday}','${user.height}') 
  `);
  console.log(res);
  await client.end();
}