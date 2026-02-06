Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A130ECD9AA
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS2tSPHnd0VIm6ixpAZM+hMqqpMGaf8k0pqchP9D8Zk=; b=OP1aQmzXApP1Rb
	+qicnUWTtFzsXyzSUJAD8AM3UriTgTp1P7DdYn7DWzm3J+XsgAbKrS7gNafJsEulpe+CDeJstB2Th
	6llS278mwwxT0iKq5Lncs9gEI0z13K/7kvRFcb56dGalYWMIg5CSllRz1yrGIV5yCgEZKORFLhebB
	vHsYmjnkY2NWFs1nm8mBkzmrG/5BRYtTdmvjKS2nkk4OViaq5BjE0HqXIOjVu3+BomlzBAFh/i+D1
	/YmYNLxnfjABPcQOeeLyeDRJgGsG1NUv9AGmV0D3BucYuM9wN8rIVboJVW/KUzf2FKw206hbKej71
	e9j25ucLt48EBVnEepng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dk-0000000Adxa-0CXL;
	Fri, 06 Feb 2026 00:24:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dh-0000000Adv2-3Wjj
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615LaCYS4166976
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DkB7Ob67zo2
	H0cVB+6PUohLPiXcNGFnT5QvoddvcFAk=; b=CIscHv8Vl4kM43sqkJEBFmJINqB
	jVOnONXtZ0fhnKofFIr/8Kk5W3Qnk0Els4Rkulq/lJHSwISasV+NKyuXC5vz0mJF
	uPlztQOrp49rKkHnLu+Fyd04wUTF0XZDNnjHzmdJIAhvtW7G7vpIsoJgRI0sdoa+
	T/hdwEDFAup7Ce8tqNRMZYyM2ntakAuenfDPakM3oVMQcKf0dE4HhviV/J6EYuAb
	NeizsENeY3oXuScICI5r0OV5H4Kob9HDgqyBolq5fgTFu0x6+6369DhYoOt5WvKY
	3DdgSSeo8QKbebaksc2tAQpoRoIt5v84y3AWoLm08XYIPawt/aA6QytSOkA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4negbb9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b7eddde359so235343eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337440; x=1770942240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkB7Ob67zo2H0cVB+6PUohLPiXcNGFnT5QvoddvcFAk=;
        b=PI1HxWAPi9jimdIk0+SZz9x6lXLm6ofmvst4p6RaG1rnmIHY8jy08CYVnmNMf1H/Z3
         H9rpTBXpLF4tAzgaum1nN8POHSBRWSHrX1UB6BPb9nAkPZIvHf6vIXhZICYdN1az5oPj
         PLVVVL974hC8yecNZ3X7dTbeD4i2vU74KTDuu1Ds1HRBtHnejP6PtcEY38uK/eeWOHIj
         L3HDF5DQ1/csf3lePZcekry1AboyI8/JW4gXbgPRWWMpReMWAlF2p/njfPAghrMekTG7
         Pdy4RMEPRG0bJbOPVh0NmNWLjwN3CbVOj9e4qgrJUt4gLaXcwM1c/qT6Oo/1rtlKlwSe
         Z5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337440; x=1770942240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DkB7Ob67zo2H0cVB+6PUohLPiXcNGFnT5QvoddvcFAk=;
        b=TnMLdlWBMQpE7cgQVNXflAW6iKEAn0pKeD25Up70KqjVx28JnA7v9CFX5JSNx7kywV
         pUI5RpBnv7cXEqAt/hZmaQgIIkpSoyXUPaRQjyNKEesLwXcazL0QSmtgcxRIQSWPkgdU
         FR8NXq30cqDipFSKPlUvhdNP+dfU0G6v9sgyrc8PC8+f80lKzXDWKDH6YyMV/d2LEj7Q
         QLl2l/LY4HpS2C3kdmoBK1WpG/i9CxpTHjlbvxZxh9jU/SlIC1iQLKWs1AsQWOMzxU7v
         +FA4dfYtfxl4IpoZK0N4yyFhd6hN0bCdKLMZBzcqMqbaxDcQkHBaeKTQhDx0EKgjZnNm
         CiwA==
