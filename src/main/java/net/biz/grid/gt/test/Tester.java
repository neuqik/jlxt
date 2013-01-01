package net.biz.grid.gt.test;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Tester {
	public int value;
	public static Map classCache = Collections.synchronizedMap(new HashMap());

	public Tester() {
		this.value = 0;
	}

	public static Object loadAction(String className)
			throws ClassNotFoundException, InstantiationException,
			IllegalAccessException {
		Class clazz = (Class) classCache.get(className);
		if (clazz == null) {
			clazz = Class.forName(className);
			classCache.put(className, clazz);
		}
		return clazz.newInstance();
	}

	public static void main(String[] args) throws InstantiationException,
			IllegalAccessException, ClassNotFoundException {
		String className = "Tester";

		long b1 = System.currentTimeMillis();
		for (int i = 0; i < 10000; i++) {
			loadAction(className);
		}

		long e1 = System.currentTimeMillis();
		System.out.println("Class.forName " + (e1 - b1));

		System.gc();

		long b2 = System.currentTimeMillis();
		for (int i = 0; i < 10000; i++) {
			new Tester();
		}
		long e2 = System.currentTimeMillis();
		System.out.println("new Tester() " + (e2 - b2));

		System.out.println(e1 - b1 - (e2 - b2));
	}
}
