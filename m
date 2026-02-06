Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF73ECD9AA
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1arBEuu3PV5iFtzXR64B5kmabAL32tCxSUvcEzYR0bw=; b=zu3AVCHHY8QHnU
	o4CpGKR4HElottfdvS3G2g8ljbKnwyTqeM4V8tqhJMRUcQ+88EE0Bsc9Uz2817isshtIGWHfVDKh+
	PccpXMK1ibCgspGCom37FLm6rASkX9qJFH1ge9FhyOGBLlyy671gWiWedoG8Yj8XwzrvKAeAW/kBD
	L/eiJGxAFEj3N/NRwZatf32qnc3mzFDVs8qaXySXNHn0riSgwjCmVHeQKaQQGCOtMuP19vtQ1mlJR
	2296fTk1tkQJiQymz08Y1+met3vdIwbJHGIutiEPvXVxpKWrK/bv1gIBGR61ZYi2TqSDkZvrO6vjA
	kpx6BpLytN5inv5w/6zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dg-0000000AduN-2QaV;
	Fri, 06 Feb 2026 00:24:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dc-0000000AdrY-3CM8
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:23:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Nv1KY2946144
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=duq1MIGt2nr
	sc/Dbial9NVfQhy3xAH8K2EGdF2CFPhw=; b=O+uFXPch7jOYHhmOSC8XxTRciVw
	f2OEPoLt45MrHkj7sSlSE/rcRmJnI7YUKNkbKT9RDoWyjNqcYzhmHv8Pn55DATAK
	HGC3YiOj+zxzwKu8qoog2uMZu3Hm4amMe5lC1vo1B2whgTWA4z1uCOY6z0ZKN8Vg
	bBjngTeN2lJdjWqSuNND04NC4GS6zzOAPeN9xRgu2TpAgl5RB3C0cXRRxWRouIG9
	Q8tvdZtX/43xW7SWrYkyN7uo8m7NvxeLUilcjBOYs6CdoOf2yd9WxWrUAjIrjgdy
	7wOq9yj4xWFzQ00zppYRcHNOKvQJdJFJ/1dHgCC+ac/79UgBguegWHsq6bg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4q55u3nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:23:56 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-124743cf760so12020872c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337436; x=1770942236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duq1MIGt2nrsc/Dbial9NVfQhy3xAH8K2EGdF2CFPhw=;
        b=Q+8CGVFfN/fl5RaSa7BkBpjFc8tBbxck6+20ugMDu5EQwdJdGeztchjdGClWHQHzCQ
         JQBuAKrNbnMiy8S2Qnc6qwejJO8GNMBOwlmiSqWPlLbz1xNreheSN5v8i9bp8jwk/SAe
         C9y3wQqm3pUgcqc1dOHXJUT+i1jyFiKLDQCKdIjYAQP+L16vOc8USNjbspgIpbbhpJ7I
         LX72jvJmXXxvR2GODQmVr+3NXUa2usCLjDcRHWDB3ADMuwcYU8CsxE5t0AkYDKUVfwQ2
         7+MXYziSUEodO+YwvOAo8UQwD11zyyuWyQmAXHbSrUajJIOBNm4z8x6rEJ5nJ2011uIJ
         MciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337436; x=1770942236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=duq1MIGt2nrsc/Dbial9NVfQhy3xAH8K2EGdF2CFPhw=;
        b=ljhF4qzIIs7J0HfftkRUVov7wdRm6fDMYZclhIcPXJEvuSOkHsk4WLM+N502KXG94H
         e6L8mT0LEfbauK2pyXsH2+6zZb/rb1tOqoj2LlT1UVPnNApvk6oyBMpXOghxure52uBv
         hp6HEvRP96IYHRV6SuAF8ZigJffqEk4dQRF+3+VkxefnTMG8THiDhy9O5gSgF2OrR0hx
         SGqZkU1MAu2hO2YzcYFmeNT7rTjujf+yxn7tivIptlif2Db9zca3asDXQzZNI5QMkFd2
         LZ0r1keeP5/8yYN+6myLxtGqGpQTa4cn/K01RWytj3yYhCf1KwHrsj9hMj64c9H/Mr10
         bF3g==
X-Forwarded-Encrypted: i=1; AJvYcCXRqdUMTAGAo/8I7Kv038H7/83+i6Aeja7FjGwcr+XKnw+mYW+N2LuIG1ExWsa3VmRHUhoWZwc1ywg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJe5VFA0AzBN9vyXMcKZmk933Q5L6OXRDVJ7MLDM77kuduiimV
	R+eE/Oe/D+vtW1ptc7HkchPgLH91qL/tcf3en7oZVsF7trAdgTNkOsa08XM1TWMAhGGAlKifkVG
	21xgJJz0C1LUYi0hj0SNMfomLSom9Ck7ueDYPq71VALVtYy5LRe8RmtLqacAZYGOai3Id
