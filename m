Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E005CC43458
	for <kvm-riscv@archiver.kernel.org>; Tue, 30 Jun 2026 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HqD81fYEuofS8WdclNTk81x0z7tQtveso3J/43Q1uZ0=; b=CZEuWdJN0p5wvE
	uFaBxZ4HTi2a9DxwRyYeeNd7rUu6dxXzHl7pM0ydxP9QuosgIWj4aTKflZ68EAzKYzpTkU3LHbvRI
	OGlxSh1dJ1yP7kBf1XIneJFOBK841zirYI/MoqYlHDU+5nJzJ0Xg9oT4C2umbOAXdXChY0gQ2pC9G
	K9u8km70WedGoTiXDf/Na/61nMlkncyCdfV4rZoRa7D35RlKSWhQ7bAwEaFSnJDHvfCifihXu9Cj0
	TYMoap6r49C+N2IvuxO5ZidpUwVlZhXF5yJNPxD7ctV7+DcaOjPuQO5ByYT4+tNhi1vgZwQtzcmeg
	xhia1UbscBUViqZ5H0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webaz-0000000HWBC-2VNh;
	Tue, 30 Jun 2026 16:46:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1webau-0000000HWAM-3LAQ
	for kvm-riscv@lists.infradead.org;
	Tue, 30 Jun 2026 16:45:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDHEj2149120
	for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 16:45:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U3na9UkHS5H0EdRatGfrYFloO7dlcC1NaROMwvFcLHk=; b=WlcIYofd0TKj1RFi
	Zc7FOeuvtbaXqFV9DaLqiXBNIcqumqfqD4GexonA6tW3Huf28vM7ZG8fNFlHXGRM
	/npCa7edFxUWcfiDgU3Ljty3RvtQ/9txAzgk7ERROWi9mjbYBlnHxVi3JiAUbVhA
	xoGOQKy3Dk8AKfdwFb2YON7dwiQ+JIc70Xbh8vkDqqmQKaocD2PCgYZz8NLo5jiy
	BT2lvL9UTToezbIJ/nv11m7nB9c1hS66R+K4j1TVUtnrWAJUa00ZyEIcjEhYSBLi
	xTqPoJNEfotMTYYGR7IkiyyVuZ9ngBZR5YlbhfI4T3zToGCka+FT1sKo5tX6S7bX
	uTJUmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp3ks8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 16:45:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e4f27f49bso379007885a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782837954; x=1783442754; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3na9UkHS5H0EdRatGfrYFloO7dlcC1NaROMwvFcLHk=;
        b=TdF+rEhHvpUPF0ocFwbEJOeyWYxyugBTXHJmkODMuj+jGzCLh81uYSO5DpFW2026ue
         PY6dFN4WuwObNKw+to25fyabXWDMj2m8moTmnjemdgkL2qw/xkD9IDqECdFemHvOAnV+
         CxW2P857U6rpJbOd08vkn5C9RbKTjN4aJXgyrsvInKmaT7JbfWv+A++ESfkuzeznMiKP
         phtczU1fYm0vc8v4QooJpl+3joAwb+LMIadZZV43xr+SkoinJE5+qAaUdma+OO4Po8gb
         5oInW3YBE7Z9A3ORLwHgWlUhIqiCjNvF9cIHp6b2SIAddtbCEUVASRoPE3xHUC7WypF7
         yFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837954; x=1783442754;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3na9UkHS5H0EdRatGfrYFloO7dlcC1NaROMwvFcLHk=;
        b=r+dBoaw+D0esCwVTPiD3O9Z9ulJZF8JMq3jPzCcfjcfRDsesBnwWra8uDwoIaLYctM
         716I0tU3/Y5WBaigPpW1SqAz+1OyPXBULXdqUnwgobvT7SCYJi+vMVrFHInotrmBYx4h
         2C+3U9JP4tTf1lBivQyljSUG4yjG8isTxhJYhB+TOpO168AqLJPUKRK5y0xxdwBOJ18/
         8ijkPGAgZJEAIAzoouxM/exvzm8atA39xxGwkRnWzjmO5V6ozatjND27atV3p6J60ayl
         dyOSiM46bp5O2DlTeuUGDrttd7/4bDy6VyeCtJhnojNiLFhvF+GhNDBpr0ZkJSPe3FVe
         kAAg==
X-Forwarded-Encrypted: i=1; AFNElJ8K05llOZNl5obA3/F3mHp4fuH6bkW2BifWKcqM+YTfjMJywpStpVCzCuQRAIC5loehOmr4niW/dTI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0mxcLJQbCpWNhz1nTsAfza+kLwFJkJRrOLMpDhxdnPEazKoSF
	dCtFvJ2Qn+7wZu22PkeXzfqtQy/dYRCe66g6pDyl1UtCKfTvrnbWeoOa1rD9AgyF9zlVEAMW7tv
	BLr/B2MED2FaxJ0LnzXpLAvsFZRwozJj7L3vBFBtXV1nEZBjEbbR8qrTkAcBtMPftMedX
