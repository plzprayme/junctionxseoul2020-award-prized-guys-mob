# 요구 패키지
pip install -r requirements.txt

# On ubuntu
ubuntu 기준 `mysql` 에 `root` 의 `plugin` 이  `auth_token` 로 설정되어 있었다.
이때 `sqlalchemy` 를 통해서 데이터베이스 인스턴스를 생성하려고 할 때 에러가 발생했다.
그래서 `mysql`에 접속해서 `ALTER USER root@localhost IDENTIFIED BY mysql_native_password BY '1234';` 를 입력하고 `FLUSH PRIVIELEGES;` 를 입력해야한다.

# Run
`python app.py`
 