X-Gm-Gg: AZuq6aLqe+NJzbjnkjeCWLZsZfiDyxELBhw6ibDz5P3H0fSKJNyVi2zkx1aTZs7Kwc1
	3G8rntBV5dSmBo4+BBvEHZhQodXaOYfCkJfpKnhiBkb4ef6M8wRkptpU2DwMecS/9h/bIS5Sgj4
	jfhKBZstoH/tC7TmyGnb9dNkD2L9Z0vgS0qMSu+a0/sxqH56oSD2qhhQASJK4XGob1gYWcCzhjH
	loZhbu41BUoDaOoFapgehxCwXadvxFRQ0181own+ZN1p1HkQzQhVm+VRU/vJNqd/RHHlI+M4cQn
	U+T3f8xYOmL5eLSGCfx8LMM+n3/arqf6jUhbHSbhZUWwUPmFLCbQ3hZPLy9UapSGyrXvjQnzt0/
	yrciYZNdsnc5ix/e3syo=
X-Received: by 2002:a05:7022:fe04:b0:11d:f44c:afbc with SMTP id a92af1059eb24-12704074490mr568204c88.37.1770337435617;
        Thu, 05 Feb 2026 16:23:55 -0800 (PST)
X-Received: by 2002:a05:7022:fe04:b0:11d:f44c:afbc with SMTP id a92af1059eb24-12704074490mr568193c88.37.1770337435027;
        Thu, 05 Feb 2026 16:23:55 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d9c91sm748823c88.2.2026.02.05.16.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:54 -0800 (PST)
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
        Samuel Holland <samuel.holland@sifive.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andy.chiu@sifive.com>
Subject: [RFC PATCH v1 02/11] RISC-V: Add Zicclsm to cpufeature and hwprobe
Date: Thu,  5 Feb 2026 18:23:40 -0600
Message-ID: <20260206002349.96740-3-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX4jUOBRlPUx0u
 hTcHUwnkAND9NyV+lB7Wfp1VV0C57my9TYpXfGOIM175Jvq97kHwjM6380A+cK3tbyxIqos1U28
 JlpOayNXcidhwVSWxEsDbbJVZqHlty7I7moZlH1mwxZiwQCE/8qsh+LNVsgT0jCNY8EwFv+xWPQ
 QKAnByDwC2GMeg2RiTRqEuG2POlDkO95YneEqnb1OjPgM0UbaIWRVsoB3l0jBCuj6OX0vUP0gG0
 sLE4zHaSuMJdTtaMhHHtRrl0R9hKSLvZdFFlygYHWaQaHJLvS7YBB8VdnZ/G+TTc7C5PscvyhX1
 xOcdJqSwo3r+aXjepqid8knGjoWSVjHWAnDiUoJ/pz7ek19DyHf4j2fedBW/riJqme4TqzZl0Y/
 nVL7JJwGc5+lYv1+51AeEctc2KJIy6DKEa4z48Iu/NJVLgssQgAzCZyV+UdWyByua8ChAxU/Ies
 iTfPWpYhuQGYJp2AZGA==
X-Proofpoint-ORIG-GUID: Nu8-Che4F-fuxkPd44Lz6YrFPo03209b
X-Proofpoint-GUID: Nu8-Che4F-fuxkPd44Lz6YrFPo03209b
X-Authority-Analysis: v=2.4 cv=Z6zh3XRA c=1 sm=1 tr=0 ts=6985349c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=h0uksLzaAAAA:8
 a=XYAwZIGsAAAA:8 a=pFyQfRViAAAA:8 a=EUspDBNiAAAA:8 a=vFLl6S4mlm16Le5vUt4A:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=MSi_79tMYmZZG2gvAgS0:22 a=E8ToXWR_bxluHZ7gmE-Z:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162356_806278_FA23A1EA 
X-CRM114-Status: GOOD (  15.41  )
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

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 03484a2546da..0598c9ddd73f 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,10 @@ The following keys are defined:
        defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
        load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 4369a2338541..496694d3e182 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -110,6 +110,7 @@
 #define RISCV_ISA_EXT_ZALASR		101
 #define RISCV_ISA_EXT_ZILSD		102
 #define RISCV_ISA_EXT_ZCLSD		103
+#define RISCV_ISA_EXT_ZICCLSM		104
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index ed2621a5a47d..6a0163b54718 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -86,6 +86,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOP	(1ULL << 60)
 #define		RISCV_HWPROBE_EXT_ZILSD		(1ULL << 61)
 #define		RISCV_HWPROBE_EXT_ZCLSD		(1ULL << 62)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 63)
 
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fa591aff9d33..cf27b7a2547f 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -481,6 +481,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 53731ace7984..1423b447fe9a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -126,6 +126,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZIHINTNTL, pair->value, missing);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
