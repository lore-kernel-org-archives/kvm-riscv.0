Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B665B105F7AE
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 14:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXeKwUunUlOGDsXDjLG7zl4oqfOvRMXa2M3p7Ka+C9A=; b=LLHZt3AhJUPD7m
	jJP5nKrg6EvY4BqN5eX+A8rV7f3p1tEezZ60+swM1Oyl5IYRYXLjoWdeNX2Y3Tec83HWs1P9j9Sgc
	G4kKv8OSE90X0dmKbz8RYJ58SQdqVPBat16oMyxIcW5SvBSpadTlXYNmxRHyyv+N19wNu2NArPpVB
	/YPdN+QmnmUlXq+j2UwC3iLCc3qBwHYyph8l026Rhselli3V8Gkf4YmSV8eQpNWtAIYYSiX1j2jGj
	GBu0/cTZh5/RPb1O/OXbNGAel2teSNmKAzhoYdilvbXuj5WyflgHd+ZSL4f/srba/JMLU/6XJNUg8
	yVngGrQg3OPN9puj4y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13PF-00000000NcX-1j7W;
	Fri, 13 Mar 2026 14:22:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w13PC-00000000NaD-09wv
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 14:22:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DA8BTj1749668
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=; b=csiaSIRJZfSYLPYA
	OrDIRC1jhNz96DNbH4FgjgNtXEk06/yjZyfbyDL8yH+010LGfAbN/1SJ3/Po24YE
	HHlDtbCDvHuxPyoZitbxXcFzqaEzrCFwcNcf3oJGiS4HNZaZC95RC/CVRzgSSrxL
	n+e3yegRuYAVPYp6fvqm4RDOmCoDhdhByr8kx2p9eOBCYHzb/sQhogV42oFLU8z3
	W60tQTewvGrjRV+dmK0/cKLFk8fGCQr2uWD39SmQM3gXripaRMy6ucknAoHYm6CQ
	2UaZksqdljY5jERkLaXws6E57GU7ooZqzWtRe5wlcCO4Uy/dLoO1eWCrs3RAWtxg
	Ou1FSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvgj6gtm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 14:22:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd91c0262fso1483894285a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 07:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773411740; x=1774016540; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
        b=IkS2BOE7vkq5RFi0pRuV4QWzmBQZxci3aCRbk9GX/UHN7jWoPAgSAjjsBkCVUqwlKm
         ELFT7XrNLpmIZ9SJsXzE0JYGdCbGzBkkPGIErJEwzRPtQSHxA687UUfYS31F2dn+MmW+
         teqeH0BlDDNSLyPmEEXrMb/zvG7ydkivTH8zc/l4T0jMy8Dek5PJlWkIE7KPXGJzqRZh
         SI0nyUVEDRc5f2Z3OJ9KG8ru+4WjV8LBbKFpAR7gFzfxVfI9sWnjZUbJOj9GAYav1n5m
         +P7IpNA/Zhpqzck6KrvmB6hP04DNXjukqJYuyyjrEnPOUiRKAb78zWVwx9Wc/oZJmcel
         3fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773411740; x=1774016540;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qs+FeU50DrlvqhF27orPwTWo+s1bAUOoX6Y3YglXETc=;
        b=PkB8NiOnR5cmkXfr3MIzmO2hPzszfT14rhQPHuIidExUggk9iczAjwimT0cAnDEVXU
         BjphicIUOJ3B9z5iIRFXmrh7ZEpqJa6+jsgG5WH/8WbvI3FDrcFwG+qIaw6U81wee9F8
         z3nq2gc8QGybSOV1D17mm6X+twqyHt/jUcL0PvOWThwCwvA3nSvMvlMyahWu/jPpWn3a
         Sswc1LpoeTqiL95UmqwGtA90aSCK1IIin5ljXiZQKhrrDAC9L6m3Enx4a2bcxksRkoNm
         9bjrBXkBvYtnjZvFwXRh87OqVQ81WZnZsU6IVsrBnJwYJXuZiWng4O8MnvFMpZ5iCPSM
         YKrg==
X-Forwarded-Encrypted: i=1; AJvYcCXN57uzHAXsCObDNxeC70sPmrDjemJNuIiogysa4YHlH5fe6/RP2uTBgxDOsDTVYscMT3om9svOqs0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6sW+sINcChApV4iVv/MyaVgIwgARZ7sUBTUEn1S2aUb/UVL39
	I+d8hyDhVN7rz/F8iOiJ7fitPgZb9WOyzcGXWXwoArhG7+kn4jpIdQnBN0neBdT11CgB25GMSsP
	+IP1XLE9+9MCbNf5/uWki7okQOEEbjvbIQ0JkHRIw+11dMlV0MR5oFwtRm+Ovjc7t/DE6