X-Gm-Gg: AfdE7cllyZ23kBCnAK3Sa7gOa9UmvlyXsJFn7MPadS8pRlnuGYK9VgGtYBpbPrtBE2C
	B2GGTl6QalnZ4nQT1oOPYSpbXePL4K/wJ2Hmz6pzq9iLs+c1I8e4GKYux+PEpnoMqiZOrh0/LYH
	3syO0eRsXvNUf4sUiNMkCFiEVztV2BwRNzKLvq/3a5NdsRmBfpm0pBClxgr4Nc8iVYUV+4JuQ6h
	ZTC9EZhTXU26mnywYt+q0M5JXHj4SejXCZiAHgvJzCE+6zIRzWe3hmsv2cROjIJaXdknasD2js6
	rDXhH0vO/SjNq/nVRyYxf2p88AP5WkHXSy6P1atnGsxwhXf/wlsggwnGKP4pmDRLK70KigQOa/P
	p6LeMzZwBcoycNDHfTmiZmd6yWtNFCgMoZjh8eO8uXZO4eOI=
X-Received: by 2002:a05:620a:2894:b0:92e:5028:dbe8 with SMTP id af79cd13be357-92e626718eemr717533985a.21.1782837954386;
        Tue, 30 Jun 2026 09:45:54 -0700 (PDT)
X-Received: by 2002:a05:620a:2894:b0:92e:5028:dbe8 with SMTP id af79cd13be357-92e626718eemr717529285a.21.1782837953875;
        Tue, 30 Jun 2026 09:45:53 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb41sm153934166b.38.2026.06.30.09.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 09:45:53 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 30 Jun 2026 18:45:51 +0200
Message-Id: <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
Subject: Re: [PATCH v2 01/16] riscv: Introduce instruction table generation
Cc: "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Nam Cao" <namcao@linutronix.de>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Conor
 Dooley" <conor@kernel.org>,
        "Paolo Bonzini" <pbonzini@redhat.com>,
        "Andrew
 Morton" <akpm@linux-foundation.org>,
        "Shuah Khan" <shuah@kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-kselftest@vger.kernel.org>
To: "Charlie Jenkins" <thecharlesjenkins@gmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
 <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
X-Proofpoint-GUID: clkYWea4fJRALoWF22L3nrn8vah3JKvL
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43f2c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=5Hg8iMh3NijzzsoxLLcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: clkYWea4fJRALoWF22L3nrn8vah3JKvL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1OCBTYWx0ZWRfX+3W3aqcz940m
 eui2nqGVmjBAmIoiRmPqP+13np42lP7jFaJF8cCtZPC5vvOWZNUL7CEZYNkuaHsmx1CHAm3IOkS
 xkJ3vyo4eUI9tvwfV6UeV97XNhmg2KIZodYHRMi+gaDWNvzJotyNyTSSopOT18JqlLSQGGO25j9
 13Nrwwi1TeYFKz6Hj67Xx/hoiy3hBqZEOKchhTPghicbZAxnhgUL6zQeT7wMNBzMw5/9YD/ZETF
 u/nyXhOcg1TJx9SRLeLpWHqwH8Eh+Ti4Qbs9J7RBu83k5tN72SJMUt6G6R9SRGN5FzceV6/UjAV
 Y/pXL1trkwR7T7wnsz4eYs+aUaDcF4DMZ2dnlnUf1LmlO5kj0zikvm+4MbnyxY+Dadui6U5Zepc
 sUe+87gjeVobp/UjS4DeznOPG8QPRpBzm20csVqmqL4t8rcUnQ43SdKPsZzyd/ugBUMGqPAP2q8
 Hf7doPdWCFo4GAn2Eow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1OCBTYWx0ZWRfX+cAeTWj5Pc7Z
 67weTj5yzRxdr1J+KrbywR2UJUc0qUr75a4elarLYnAXVceU9T1RYNoEySXw3zAFDqjzk9Wua//
 hrjFqpsGc9hcuChMQ0GFwkDwitJLv3c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_094556_832619_EDE99B8F 
X-CRM114-Status: GOOD (  17.07  )
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

2026-06-21T21:01:19-07:00, Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> Eliminate the need to hand-write riscv instructions by using a shell
> script to autogenerate a header from an instruction table. This is modeled
> after the syscall table infrastructure.
>
> The table is generated externally by riscv-unified-db [1], but is
> in a simple format to make it possible to use other tools or modify
> manually.
>
> [1] https://github.com/riscv-software-src/riscv-unified-db
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> ---
> diff --git a/arch/riscv/tools/insn.tbl b/arch/riscv/tools/insn.tbl
> @@ -0,0 +1,1392 @@
> +# SPDX-License-Identifier: BSD-3-Clause-Clear
> +#
> +# GENERATED WITH https://github.com/riscv-software-src/riscv-unified-db
> +# "./bin/generate inst-table -o test_table.txt"

I checked out the repo, ran the command, and got a different table:

> +andn common 0100000<25|111<12|0110011<0 xs2=24-20 xs1=19-15 xd=11-7
   andn common 0100000<31|111<14|0110011<7 xs2=24-20 xs1=19-15 xd=11-7

I assume there were some recent changes in the output format...

I think it would be nice to use their latest format and also note the
UDB commit that was used, so it's easier to reproduce our file.
Hopefully there won't be breaking changes too often. :)

Thanks.

---
Sashiko seems to have noticed a plenty of other issues, so I didn't
review more...

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
