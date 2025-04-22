CREATE DATABASE hair_chart_dev
  WITH ENCODING 'UTF8'
       LC_COLLATE='ko_KR.UTF-8'
       LC_CTYPE='ko_KR.UTF-8'
       TEMPLATE=template0;

-- if there isn't ko_KR.UTF-8, you need to install
-- locale -a | grep ko_KR; sudo locale-gen ko_KR.UTF-8 && sudo update-locale