X-Gm-Gg: ATEYQzw9X/NnPTQ4jip/XDW5DiiQmLxUwKAzyYpfp09PXgTRDaJyD5QPeXawdFU/czv
	/bE5hS4JS0YUZGcsUy7BwJweGiydAjt01TE5FIpICyBroJG9COoLx6GZFPKjKjTRe94yiLjIENz
	Lgy0XExbkb/RxUQ9QJiSOghPTptPpZvXXmSFRYXW2aspaRmV5jtTAaPKgOfXtjlltkmibX/TFU1
	zOASvH20LMYoG81KNZpu/KAwqRTfK4sO6V2/pPE2tKFGE7geC5Elc/LcMX0NpOrkJ3Gvdfm8LGF
	0SQeS9hm+IoKRS7+VwGqzIkBjjTY6W8SvIJUe1t6atuc3aUxM+jaP/o7a1+Hll6rP+PcMCPiNPw
	GUvdsAYR0q0QM0qOL+IAgBvSvaddf/uKQANmQGmXbbCTHJlYY1NwEHwdvCY+1
X-Received: by 2002:a05:620a:909:b0:8cd:b620:9be2 with SMTP id af79cd13be357-8cdb6209c9fmr328968885a.38.1773411740457;
        Fri, 13 Mar 2026 07:22:20 -0700 (PDT)
X-Received: by 2002:a05:620a:909:b0:8cd:b620:9be2 with SMTP id af79cd13be357-8cdb6209c9fmr328963685a.38.1773411739954;
        Fri, 13 Mar 2026 07:22:19 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a73494sm25547505e9.13.2026.03.13.07.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 07:22:18 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 15:22:17 +0100
Message-Id: <DH1PZT7KCZE2.1LC6II43GX0XT@oss.qualcomm.com>
Subject: Re: [PATCH 04/27] RISC-V: KVM: Introduce common
 kvm_riscv_isa_check_host()
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDExNCBTYWx0ZWRfX83RYxDBG8Xrj
 YHAI8bK9kYyULOx6HKu+CacPG50FFWzeLOCfyCn3UWfptSbDARpxMs/rRLZw0EwnlOauIS1YCUM
 khH5LvSFl2TrB211vgQq+kjQ8QNjGNHgyvBgTU5RfxI3GH51zias5c+TGz/7B2BaIcuDnnu9RQN
 Vhu5cRFGx3CGtJE8ZHVYdSFOeJr8XuvZLopW1/VAz+7FV/dcnvvhoigi1cG05bxN0+parxBJ72T
 RwKHUVX0a+7o0nH7lgjRdMJtCEsp8IXLDcbcaFhpZo62929M0oYUxsE1SGFhvuNkumEwCZ1YqGs
 s5Q/9nteZP3ky2nrxFPXtNy2MYSMC9+FNBv5/rfdlh9NuV8ihPrDzjkujS0DeekI9BOLJ0YMAgU
 WvV9LfZ0xkbzwuJSO9UU4Is0RJac8kM2Qz2VOlSlZKr3xlFzATLkjC6T4vDM9O9Q74mr4babizH
 elk02e8E3u6f8hHYDhw==
X-Proofpoint-GUID: 01KvZtq9xTXbX8rREWQSlMJ6CxWhJe3W
X-Proofpoint-ORIG-GUID: 01KvZtq9xTXbX8rREWQSlMJ6CxWhJe3W
X-Authority-Analysis: v=2.4 cv=H+vWAuYi c=1 sm=1 tr=0 ts=69b41d9d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=sIBLlZgNAvny2aHwhmQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_072222_078792_F1939DAB 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

MjAyNi0wMS0yMFQxMzoyOTo1MCswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBSZW5hbWUga3ZtX3Jpc2N2X3ZjcHVfaXNhX2NoZWNrX2hvc3QoKSB0byBr
dm1fcmlzY3ZfaXNhX2NoZWNrX2hvc3QoKQo+IGFuZCB1c2UgaXQgYXMgY29tbW9uIGZ1bmN0aW9u
IHdpdGggS1ZNIFJJU0MtViB0byBjaGVjayBpc2EgZXh0ZW5zaW9ucwo+IHN1cHBvcnRlZCBieSBo
b3N0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVhbGNv
bW0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFy
QG9zcy5xdWFsY29tbS5jb20+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2t2bS1yaXNjdgo=
