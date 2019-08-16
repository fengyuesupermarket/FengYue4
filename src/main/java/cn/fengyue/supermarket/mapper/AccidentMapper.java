package cn.fengyue.supermarket.mapper;

import cn.fengyue.supermarket.po.Accident;
import cn.fengyue.supermarket.po.AccidentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccidentMapper {
    long countByExample(AccidentExample example);

    int deleteByExample(AccidentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Accident record);

    int insertSelective(Accident record);

    List<Accident> selectByExample(AccidentExample example);

    Accident selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Accident record, @Param("example") AccidentExample example);

    int updateByExample(@Param("record") Accident record, @Param("example") AccidentExample example);

    int updateByPrimaryKeySelective(Accident record);

    int updateByPrimaryKey(Accident record);
}