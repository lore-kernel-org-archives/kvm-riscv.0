Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E22CD4F54
	for <kvm-riscv@archiver.kernel.org>; Wed, 27 May 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMkm2x0WFnpUU8lYuPaoFmXvjpvBS9YUgvS2vfKxt0k=; b=exHSLFCL/0EMtt
	86dotXIDzm/yb2wSuKmtjfbztOCMCf6A4oTzbEq4nLTPlm5atremCeHzn8N3AegermxdH+qyOg3kc
	jboxPxUVZtv7+1IF58zQMizV9NyPNLYvYARgdIy3JaJYFeNka3CRkdXBKgcAFvglNwZOcbkg6/nKQ
	i0IiXVtkLJ2IfjTQJF+EnAYqTI+ICgpnzuWDjRKH5+y5dPwdtFuiI9ApaOWHzIg+vpqi983Y+iLlD
	I/CYxYM1s43obUafJjBcxvS/gSL6LlM4EOadz4wx2Iy+PHKvRcNUJyCuYtOhoEx2T2uhWRViQ1P0w
	TpD/fiFul8gDGsEernfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGRe-00000004R1f-2J9O;
	Wed, 27 May 2026 15:45:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGRb-00000004R0o-3slc
	for kvm-riscv@lists.infradead.org;
	Wed, 27 May 2026 15:45:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RAWex7150282
	for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/CAOuwABW/NK0zT7PazBOrFx
	nm1aaFtR/UaMUOazE7M=; b=f+rfGcjE/MvH8t9xNntcx8C7P7IfG8DTuuzgOCkH
	I03Q5Zuf9XBmluzJN21mXjtcHKeV4X/vCJ4vtrVNrWGyM4cRmgh9TaiCWe8k12wo
	Nd5MgZXlVqSNdPFv4JsuNagnvvFVzQ/E/rvrUi4DBIjTmxcypxpNYzh58HzrBIYM
	fmEOpQLZrSu539xc6h04TM3o1gCIynTdm9VIDMhsVF+IDHUKfSGyI742Cz/NuXdn
	35oMa9wu0ZiBanVUadE7rybAeSH11Zk0syW1sSSnqG4nnn5YJ4MI2lOrQN+kJysD
	9ly/U640HIBbNkuJK5lHjNMZs5hcVZAIZO+Xx9ikyEEp6g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxxvs6ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 15:45:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ee1da7a13fso13444238eec.1
        for <kvm-riscv@lists.infradead.org>; Wed, 27 May 2026 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779896719; x=1780501519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=BrjIOCxa861mrZsPfAVSs3rPrmsKEd5QJ0uqKcEYwFMIB5XHiFg4rZA2UuY1xIg0My
         RWS9psVH7Gs8PwA3kowqYa/72ojewe4Mu/JlCkJRqDKwOInShXlCM1FsGMWw4jTcQla3
         t/UO+0EqtGx9ClyvHwXgwQojZ1AyTDaOXSQIIIlSODeYViQsQHsww8cRrheF/gwJE/yb
         KQkSd+guCIkqMUYm2X0IMIYg4Nc0QEEbs3fQ0pQVF57VwOasDLyL+pAVVpMsoWoF5MNF
         HCFbKrcR1qFfo4LONfUy/tHvNy2FI4W3vlHYYEROMN4DnSppyG7eAe8drTdOIiJrl3/R
         MfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779896719; x=1780501519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CAOuwABW/NK0zT7PazBOrFxnm1aaFtR/UaMUOazE7M=;
        b=kcKh04/UoWrEo65pycbBjCwYvQxnhdYA/OONerSoZo+RUrWGErWsUIivEdhzGmnijU
         Eks/ABN0lAKr2ue9i8m8DesTvGnKVlF+LReCBfpM7TZnOOBnbzRYILN6DYhKe5cVBfjU
         4khwK9IVEIaUgTLP6djrO9rnGOyZwwjnXZr9YklweOUSlHVRDg4ImO/I5nJYCVvHY+MJ
         0PZ+xNVnuXSSXsCw1qhSa5NMnb/ukbFKMWpyHQ3S88EaKfDdDfqZsjOFSJ0mdzJPK96P
         /ocV8T+Udc6oDXRBmFCwfiFflAr96IHIvqPXTB6jRuHCvVBgLf2k9E3AK4b6BYVs2CTS
         rPlA==
