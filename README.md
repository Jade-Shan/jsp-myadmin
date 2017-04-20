# jsp-myadmin

Jsp mysql admin tool

## 安装

### 关于数据库连接配置

数据库的连接配置写在文件`src/main/webapp/db-conn.js`里，
为了安全，已经在`.gitignore`中把这个文件排除。

拉下源代码后以`src/main/webapp/db-conn.example.js`为样本，
自己把`src/main/webapp/db-conn.js`写上。
