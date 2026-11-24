Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C1606A326
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ksu0RL0p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fhiEINlL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mw1QJSMP;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6WUQxe5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qXagVpzPGpxiLIglytM/1u/rBXxy2YrTFQR/epbV6TE=; b=Ksu0RL0pOETOSGP6d1wDDEgUqY
	9uKNZFV20RRl/jie6gx72JUFv9tnjK9glPFA3SN8Ms/zaLnqykaM7H/yPdWVrQdLT/9AfnQzYUkD1
	8TfhfEfh2op0BlkKMIIEV4c0RrwgI5T82wJ0/4km8d4eXK7rHG5uBLb1/jDQMGiQyyFVh/fh1Xt85
	pBf9CTsaUHgqZ0NiOtajrL7FMpbGCwSt7US5iIpPj1lmg51hPefJ0GhpdGAiUwC+YasOhJRgTffQJ
	atznnuTexEmuLN07AhGPv215o8q1ZSsBmTpe1b6/VQ0kd8gbY8pCrbd6V4lhIbrLfuFbRwUubGRqy
	RSezzXAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt3q-000000073f8-1z4t;
	Tue, 24 Nov 2026 16:08:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt3o-000000073em-23Zj
	for kvm-riscv@bombadil.infradead.org;
	Tue, 24 Nov 2026 16:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:To:From:Subject
	:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=; b=fhiEINlL5DJqN8mOdg9QyIai9Z
	Io3IlO+1WBw5cwnasL5SyICMJompJ/wTib/a6u0P9LURswONtzrDrvkevX5ogMWHNNu3zwYXkORae
	kO/H7Q8gYvpUGNFZc/94LZ73sIjx43+KLqOZCO7EGVghImjnlaXvY1uqK9tai457DiLVkqK6Fgm61
	DSE5cCXuRHfYGY3nRud/Z25zx3ObikzMV89qAe1yFhgzo2zq9eU1ZP6dZ9D2XgfPrxuXt3U91Wl33
	uv4iwsyROVU+OS9J1UPO0mO25IS4n+FxPQ8U+lOWIXPsCAGHNdKWC4RgP+zX+mxt7AmIesILH25tG
	S8QKC7yA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVt1l-00000004Jnf-3iIz
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 16:07:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFL3ks700045
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 16:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=; b=mw1QJSMPkzhPdgAC
	WXDML3CeNT+ar8JzKKkJz0EtokbT34gjv1QpDPAmWC0z/LP28nDQu8/S/B6f/jlC
	K2mxkL+tJiiSwcTyE11oqRhZLBjzB9n3v4j1CPCjjQ9QE8n7hrqZ7FvAzzGeFEAi
	uZWq3dk3dOAO0k8LxWq5vV6DsxA2CjAtzff9lKiz3db5NFlwEw/7Yf94JcSFaOO3
	GJUY9bCCL3Hb7GYmrmLFiIH7xD2VEePYOI9rpgcvardFC+OU/TLvQtdmwu0ZlFN9
	cx9lbDw8+YmZd3Vj23E/tsuFR0MMQQXbld4j8cp+rMzJR6qcdwS7vVrss8ZMIhOb
	z18Jmg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f41aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 16:05:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f052777c7cso45622085ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 08:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536345; x=1796141145; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
        b=f6WUQxe5m4WF/Z9G889kKNWXaOwmgQY2liX8KVqGx6rH2rs3rLowJE6OaIhsXTn5bx
         OVZD9s/vKUllXGrmGzhWPxzTRWuDS1oS/N5OF5V+0QxFGx1v+RifC3Rw3aqqYr/u6DsW
         GFhFQYps33ovZp9acX1YQwJo4UhYtTF3ZQdSLUIaLydXpwZPTI/q4JPr5WCqGBJwE3ys
         yow+2Z0n6JHRkeqDI0HLVFuqQ3/daI+eo7pEh+LyXSrx5eqiVLx+quCuYa9c0f3FxOgW
         YWLMdBQGxdu+vudvi0aKxmY0qSbT/TaipZWFRfJuz12K6cO2j/T9ZRdB2vDescL0uM9T
         e9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536345; x=1796141145;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVV/DiQS9aUfxWsfiGy1Q/fbEqtV4Kq+84dgYbtXPGA=;
        b=hki3y+BcD02ir9zlkqzcQVz/dfd1H6xSeKkZbtjory2NBJBJ3sbbQENK7/dPg+hRct
         JvCQbK24OAlSta94PkIq4p3muyDjrBlupWyqhEqRqeBnNczWh5myaXOZ40aF4h/tBll/
         Es755JDPqWLGAJ0kuADNYaFrJtncpyN4vvye85olDKDPGRC7k2NXQxajqPL/h0X2YYa4
         smdFJpWAc6CuoUng44MpwYEDUT7n9ihPrJkVRuBQfA7KOAiH0IRfGfbIyQNaTnS8abar
         CF06V+I3XlspPkSkeowvFeJsLuaaeb4cUBCmSfI69HF7UkJUkq9yE/bttHBe7g1PhIPd
         yILg==