X-Forwarded-Encrypted: i=1; AFNElJ+OK9NZT6gHun38tCbqOrT0JeDGSWXacuL/lHIU4EkgkpZWMzYB51USwNWzJ1dCVjEMzFouDHXDL/k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsfHlKd8fDsu3bkm5M7Dt24bEOU1kva8Lc7wSl+bH4PNYTs3cd
	VwdtEHw4oi7Kb0f5BOb909cxBwSjuMhTrmJADbpufkV31WxFZ3pVLWCAx+M+qicXlFz49J8ogia
	dVMdwTbuamqC5Z7BlMj6qj3KoXO648wsEdnFeOPBVqSXDVWuaF3ZNxLd+WkKLGeTyuq3k
X-Gm-Gg: Acq92OGtGvY/Rxgf+tSFtoFO7Qm4QNO9dF58PzWrRn0f5+lO+hRMHp22+KtiUrdoR1X
	QF314QHsZxSCJIB14RXNzxe83jh2alR8MgkNkHGypkyeS+SCm1rMWiMf8WjuxKzDUTktbITtwOu
	MKsTCL5xR5y/vGA118YisB3YMmjXkZxwoKnYc5eX3r7JMI3j6324fvz0YR3cN5RlBZ2EVCDBUNZ
	FNCT3EtKVVKYCzacewj+AJ8jGOLCx9vwPlnc/iL5YYpyPocl/X1Pqc4hQnw0GdtdQAhyimsxfk5
	ugQXHsVz62qsX+Czl4/eJi6SB+dCOvdYCjIFfDjJXWZZXDOMz/PYaB+873T9eZILa53N0QHM+EQ
	dLvnlD7jHn+Tf5akh2NqV/yoJ2GkyHuM=
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987645eec.14.1779896717852;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
X-Received: by 2002:a05:693c:65c7:b0:304:562c:2338 with SMTP id 5a478bee46e88-304562c3085mr5987616eec.14.1779896717248;
        Wed, 27 May 2026 08:45:17 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451ef4af0sm13044572eec.3.2026.05.27.08.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:45:16 -0700 (PDT)
Date: Wed, 27 May 2026 10:45:15 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 02/10] riscv: hwprobe.rst: Replace tabs with spaces
Message-ID: <4otlnil7qj53dzlbvu2wd3gvzzgs5cszo3merkcb2qbbiudw5n@4i2k47coybf4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-2-21c5a544f1dc@riscstar.com>
X-Proofpoint-ORIG-GUID: tW11nv9eqndnRQ4-yawcTpbyXPC5SYMN
X-Authority-Analysis: v=2.4 cv=bJAm5v+Z c=1 sm=1 tr=0 ts=6a17118f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=p7TuRdreTiM3c_8AigcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1NyBTYWx0ZWRfX5MK3xLh2xpxo
 kYvBv6Iu8cNi4oz4YoLWYNsSNYR9Q/uu2VlNJXTQp7s7Wss0kmWXykXYGWIPOZrnFf4GT2Odf8U
 gPk0UMIlYUyvv31nEpgAI8Jijuys1g1pFY0ZuWWLmL9qmXu5j9WxExCQ8SnoIyqHXTvljc8Nnx9
 wcaxHMF0yjcgNPVIW7vFhCbmN1goggScXkuOlWGyrGLBHoTDouzy9N4DRFQ7k9G3WdQArlW7v53
 g/AA65gkpnRqVeYP/Sc+9Tu5piI0nmxHoIYVr9Bncb0QZY41E3IDhAl3z8DYEtrZRr/nFC7I8ZX
 rBmg2/L5+8hQPrGHcl4LYdy9ZDeZP3bHPTsQF0B5faymfmmaxOyh+3uRjuUlfQCo86ZPt7XZYMn
 yjfiW9fYnYDsnxPdAeM04bJXPpPKp1fSz4xZDLF+X9KJcq5FFn5HpgIFW/N+fmvKz1DbEHDeh1D
 OPSQKqh4V2Hjtf8y38w==
X-Proofpoint-GUID: tW11nv9eqndnRQ4-yawcTpbyXPC5SYMN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_084519_965300_8A003B7A 
X-CRM114-Status: GOOD (  17.38  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2026 at 09:34:47PM -0400, Guodong Xu wrote:
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> A handful of vendor-extension entries indent continuation lines with a
> tab character, while the rest of hwprobe.rst uses spaces. Replace
> those tabs with spaces so the file is consistently space-indented.
> 
> Cosmetic update, no functional change.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v2: No change.
> ---
>  Documentation/arch/riscv/hwprobe.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

We could just move this patch to the beginning of the series and also use
it to make all indentation consistent in order to fix the consistency
issue I pointed out in the last patch.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
