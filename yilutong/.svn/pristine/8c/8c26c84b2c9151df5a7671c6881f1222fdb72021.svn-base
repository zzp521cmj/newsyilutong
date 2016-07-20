/**
 *
 * <p>Title:ʵ���ַ�ļ��ܡ����� </p>
 *
 * <p>Description: </p>
 *
 * <p>Copyright: Copyright (c) 2006</p>
 *
 * <p>Company: ɽ�����ͨ����Ƽ����޹�˾</p>
 *
 * @author Administrator
 * @version 1.0 [2007-4-9]
 *
 */
package com.jy.common;
public class Encrypt {

    private int KEYS[] = new int[256]; //�����ֵ�
    private int unKEYS[] = new int[256];//�����ֵ�

    public Encrypt() {
        //��ʼ�� ���ܡ������ֵ�

        KEYS = new int[]{82, 138, 69, 34, 18, 173, 213, 160, 236, 49, 211, 246, 9, 63, 23, 28, 90, 21, 174,
                    123, 241, 243, 127, 216, 38, 142, 171, 39, 54, 228, 156, 149, 130, 59, 93, 217, 125, 167, 100, 157,
                    6, 12, 144, 230, 44, 29, 108, 182, 57, 146, 196, 140, 148, 87, 226, 170, 111, 248, 155, 27, 207, 71,
                    115, 92, 165, 229, 78, 198, 193, 105, 79, 201, 77, 80, 200, 224, 53, 194, 242, 154, 212, 152, 205,
                    128, 19, 252, 56, 176, 249, 37, 110, 4, 85, 72, 255, 199, 50, 48, 143, 245, 162, 113, 177, 231, 117,
                    253, 132, 52, 172, 1, 2, 187, 3, 158, 219, 135, 76, 239, 175, 139, 5, 47, 235, 84, 16, 210, 184, 221,
                    114, 109, 185, 124, 73, 91, 81, 40, 151, 150, 147, 101, 136, 209, 119, 51, 61, 67, 202, 118, 25, 86,
                    116, 45, 129, 190, 74, 24, 89, 55, 195, 250, 133, 10, 192, 104, 62, 98, 178, 13, 183, 203, 64, 30,
                    112, 88, 238, 58, 166, 36, 11, 220, 222, 17, 218, 206, 169, 214, 234, 161, 83, 141, 232, 99, 188, 8,
                    22, 107, 102, 60, 164, 208, 227, 134, 186, 215, 42, 66, 225, 15, 244, 41, 153, 223, 33, 7, 32, 14,
                    106, 251, 237, 70, 75, 97, 43, 95, 180, 233, 94, 0, 121, 26, 163, 181, 65, 120, 240, 159, 137, 20,
                    197, 145, 247, 35, 254, 68, 204, 31, 179, 131, 103, 46, 189, 96, 126, 191, 122, 168};


        for (int i = 0; i < 256; i++) {
            unKEYS[KEYS[i]] = i;
        }

    }

    /**
     * �����ַ�
     * @param srcStr
     * @return
     */
    public String Decode(String srcStr) {
        //����base64��ԭ�ֽ�����
        byte[] srcByte;
        byte[] resultByte;
        String resultStr = null;
        try {
            srcByte = Base64.decode(srcStr.getBytes());
            resultByte = new byte[srcByte.length];

            //����ֽڽ���
            for (int i = 0; i < srcByte.length; i++) {
                int b = srcByte[i] < 0 ? 256 + srcByte[i] : srcByte[i];

                resultByte[i] = intToByte(unKEYS[b]);
                //  System.out.println(i + "->" + b + "->" + intToByte(KEYS[b]));
            }

            //�ؽ��ַ�
            resultStr = new String(resultByte);
        } catch (Exception e) {
            return null;
        }

        return resultStr;
    }

    /**
     * �����ַ�
     * @param srcStr
     * @return
     */
    public String Encode(String srcStr) {
        byte[] srcByte;
        byte[] resultByte;
        if (srcStr == null) {
            return null;
        }

        srcByte = srcStr.getBytes();

        int count = srcByte.length;

        //�������ֽ����鳤��
        resultByte = new byte[count];

        //  System.out.println("���γ��ȣ�" + count);

        //����ֽڵļ���
        for (int i = 0; i < count; i++) {
            int b = srcByte[i] < 0 ? 256 + srcByte[i] : srcByte[i];

            resultByte[i] = intToByte(KEYS[b]);

            // System.out.println(i + "->" + b + "->" + intToByte(KEYS[b]));
        }

        //�Ѽ��ܺ���ֽ����飬����ΪBase64�ַ�

        return new String(Base64.encode(resultByte));
    }

    /**
     * ����ת��Ϊ�ֽ�
     * @param I 0��255��Χ
     * @return
     */
    private byte intToByte(int I) {
        if (I < 0 || I > 255) {
            return 0;
        }
        try {
            return Byte.parseByte(String.valueOf(I >= 128 ? I - 256 : I));
        } catch (NumberFormatException nfe) {
            // nfe.printStackTrace();
/*            System.out.println("Integer number is " + I);
*/            return 0;
        }
    }

    /**
     * @param args
     */
    public static void main(String[] args) {
        // TODO �Զ���ɷ������
        Encrypt encrypt = new Encrypt();
        String str = null;
        str = "<?xml version=\"1.0\" encoding=\"GB2312\" ?> \r\n";
        str += "<resp>\r\n";
        str += "<result_id>1</result_id>\r\n";
        str += "<result>�����ʽ����</result>\r\n";
        str += "</resp>\r\n";
        String str2 = null;
        //   str2 = MakeXml.errorXml("1","�����ʽ����");
/*        System.out.println(str.equals(str));
        System.out.println(encrypt.Encode(str2));
        System.out.println(encrypt.Decode("z1wFAayCr3Hbh/27Akddkmw5XYJxAvW7ov0C50ddyU7EjJLEXYJccz/Tz9txhwNzP9PP23GH76xMx/2ic5LPtttxh++sTMf9onM/08/bcYfvrExz0J/QRKkjuo3eFOFEaArPtttxh++sTHM/08+223GHA3M/0w=="));
*/    }
}
