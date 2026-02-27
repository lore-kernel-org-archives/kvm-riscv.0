Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85DCFEFB4F
	for <kvm-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 13:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2OSJuasavyBlLEIq5wHm/0OgLyI4XhT5ToWpLd7PJww=; b=JT8PYQy7FsuKyZ
	rHl0z8Xcfjc8Chi+lac05RL8GmBWKmDiL7QKmiuJMpl7DfU+FCo8Wd+rcDZAQhfqXB1v5SkV5DCr3
	u8cAHe17u1IL1YUHiPctO1csYIvIz11DiPegMCcZMlAJSVkbAI79BTbISnvFEoy9Q7l85FKq8Lxxj
	AH8wiSbUxzsnjyrOgPcY7jxQcudoPhTJRQ3eLfItXZL3V1bEZKQILDv/5HEnlbnam60I5y8NgxTgo
	1Q+rOLsbs7uL+gm5y9d/lcjjDoOsKkRW1DU0A6WxUb+3j0lgnaaKLMdj7q5FsWbmQUpNaXvx2UnSq
	kQQus7fRXvhRG4rPDpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyEu-00000008P9R-2Bt7;
	Fri, 27 Feb 2026 13:50:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvyEr-00000008P8b-0FjR
	for kvm-riscv@lists.infradead.org;
	Fri, 27 Feb 2026 13:50:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RAJHkU1873165
	for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 13:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UCqPGnCmWVQCsvHc/I8KF7
	mIauDPj2v0RjbE6kW19F0=; b=XR3vXfwIypu+k3TAlyzhOMwyBXzSoy3roAsh08
	jyjRjY0elVLYz5y8pD+WyB/LhJLYpXfDYRT9NEqFEj3UpgeZoLFP1MSsPx/D0OD0
	mZqZupUhNcV1IhlGRYWgmVoq0yq3IcSeA9jwIw7/7CBhQlqvTZ7HYjcfkXl4dpop
	/x5aD+b/GfUt9DVbz8AIXlSEPC+z+wnNkoCBhxoWnNHsDuS3cfYYT3nLRdxb6fgU
	MOjGevHIjTCdJ2MYtCrmw24aZrbPk4GpryBFDNSVcIxEK3Q0s6IhEP9HCndZOUAh
	nHWVZXarrQP5qyGOBFTOrCOh6Vy6P/UFD6T7Rt1BN7nCFFRg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytu5xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 13:50:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so1927286485a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 27 Feb 2026 05:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772200239; x=1772805039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCqPGnCmWVQCsvHc/I8KF7mIauDPj2v0RjbE6kW19F0=;
        b=QXOESULU2jZsVVwQH/B3uN1DKedHVgQdkorsdZ9elavUhm8fly76rFW2a/A45Bk/rT
         WCjc3lBljzpJvZFSK0nzzI4K21zd2aEaZ4MOhTEnjUNZ6WE/NmGve5hsnhkiO+TOeHvh
         RrxlV9f63A/gboTrPqfqzyp/l99r1n9AWopBSgXSBv0fKR1/mv7BgRmKngN3jWQLuqmb
         2cUU1ydJWNRGhvZyMUeGGVSpbCeAggp0s0tiYyCSh3HHHNjXTogoWrIuVWJh+1MaPlr4
         WxGVFtttSRSn+6nnoqJi7xAS21yJP6kuW7ej+6LJUboTQ46D9Ul7m+tiYdfyMaZrtVip
         cT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772200239; x=1772805039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCqPGnCmWVQCsvHc/I8KF7mIauDPj2v0RjbE6kW19F0=;
        b=Y4PxBMy1faxflVKowPfOwNoWHhyi4wi0Nk9sZnhfjvJxpnlDfegyNM78pkYh8nyBt5
         +dASifloXNqXj1cnprYZ//X5ps4cabfw131NP9ZK9kseLFcZeQrnxIRCDlr97+1GXMOx
         bpjD8DB3Is6ronRm0utbvW0Cez6A8Zm5tMzVD9RJXPSDD2CasrB/4AVUXYIRihzZU0lt
         V7jLUyHYWz4ce+blfb/D72RdOBMuxx6e//p2wUBdUFN3awKxSA+pTzeS5FcDRlmZjrPv
         Tlzi630TgNyPguxui6WhL6Xm9RHsS4z0waF4oZQce92y4s4zG4cgZH9lYZChIgD1nC1+
         GBtw==
X-Gm-Message-State: AOJu0YzxC0MQmQnMpGORrDdLMPluO5iMsv0BpxXyfCQB1LOOUAx4DhIs
	7y2xxF9JD3IEoz8h4zcTLjKhsXxtYzfkEVHifJBrfsTrYVyREytXfGr27v8xWUXi2G8X+OjefYr
	/OWm4ADsY7rB8GMsBKbirsM0fE0aqdTF9Fty+kjAxlz+WE5PLWU8kMmp4+AjZswZrpRaGNRVd1K
	Ov