X-Forwarded-Encrypted: i=1; AL+hErE9ZnjB0K+IUNIkXBChvLm3pYnPM4CsZyMjwFJro00aU/UzArP1JqLErq6ryWZKvygtICy0I215Zdw=@lists.infradead.org
X-Gm-Message-State: APuU4Z+hRDX4TZMmlSp89liVPsnRskupSfZgEmWSwfJCzaDEL3vfnOHl
	dUhCiqRzrlyr8yeH4i/2EyBzVCdjoV2yhB7AaFCQ9zc9EbVXDqo0VWZj2M+hKw1gpW3RED8vNAe
	3ukdmfQvA4Mw2tM9APAbBv/E0BGi3uh40q+d7VmSQ5NcL2fxcpzcW+wtmg2TADVkOdQ+q
X-Gm-Gg: AZFdTZeS54sv6ZTyZiKlwlKyjWIXF638cvDQ2LLbd5hdyaHt10YxvKZXpTTsM9qG4lq
	59HX4dOZ8VbtB84P+Z6vGboDFBGvZ+guFPQbHDWNJon/Q+agjWKIntCzX42AS6Y6iKMfXA4zL/q
	g7aLy8Ac1Q5tb4J8pbEnive1X3Wr/MAQesXESOVs4Gn7Omo4dak9Ql4oaFG0DoOxuM1uZZRgLUM
	A92LNhy1SyG5hlG70FzpEeMvArzsENsa0uWC1sN2vT74slGuSZ/zFlNmVQce87oJMhhBe3rNiGX
	jxiXMLkXHF5YZi/Ppl5mtXZLU7CL1OhMRCteK7Ms3t3jd/E+bjR7dyC0ChPoByG568+sQDFbSRw
	49+DFimQsMFwhORjE5Ttlt2IrQuc5/DKlO0P5He932J7btitwEL4bTw==
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr14552651a91.61.1795536344430;
        Tue, 24 Nov 2026 08:05:44 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr14552613a91.61.1795536343930;
        Tue, 24 Nov 2026 08:05:43 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm23275610a91.11.2026.11.24.08.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 08:05:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 25 Nov 2026 00:05:28 +0800
Message-Id: <DN3KIA4URDQ5.2MNEHHDE6WLAJ@oss.qualcomm.com>
Cc: "Atish Patra" <atish.patra@linux.dev>, "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <majiuyue@bosc.ac.cn>, <anzoso@outlook.com>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: Flush VS-stage TLB before reusing a host
 CPU
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "BillXiang" <xiangwencheng@lanxincomputing.com>,
        "guoyaxing"
 <guoyaxing@bosc.ac.cn>,
        "Anup Patel" <anup@brainfault.org>
X-Mailer: aerc 0.22.0.r49.g9313f0f0
References: <20260817102447.40259-1-guoyaxing@bosc.ac.cn>
 <CAAhSdy2qwdHE7SB2gRK3_PQ6m_bMSfWpvcuSG-31W2yd3-UTKg@mail.gmail.com>
 <285419e5-c4fc-4c75-a765-436165bdc8b9@bosc.ac.cn>
 <CAAhSdy1Q7a+54qn0xNBQBd1eV2ve+Nzqz9uRsWrGSmTn35z8=A@mail.gmail.com>
 <c050c85c-482a-4351-b627-ac074f7f7952@bosc.ac.cn>
 <bddcd13b-b97d-4c24-8f08-e0a239065e68@lanxincomputing.com>