X-Forwarded-Encrypted: i=1; AJvYcCWAEoWOF5fRKYj2w/Bjrr/dars8UgMgvGtUaj3BdEh04kxXdojE7EcKQaEGJi3sZUzj3Dit9MeVh+o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvcDbCsNr/s+41v2Rm3XjCYBwli6Nv0IAR5dVid7mFKp5RPXEx
	ciKQbIEIBT0R+PFvBF0U2A2Zy61R8w5WN01mMDI3iUPA2i4zWBGITkJx+G+Y1gfHYttJdsVY5L5
	Uf+aDApmn4C/qeS3G29GXUtetIsyE5ZbvW0BPseHVlPUTJ7rOjjR+abqGTXYbIzo7o3Un
X-Gm-Gg: AZuq6aIoO+r2YmHDMtBNN0UhguXqGf6ddGMF7SvM8fqN3kpyav4Z2H8u4Tzq3zAt1kU
	f+bruL/OeEw8A0/2gwvX5v3LtxY/5dUjxJbE72nfTgKARkqMatc3ivQtHK99UTUauNGLe/nCE5l
	Lf+HcZniSFata8BNZmY6brYiZoxjyAbo2wvmXK9C6DvgJp64d0QVk1TrJGMceh/1BVq7uo+xmmm
	v7pLxuZYZn6xai6u8OvAKIXMCDJmlDodUakOIfiQwf1X1PYcURNJkbMN82Z3YBWOI2xq/ASNqn0
	z8SzM1vJELqyDL4UrOfKXr3XMX3xhZHqQk7BSphn2C1Dmihi9hMnShUVZhrUn6VGEjvMpnAsnxR
	rg8d+YzEmpnXK/Wz6eY4=
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr445007eec.32.1770337439876;
        Thu, 05 Feb 2026 16:23:59 -0800 (PST)
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr444996eec.32.1770337439354;
        Thu, 05 Feb 2026 16:23:59 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad8c62sm618387eec.3.2026.02.05.16.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:58 -0800 (PST)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Guodong Xu <guodong@riscstar.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Date: Thu,  5 Feb 2026 18:23:42 -0600
Message-ID: <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX7Q+P+WnjxK5q
 BjbAT0jutj1hCtOaovgIfjPsAwd0e9WFNed1hyL+K/uM97SOasBrZZO+fk7iSTmkw1iTcWEgQif
 uZiXI01vV2LuJzSJYuY5YHnF4sHwU2OgW5MnI61DPwZqlEBcH1n2xQt0FfDPhJUX2kiLc5fiZV8
 LkJsuruEuA6W9Dw4bWf79HLfAmN6IIUSW+TdG0BJkNtkvyKXKqlYjmee98YhOqOEUCVZBW7IdlH
 ydylLJE1OYxyzFbHFvavjzk7tWyDwPlgODNSGPZgCsdlp+yuuwjXIWydndWGHpC1WAQPY3V/JPV
 o/f+73LGJxLgrbVeZeDiEjJtEp5g8SF9gwm2V9xJERvTaHO+LJQFqyVYNPDVNjzTrnhrCUuVdzZ
 RVJ3rbc3dDGYRWnan8V9Anm4FbPF2N++DAhu9OOZ5Hsm89TwzHkhKliNcgZhkgl84OdelpUUWIw
 fRN5RhQBEKTGlEv/EwQ==
X-Authority-Analysis: v=2.4 cv=ZITaWH7b c=1 sm=1 tr=0 ts=698534a0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=y3MMSYwnWwWQE3oEGTgA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sv-NeZoZwB-NgQHGa-hv-CEYRXBa6bK8
X-Proofpoint-GUID: sv-NeZoZwB-NgQHGa-hv-CEYRXBa6bK8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162401_991678_15EDD3FD 
X-CRM114-Status: GOOD (  15.69  )
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

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/hwcap.h      | 1 +
 arch/riscv/include/uapi/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c      | 8 ++++++++
 3 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 03acd22bbbaa..c17e11caca83 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe..96b7cf854e09 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 25ed1d6958d7..ca7a34f66738 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -429,6 +429,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -476,6 +482,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1089,6 +1096,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['b' - 'a'] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
