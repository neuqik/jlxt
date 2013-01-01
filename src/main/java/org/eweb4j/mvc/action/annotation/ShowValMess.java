package org.eweb4j.mvc.action.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Inherited
@Documented  
@Retention(RetentionPolicy.RUNTIME)
@Target(value = { ElementType.TYPE,ElementType.METHOD })
public @interface ShowValMess {
	String value() default "alert";
}
