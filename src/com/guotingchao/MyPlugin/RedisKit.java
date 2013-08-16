package com.guotingchao.MyPlugin;
import org.apache.log4j.Logger;

import redis.clients.jedis.Jedis;

public class RedisKit {
	private static final Logger logger = Logger.getLogger(RedisKit.class);
	private static volatile RedisManager redisManager;

	static void init(RedisManager redisManager) {
		RedisKit.redisManager = redisManager;
	}

	public static Jedis getJedis() {
		Jedis jedis = null;
		try {
			jedis = redisManager.getJedisPool().getResource();
			jedis.select(redisManager.getDbIndex());
			logger.info("从pool里获取redis  [" + redisManager.getDbIndex() + "]成功," + jedis);
		} catch (Exception e) {
			logger.info(e);
		}
		if (jedis == null) {
			try {
				jedis = new Jedis(redisManager.getHost(), redisManager.getPort(), 2000);
				jedis.select(redisManager.getDbIndex());
				logger.info("创建redis" + redisManager.getDbIndex() + "成功," + jedis);
			} catch (Exception e) {
				logger.info(e);
			}
		}
		return jedis;
	}

	public static void returnResource(Jedis jedis) {
		if (redisManager == null || redisManager.getJedisPool() == null || jedis == null) {
			return;
		}
		redisManager.getJedisPool().returnResource(jedis);
	}
}
