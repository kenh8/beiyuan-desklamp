package com.beiyuan.tvapi.commom.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.CollationKey;
import java.text.Collator;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.util.ReflectionUtils;

/**
 * 集合工具类 
 *
 * @author Duncan
 *
 * @d2013-11-20
 */
public class CollectionUtil {

    public final static String SORT_DESC = "desc";
    public final static String SORT_ASC = "asc";

    /**
     * 判断集合不为空
     *
     * @param c
     * @return
     */
    @SuppressWarnings("unchecked")
    public static boolean isEmpty(Collection c) {
        return c == null || c.size() == 0;
    }

    /**
     * List集合排序类
     *
     * @param <T>
     * @param list     集合
     * @param property 排序字段名
     * @param sortType 正序 (CollectionUtil.SORT_ASC)、倒序 (CollectionUtil.SORT_DESC)
     * @param isCN     是否按中文排序
     */
    public static <T> void sortList(List<T> list, final String property, final String sortType, final boolean isCN) {
        Collections.sort(list, new Comparator<T>() {
            private Collator collator = null;

            public int compare(T a, T b) {
                int ret = 0;
                Field field = ReflectionUtils.findField(a.getClass(), property);
                String getterMethodName = "get" + StringUtils.capitalize(property);
                Method method = ReflectionUtils.findMethod(a.getClass(), getterMethodName);
                Object value_a = ReflectionUtils.invokeMethod(method, a);
                Object value_b = ReflectionUtils.invokeMethod(method, b);
                if (field.getType() == String.class) {
                    if (isCN) {
                        collator = Collator.getInstance();
                        CollationKey key1 = collator.getCollationKey(value_a.toString());
                        CollationKey key2 = collator.getCollationKey(value_b.toString());
                        if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                            ret = key2.compareTo(key1);
                        else
                            ret = key1.compareTo(key2);
                    } else {
                        if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                            ret = value_b.toString().compareTo(value_a.toString());
                        else
                            ret = value_a.toString().compareTo(value_b.toString());
                    }
                } else if (field.getType() == Integer.class || field.getType() == Long.class || field.getType() == BigDecimal.class) {
                    BigDecimal decA = new BigDecimal(value_a.toString());
                    BigDecimal decB = new BigDecimal(value_b.toString());
                    if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                        ret = decB.compareTo(decA);
                    else
                        ret = decA.compareTo(decB);
                } else if (field.getType() == Date.class) {
                    if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                        ret = ((Date) value_b).compareTo((Date) value_a);
                    else
                        ret = ((Date) value_a).compareTo((Date) value_b);
                }
                return ret;
            }
        });
    }

    /**
     * 对象数组排序
     *
     * @param <T>
     * @param array    对象数组
     * @param property 排序字段名
     * @param sortType 正序 (CollectionUtil.SORT_ASC)、倒序 (CollectionUtil.SORT_DESC)
     * @param isCN     是否按中文排序
     */
    public static <T> void sortObjectArray(T[] array, final String property, final String sortType, final boolean isCN) {
        Arrays.sort(array, new Comparator<T>() {
            private Collator collator = null;

            public int compare(T a, T b) {
                int ret = 0;
                Field field = ReflectionUtils.findField(a.getClass(), property);
                String getterMethodName = "get" + StringUtils.capitalize(property);
                Method method = ReflectionUtils.findMethod(a.getClass(), getterMethodName);
                Object value_a = ReflectionUtils.invokeMethod(method, a);
                Object value_b = ReflectionUtils.invokeMethod(method, b);
                if (field.getType() == String.class) {
                    if (isCN) {
                        collator = Collator.getInstance();
                        CollationKey key1 = collator.getCollationKey(value_a.toString());
                        CollationKey key2 = collator.getCollationKey(value_b.toString());
                        if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                            ret = key2.compareTo(key1);
                        else
                            ret = key1.compareTo(key2);
                    } else {
                        if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                            ret = value_b.toString().compareTo(value_a.toString());
                        else
                            ret = value_a.toString().compareTo(value_b.toString());
                    }
                } else if (field.getType() == Integer.class || field.getType() == Long.class || field.getType() == BigDecimal.class) {
                    BigDecimal decA = new BigDecimal(value_a.toString());
                    BigDecimal decB = new BigDecimal(value_b.toString());
                    if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                        ret = decB.compareTo(decA);
                    else
                        ret = decA.compareTo(decB);
                } else if (field.getType() == Date.class) {
                    if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC))
                        ret = ((Date) value_b).compareTo((Date) value_a);
                    else
                        ret = ((Date) value_a).compareTo((Date) value_b);
                }
                return ret;
            }
        });
    }

    /**
     * 数组排序
     *
     * @param <T>
     * @param array    要排序的数组
     * @param isCN     是否按中文排序
     * @param sortType 正序 (CollectionUtil.SORT_ASC)、倒序 (CollectionUtil.SORT_DESC)
     */
    public static <T> void sortArray(T[] array, final boolean isCN, final String sortType) {
        if (sortType != null && sortType.equals(CollectionUtil.SORT_DESC)) {
            if (isCN) {
                Arrays.sort(array, Collections.reverseOrder(Collator.getInstance(java.util.Locale.CHINA)));
            } else {
                Arrays.sort(array, Collections.reverseOrder());
            }
        } else {
            if (isCN) {
                Arrays.sort(array, Collator.getInstance(java.util.Locale.CHINA));
            } else {
                Arrays.sort(array);
            }
        }
    }
}