X-Gm-Gg: ATEYQzzmAkiWu8qbLV4urgj9KD0dIelua+rSgBhi1PJkCoAfGc9az8E9UqAzcRpohWH
	A6HnxsaIxorGU6tAymlkA9NtOWj9lWVsJWTHLCZhp9KEN3AZxN36zPkGKwHr1CtBZmqgosnVMl+
	tiNKdqlVcckFWw+O+8qUES1A2q/m1K9OJCwDNq2/1tqpGA3WlkLXfmYccdq5upKzgDAxXKF0pcW
	GV4YlZFKt1H1mtGxwFIH36Qo0Od4BG1989PnDT+JJetzZJQvNnZqAFkyUcyqv2JPOdKAoFe3Wsb
	vB0VpimVuPFjo8hogCLIMfG7zpuiCXTrLgylJSK1SWNO+8lxgVImFg/i1ApfYs++1cmivgSuQg8
	LEP22ihq9jcEGWsbGK18EhM023lZluoFBAOF7RQdBy5QOTDe5oPioQ3i2KQbG
X-Received: by 2002:a05:620a:28c2:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cbc8e7b3e4mr334774585a.67.1772200238897;
        Fri, 27 Feb 2026 05:50:38 -0800 (PST)
X-Received: by 2002:a05:620a:28c2:b0:8c8:8126:7770 with SMTP id af79cd13be357-8cbc8e7b3e4mr334771285a.67.1772200238459;
        Fri, 27 Feb 2026 05:50:38 -0800 (PST)
Received: from localhost (ip-86-49-242-13.bb.vodafone.cz. [86.49.242.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec7091sm149414866b.58.2026.02.27.05.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 05:50:37 -0800 (PST)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
To: kvm-riscv@lists.infradead.org
Cc: Lukas Gerlach <lukas.gerlach@cispa.de>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: fix off-by-one array access in SBI PMU
Date: Fri, 27 Feb 2026 13:46:16 +0000
Message-ID: <20260227134617.23378-1-radim.krcmar@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a1a130 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=9tUHzIdeCh+UoOnba06Qjw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9SFidOni61YWn9SpgYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: E3ogK_tWHRqWv8RFGEAkifuy5isTkgvc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEyMyBTYWx0ZWRfX8kkjqB8xHzwb
 SuO5dunJKhJfcvlsCH3lhqFTqanV7gAU8HwozfGtNwBpHFe0w0wl3NgEewdYyGLV/r/0zoVR/3m
 1ld6CRtn/ofTmuK+nEzI6Yf/qM/j1+x3p6uwy3bKDmCfFb4WogDj79Uj3Ksit6fJ5j1v+QBKM/w
 lQytRUjrlYY4O6Srp1gAGpGa4gGQkNw1JLJ/f9+1Gwit/AHc8MD9Lkd1jH7fIchBVBIDEYZHs5o
 Nj01gb1D0VFW4xs9bgSKxYFsyfVapKYExIlh/MtKyHFZgf7WveD3gjXABN2etz2mjauCvbwl3bC
 VGk7+ocXQl8ixMY+nHJip0sWr7ysIhNlCt7IabJg43Gjn6huwrMatZA3GlW0/haCZbOynRfBAIE
 hPQFHozl7FYIKwRv8V0gmurRLFGKtlpzFTtnFPHujxyG4OvdFN9TRwXIqr8cvB+cm8PtavHP1VC
 H2qWpQtJFRljTnqW8Fg==
X-Proofpoint-GUID: E3ogK_tWHRqWv8RFGEAkifuy5isTkgvc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_055041_215023_CD17CDD6 
X-CRM114-Status: GOOD (  15.13  )
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

VGhlIGluZGV4ZWQgYXJyYXkgb25seSBoYXMgUklTQ1ZfS1ZNX01BWF9DT1VOVEVSUyBlbGVtZW50
cy4KVGhlIG91dC1vZi1ib3VuZCBhY2Nlc3MgY291bGQgaGF2ZSBiZWVuIHBlcmZvcm1lZCBieSBh
IGd1ZXN0LCBidXQgaXQKY291bGQgb25seSBhY2Nlc3MgYW5vdGhlciBndWVzdCBhY2Nlc3NpYmxl
IGRhdGEuCgpGaXhlczogOGYwMTUzZWNkM2JmICgiUklTQy1WOiBLVk06IEFkZCBza2VsZXRvbiBz
dXBwb3J0IGZvciBwZXJmIikKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxyYWRpbS5r
cmNtYXJAb3NzLnF1YWxjb21tLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
cG11LmMKaW5kZXggNGQ4ZDVlOWFhNTNkLi5hZWM2YjI5Mzk2OGIgMTAwNjQ0Ci0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfcG11LmMKKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwpAQCAt
NTIwLDcgKzUyMCw3IEBAIGludCBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2luZm8oc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNpZHgsCiB7CiAJc3RydWN0IGt2bV9wbXUgKmt2
cG11ID0gdmNwdV90b19wbXUodmNwdSk7CiAKLQlpZiAoY2lkeCA+IFJJU0NWX0tWTV9NQVhfQ09V
TlRFUlMgfHwgY2lkeCA9PSAxKSB7CisJaWYgKGNpZHggPj0gUklTQ1ZfS1ZNX01BWF9DT1VOVEVS
UyB8fCBjaWR4ID09IDEpIHsKIAkJcmV0ZGF0YS0+ZXJyX3ZhbCA9IFNCSV9FUlJfSU5WQUxJRF9Q
QVJBTTsKIAkJcmV0dXJuIDA7CiAJfQotLSAKMi41MS4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5n
IGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
