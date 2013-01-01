package org.eweb4j.orm.sql;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.eweb4j.cache.ORMConfigBeanCache;
import org.eweb4j.orm.config.ORMConfigBeanUtil;
import org.eweb4j.orm.config.bean.ORMConfigBean;
import org.eweb4j.util.ClassUtil;
import org.eweb4j.util.ReflectUtil;

/**
 * 生成删除语句
 * 
 * @author cfuture.wg
 * @since v1.a.0
 */
public class DeleteSqlCreator<T> {
	private T[] ts;

	public DeleteSqlCreator() {
	}

	public DeleteSqlCreator(T... ts) {
		T[] tmp = null;
		if (ts != null && ts.length > 0) {
			tmp = ts.clone();
		}
		this.ts = tmp;
	}

	public String deleteWhere(String condition) {
		if (this.ts != null && this.ts.length > 0) {
			StringBuilder sb = new StringBuilder();
			for (T t : this.ts) {
				sb.append(this.makeSQL(t, condition));
			}
			return sb.toString();
		} else {
			return "";
		}
	}

	private String makeSQL(T t, String condition) {
		ORMConfigBean ormBean = ORMConfigBeanCache.get(t.getClass());
		String table = ormBean != null ? ormBean.getTable() : t.getClass()
				.getSimpleName();
		return String.format("DELETE FROM %s WHERE %s ;", table, condition);
	}

	public String[] delete() throws SqlCreateException {
		String[] sqls = new String[ts.length];
		for (int i = 0; i < ts.length; i++) {
			sqls[i] = this.makeSQL(ts[i]);
		}
		return sqls;
	}

	public String[] delete(String[] fields, String[] values)
			throws SqlCreateException {
		String[] sqls = new String[ts.length];
		for (int i = 0; i < ts.length; i++) {
			sqls[i] = this.makeSQL(ts[i], fields, values);
		}
		return sqls;
	}

	public String[] delete(String... fields) throws SqlCreateException {
		String[] sqls = new String[ts.length];
		for (int i = 0; i < ts.length; i++) {
			sqls[i] = this.makeSQL(ts[i], fields);
		}
		return sqls;
	}

	private String makeSQL(T t) throws SqlCreateException {
		Class<?> clazz = t.getClass();
		String idColumn;
		String idField;
		String table;
		HashMap<String, Object> map = null;
		Object idValue = null;
		if (Map.class.isAssignableFrom(clazz)) {
			map = (HashMap<String, Object>) t;
			idColumn = (String) map.get("idColumn");
			if (idColumn == null)
				idColumn = "id";
			idField = idColumn;
			table = (String) map.get("table");

			idValue = map.get("idValue");
		} else {
			idField = ORMConfigBeanUtil.getIdField(clazz);
			table = ORMConfigBeanUtil.getTable(clazz);
			idColumn = ORMConfigBeanUtil.getIdColumn(clazz);
			ReflectUtil ru = new ReflectUtil(t);
			Method method = ru.getGetter(idField);
			if (method == null) {
				throw new SqlCreateException("can not find id getter.");
			}

			try {
				idValue = method.invoke(t);
			} catch (Exception e) {
				throw new SqlCreateException(method + " invoke exception "
						+ e.toString());
			}
		}

		StringBuilder condition = new StringBuilder();
		condition.append(idColumn + " = ");

		condition.append("'" + idValue + "'");

		return String.format("DELETE FROM %s WHERE %s ;", table, condition);
	}

	private String makeSQL(T t, String[] fields, String[] values)
			throws SqlCreateException {
		Class<?> clazz = t.getClass();
		String table = ORMConfigBeanUtil.getTable(clazz);

		StringBuilder condition = new StringBuilder();
		String[] columns = ORMConfigBeanUtil.getColumns(clazz, fields);
		for (int i = 0; i < columns.length; ++i) {
			if (condition.length() > 0) {
				condition.append(" AND ");
			}

			condition.append(columns[i] + " = ");
			condition.append("'" + values[i] + "'");

		}
		return String.format("DELETE FROM %s WHERE %s ;", table, condition);
	}

	private String makeSQL(T t, String... fields) throws SqlCreateException {
		Class<?> clazz = t.getClass();
		String table = ORMConfigBeanUtil.getTable(clazz);
		StringBuilder condition = new StringBuilder();
		ReflectUtil ru = new ReflectUtil(t);

		for (int i = 0; i < fields.length; i++) {
			if (condition.length() > 0)
				condition.append(" AND ");

			Method getter = ru.getGetter(fields[i]);
			if (getter == null)
				continue;

			String column = ORMConfigBeanUtil.getColumn(clazz, fields[i]);
			condition.append(column + " = ");

			Object _value = null;
			Object value = null;
			try {
				_value = getter.invoke(t);
				if (_value == null)
					continue;

				if (ClassUtil.isPojo(_value.getClass())) {
					Field f = ru.getField(fields[i]);
					OneToOne oneAnn = getter.getAnnotation(OneToOne.class);
					if (oneAnn == null)
						oneAnn = f.getAnnotation(OneToOne.class);
					
					ManyToOne manyToOneAnn = null;
					if (oneAnn == null){
						manyToOneAnn = getter.getAnnotation(ManyToOne.class);
						if (manyToOneAnn == null)
							manyToOneAnn = f.getAnnotation(ManyToOne.class);
						
					}
					
					if (oneAnn != null || manyToOneAnn != null) {
						ReflectUtil tarRu = new ReflectUtil(_value);
						String tarFKField = ORMConfigBeanUtil.getIdField(_value.getClass());

						Method tarFKGetter = tarRu.getGetter(tarFKField);
						value = tarFKGetter.invoke(_value);
					}
				}

				if (value == null)
					value = _value;

			} catch (Exception e) {
				throw new SqlCreateException(getter + " invoke exception "
						+ e.toString());
			}

			condition.append("'" + value + "'");

		}
		return String.format("DELETE FROM %s WHERE %s ;", table, condition);
	}

	public T[] getTs() {
		T[] tmp = null;
		if (ts != null && ts.length > 0) {
			tmp = ts.clone();
		}
		return tmp;
	}

	public void setTs(T[] ts) {
		T[] tmp = null;
		if (ts != null && ts.length > 0) {
			tmp = ts.clone();
		}
		this.ts = tmp;
	}
}
