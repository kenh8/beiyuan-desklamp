package com.beiyuan.credit.common;

import com.alibaba.fastjson.JSON;

import com.beiyuan.base.mybatis.page.Page;
import com.beiyuan.base.service.BaseCrudService;
import com.beiyuan.base.util.serializer.ObjectUtils;
import com.beiyuan.common.api.PageDto;
import org.apache.commons.lang3.StringUtils;

import java.util.List;

/**
 * Created by leo on 2017/12/6.
 * api接口通用方法 封装
 */
public class WrapperApiService {

    /**
     * 通用分页 转换方法 封装
     * @param page
     * @param params
     * @param inter
     * @param clz
     * @param <D> DTO对象
     * @param <S> 数据库实例 对象
     * @param <I> 对应接口实例
     * @return
     */
    public static <D,S,I extends BaseCrudService<S>> PageDto<D> findByPage(PageDto<D> page, D params, I inter, Class<D> clz){
       return  findByPage( page, params, inter, clz,null,null);
        /*Page _page= ObjectUtils.copyObject(page,Page.class);
        inter.findByPage(_page,ObjectUtils.changeToMap(params));
        List<S> list=_page.getRecords();
        page=ObjectUtils.copyObject(_page,PageDto.class);
        page.setRecords(ObjectUtils.copyListObject(list,clz));
        return page;*/
    }



    /**
     * 通用分页 转换方法 封装
     * @param page
     * @param params
     * @param inter
     * @param clz
     * @param <D> DTO对象
     * @param <S> 数据库实例 对象
     * @param <I> 对应接口实例
     * @return
     */
    public static <D,S,I extends BaseCrudService<S>> PageDto<D> findByPage(PageDto<D> page, D params, I inter,
                                                                           Class<D> clz,String orderByField,String orderBy){
        Page _page= ObjectUtils.copyObject(page,Page.class);
        if(!StringUtils.isBlank(orderByField)){
            if(StringUtils.isBlank(orderBy)){
                orderBy="ASC";
            }
            inter.findByPage(_page,orderByField,orderBy,ObjectUtils.changeToMap(params));

        }else {
            inter.findByPage(_page,ObjectUtils.changeToMap(params));
        }

        List<S> list=_page.getRecords();
        page=ObjectUtils.copyObject(_page,PageDto.class);
        page.setRecords(ObjectUtils.copyListObject(list,clz));
        return page;
    }
}
