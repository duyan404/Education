//ʯ�͸� 202104061004
#include<stdio.h>
# define N 100	
int main()
{
    //��������; 
	int n,i,j;double l[N],l1[N],l2[N],x,f=1.0,y=0 ,x1[N],y1[N];
	printf("������֪���ݶ�����"); 
	scanf("%d",&n); 
	printf("����x�������Ӧ��y��");
	for(i=0;i<n;i++)
	{  
		//����n��x��yֵ 
		scanf("%lf",&x1[i]);
		scanf("%lf",&y1[i]);
		//�����ݽ��и���ֵ 
		l1[i]=1;
		l2[i]=1;
	}
	printf("���������֪��x����y��") ;//�������ݶ�
	scanf("%lf",&x);
	//����ֵ
	//����l(x)�ķ��ӷ�ĸ���� 
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			l1[i]=1.0*l1[i]*(x-x1[j]);//���ӹ���
			if(i!=j)
			  {
			   l2[i]=1.0*l2[i]*(x1[i]-x1[j]);//��ĸ����
			  }
		}
		l1[i]=1.0*l1[i]/(x-x1[i]);
		l[i]=1.0*l1[i]/l2[i];	
    }
    //����õ�y; 
    for(i=0;i<n;i++)
    {
    	y=y+l[i]*y1[i];
	}
	printf("%lf",y);
	return 0;
}