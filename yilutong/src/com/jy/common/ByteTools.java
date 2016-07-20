package com.jy.common;

// Decompiled by Jad v1.5.7g. Copyright 2000 Pavel Kouznetsov.
// Jad home page: http://www.geocities.com/SiliconValley/Bridge/8617/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi
// Source File Name:   ByteTools.java



import java.io.IOException;
import java.io.InputStream;

public class ByteTools
{

    public ByteTools()
    {
    }

    public byte[] read(int i, InputStream in)
        throws IOException
    {
        int j;
        byte bbyte[];
        j = 0;
        bbyte = new byte[1];
        byte abyte[];
        abyte = new byte[i];
        int k;
        for(; j < i; j += k)
            if((k = in.read(abyte, j, i - j)) == -1)
                throw new IOException("Connection refused ......");

        return abyte;

    }

    public int bytetoint(byte a[])
        throws Exception
    {
        int i = 0;
        if(a.length != 4)
            throw new Exception("byte to int error:Ô½½ç");
        i = (a[0] & 0xff) << 24 | (a[1] & 0xff) << 16 | (a[2] & 0xff) << 8 | a[3] & 0xff;
        return i;

    }

    public static byte[] int32(int i)
    {
        byte bytes[] = new byte[4];
        int len = 0;
        bytes[len] = (byte)(i >>> 24 & 0xff);
        len++;
        bytes[len] = (byte)(i >>> 16 & 0xff);
        len++;
        bytes[len] = (byte)(i >>> 8 & 0xff);
        len++;
        bytes[len] = (byte)(i & 0xff);
        return bytes;
    }
}
