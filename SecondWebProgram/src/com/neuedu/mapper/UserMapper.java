package com.neuedu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.neuedu.entity.Orderdetail;
import com.neuedu.entity.User;

public interface UserMapper {
	// �û�ע��
	int insertUser(User user);
	
	// �����û����������������û�---��¼
	List<User> findUser(User user);

	
	/*// ����usernumber�����û�---ע��
	User checkUsernumber(String usernumber);*/

	// ����Userid�����û�
	User findUser(int userid);


	/*// �����û���Ϣ
	boolean updateUser(@Param("olduser")User olduser, User newuser);

	// ����ɹ������
	boolean updateUser(User user, int price);

	// ��ҳ�鿴�����û�
	List<User> findUserList(int currentPage, int pageSize);

	int findTotalCount();

	// ��ҳ�鿴�û����ж���
	List<Orderdetail> findOrderList(int currentPage, int pageSize, int userid);

	int findTotalCount(int userid);*/
}
