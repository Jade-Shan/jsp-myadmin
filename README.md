# jsp-myadmin

Jsp mysql admin tool

## 安装

### 关于数据库连接配置

数据库的连接配置写在文件`src/main/webapp/db-conn.js`里，
为了安全，已经在`.gitignore`中把这个文件排除。

拉下源代码后以`src/main/webapp/db-conn.example.js`为样本，
自己把`src/main/webapp/db-conn.js`写上。

## 常用SQL

### 异常统计

#### 统计错误类型

	select
		error_message, count(1) from octopus_exception_new 
	where
		task_type_id=4006002 and build_time=1500112800012 
		and task_id in (
			select task_id from (
				select task_id, count(1) ec from octopus_exception_new 
				where task_type_id=4006002 and build_time=1500112800012 group by task_id
			) et where et.ec>9) group by error_message

#### 统计错误任务

	select * from octopus_exception_new 
	where
		task_type_id=4006002 and build_time=1500112800012 
		and task_id in (
			select task_id from (
				select task_id, count(1) ec from octopus_exception_new 
				where task_type_id=4006002 and build_time=1500112800012 group by task_id
			) et where et.ec>9)
