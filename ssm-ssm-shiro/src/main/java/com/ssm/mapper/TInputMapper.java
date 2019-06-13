package com.ssm.mapper;

import com.ssm.pojo.TInput;
import com.ssm.pojo.TInputExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TInputMapper {
    int countByExample(TInputExample example);

    int deleteByExample(TInputExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TInput record);

    int insertSelective(TInput record);

    List<TInput> selectByExample(TInputExample example);

    TInput selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TInput record, @Param("example") TInputExample example);

    int updateByExample(@Param("record") TInput record, @Param("example") TInputExample example);

    int updateByPrimaryKeySelective(TInput record);

    int updateByPrimaryKey(TInput record);
}