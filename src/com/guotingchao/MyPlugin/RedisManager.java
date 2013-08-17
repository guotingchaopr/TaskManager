package com.guotingchao.MyPlugin;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisManager {
	private static JedisPool pool;
	private String host;
	private int port;
	private int dbIndex;
	
	public RedisManager(String host, int port, int dbIndex) {
		this.host = host;
		this.port = port;
		this.dbIndex = dbIndex;
	}

	public void init() {
		JedisPoolConfig config = new JedisPoolConfig();
		config.setMaxActive(20);
		config.setMaxIdle(50);
		config.setMaxWait(1000L);
		config.setTestOnBorrow(true);
		pool = new JedisPool(config, host,port,dbIndex);
	}

	public JedisPool getJedisPool() {
		return pool;
	}

	public String getHost() {
		return host;
	}

	public int getPort() {
		return port;
	}

	public int getDbIndex() {
		return dbIndex;
	}

	public void destroy() {
		pool.destroy();
	}
}
