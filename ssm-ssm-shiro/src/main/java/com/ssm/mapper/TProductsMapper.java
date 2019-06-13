package com.ssm.mapper;

import com.ssm.pojo.TProducts;
import com.ssm.pojo.TProductsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TProductsMapper {
    int countByExample(TProductsExample example);

    int deleteByExample(TProductsExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TProducts record);

    int insertSelective(TProducts record);

    List<TProducts> selectByExample(TProductsExample example);

    TProducts selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TProducts record, @Param("example") TProductsExample example);

    int updateByExample(@Param("record") TProducts record, @Param("example") TProductsExample example);

    int updateByPrimaryKeySelective(TProducts record);

    int updateByPrimaryKey(TProducts record);
}