In-Reply-To: <bddcd13b-b97d-4c24-8f08-e0a239065e68@lanxincomputing.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfXxMXLwjpGW+m3
 cOvjs8IPkDVqIVdyeQcFkMXqRTpf0XSH4CXOCBf9+BITyWdFQEhDIWJ6vk/XCxXFUVQBxHH8gLR
 0Gz+nme72pJrIYNMbTceqLRDT8hd+Io=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05b5d9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=4BKX8IsyAAAA:8 a=EUspDBNiAAAA:8
 a=M4cLWJfQvEUUaw9dnqQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=bflBWynC2lygM3eL1Mvi:22
X-Proofpoint-GUID: LhTTseQ57BIt0kNBN-gcxc9nWI01M1t9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MyBTYWx0ZWRfX1qkB2LuU/US0
 RqmpIIo/nL3hLSWQEmeX8av3uWHTsFAbgcnm2ab51MelaYGw1tN12P4twaxts6sihGeOCqIzn+H
 d/3VaMoPkhpKc/1xBMW1lug4elbcALCrFrI+/+quleSipXhnxbWBI4VrBx72L6EtcdsfM9F/Jgv
 kY7nCh0semc9KB4N8j5GY3AVH422B/sbl6k0EnqJq/9vBWWudP2C4n7ATjIm1dJAh6V/2fdNxfZ
 1TgvEKGWHQAEq1YSaj2kFFARmewXutD7Burcm713onM2696DKKWdmXig42u7T0NAz16dBPi03mu
 B4x015VLDBT1tHCNrKt+a+PTQS2HrsQ5dDU1XCCrK2bfVOFT6E9B0/zVzEFUP2uvb9G/j5/IxZK
 sY73iLIu0q0v+DB1NKGuluu/Uu7Z6hVhKKlwm4a8VitQlj2XnYeA3bkkOaUt7sDWzr52o/R4xo6
 He+CBqGBV/jrihAQGyg==
X-Proofpoint-ORIG-GUID: LhTTseQ57BIt0kNBN-gcxc9nWI01M1t9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160556_053389_B1E4241E 
X-CRM114-Status: GOOD (  19.05  )
X-Spam-Note: SpamAssassin invocation failed
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed Oct 21, 2026 at 5:32 PM CST, BillXiang wrote:
> On 10/10/2026 5:06 PM, guoyaxing wrote:
>> 

[ ... ]

>> In other words, I am not sure this case is covered by a full guest TLB 
>> flush to all VCPUs on the mapping update. Guest shootdown looks 
>> mm_cpumask-based, and host pCPU migration of a vCPU does not by itself 
>> add other vCPUs that never ran the mm into that mask.
>> 
>> The earlier RFC note has a bit more detail on the flow we observed:
>> https://lore.kernel.org/kvm/0d15b098-b8f7-4080-9f33- 
>> e8c49c2331e1@bosc.ac.cn/
>> 
>> Please let me know if I misunderstood the intended invalidation path here.
>> 
>> Thanks,
>> Yaxing
>> 
>
> Hi Yaxing,
>
> Thanks for your work. To help review and validate this patch, I am 
> sharing the two programs below, which were generated with the help of an 
> AI assistant. I reviewed the code and ran it on my test system: without 
> this patch the reproducer triggers the stale VS-stage TLB entry, and 
> with the patch applied it no longer does.
>

[ ... ]

> --- 8< --- end --- 8< ---
>
> Tested-by: BillXiang <xiangwencheng@lanxincomputing.com>
>

Thanks Bill.

I reproduced the same failure on SpacemiT K3 and V100, adapted from your
reproducer: the guest side drives the same four phases over the console
instead of TCP, so it also runs from an initramfs on a bare board.

  Platform      | Host kernel                | Iters | Hits
  --------------+----------------------------+-------+----------
  SpacemiT K3   | v7.4-rc1, unpatched        |  19   | 15
  SpacemiT K3   | v7.4-rc1 + fix             |  20   |  0
  SpacemiT v100 | Ubuntu 7.0.0-30, untouched |  42   | 36 (86%)

Code and notes:
https://github.com/Sutter099/llscripts/tree/main/work/vstlb-repro

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
