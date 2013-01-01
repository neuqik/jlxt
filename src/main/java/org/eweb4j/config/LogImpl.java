package org.eweb4j.config;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.eweb4j.config.bean.LogConfigBean;
import org.eweb4j.config.bean.LogsConfigBean;
import org.eweb4j.util.FileUtil;
import org.eweb4j.util.StringUtil;

public class LogImpl implements Log {
	private Class<?> clazz;
	private String module = "";
	private LogsConfigBean logs;

	public LogImpl(LogsConfigBean logs, String module, Class<?> clazz) {
		this.logs = logs;
		this.clazz = clazz;
		if (module != null && module.trim().length() > 0)
			this.module = " [" + module + "]";
	}

	public LogImpl() {
	}

	private void write(final int level, final String mess) {
		if (logs == null || logs.getLog() == null)
			return;

		for (LogConfigBean log : logs.getLog()) {
			/* 如果当前给定的日志级别小于配置的允许级别，不予记录 */
			if (LogLevel.level(log.getLevel()) == 0
					|| level < LogLevel.level(log.getLevel())) {
				return;
			}

			StringBuilder sb = new StringBuilder();
			sb.append("[");
			sb.append(LogLevel.level(level).toUpperCase());
			sb.append("] ");
			sb.append(StringUtil.getNowTime("HH:mm:ss"));
			sb.append(this.module.toLowerCase());
			sb.append(" ~ ");
			Exception e = new Exception(this.clazz.getName());
			StackTraceElement s = e.getStackTrace()[2];
			String m = s.getClassName() + "." + s.getMethodName();
			sb.append(s.toString().replace(m, ""));
			sb.append(" ");
			sb.append(mess);

			if ("1".equals(log.getConsole()) || "true".equalsIgnoreCase(log.getConsole())){
				if (level > 3)
					System.err.println(sb.toString());
				else
					System.out.println(sb.toString());
			}

			BufferedWriter bw = null;
			try {
				if (log.getFile() != null) {
					File file = new File(ConfigConstant.CONFIG_BASE_PATH + log.getFile());
					if (!file.exists()) {
						FileUtil.createFile(log.getFile());
					}

					if (file.length() / (1024 * 1024) >= Integer.parseInt(log
							.getSize())) {
						File tf = new File(file.getAbsolutePath() + "."
								+ StringUtil.getNowTime("_MMddHHmmss"));
						FileUtil.copy(file, tf);
						file.delete();
						file = null;
						file = new File(log.getFile());
					}

					bw = new BufferedWriter(new FileWriter(file, true));

					bw.newLine();
					bw.write(sb.toString());
					bw.close();

				}
			} catch (Exception ex) {

			} finally {
				if (bw != null) {
					try {
						bw.close();
					} catch (IOException ex) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public void info(String info) {
		this.write(1, info);
	}

	public void debug(String debug) {
		this.write(2, debug);
	}

	public void warn(String warn) {
		this.write(3,  warn);
	}

	public void error(String error) {
		this.write(4,  error);
	}

	public void fatal(String fatal) {
		this.write(5,  fatal);
	}

	public Class<?> getClazz() {
		return clazz;
	}

	public void setClazz(Class<?> clazz) {
		this.clazz = clazz;
	}

	public String getModule() {
		return module;
	}

	public void setModule(String module) {
		this.module = module;
	}

	public LogsConfigBean getLogs() {
		return logs;
	}

	public void setLogs(LogsConfigBean logs) {
		this.logs = logs;
	}

}
