package com.neuedu.service;

import java.util.List;

import com.neuedu.entity.User;
import com.neuedu.vo.OrderPage;
import com.neuedu.vo.UserPage;

public interface UserService {
	// �û�ע��
	boolean addUser(User user);

	// ����usernumber�����û�---ע��
	boolean checkUsernumber(User user);

	// �����û����������������û�---��¼
	User login(User user);

	// �����û���Ϣ
	boolean updateUser(User olduser, User newuser);

	// ����ɹ������
	boolean updateUser(User user, int price);

	// ��ҳ�����û�
	UserPage getUserPage(int currentPage, int pageSize);

	// ����Userid�����û�
	User findUser(int userid);
	
	OrderPage findOrderList(int currentPage, int pageSize, int userid);
}
