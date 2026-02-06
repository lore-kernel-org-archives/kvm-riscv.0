Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E95ECD9B5
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7bCZJidfMak7uXRhgvJovkx2szJOgnlHcXn+SKtjo4=; b=rLZJ4BUjgwlexr
	suW0cutucC2z2LsDI6LnnP8/cv8DH1nPXqz1wJ0mFJM7YzhLq4qobY81VRtYwn09BU3Vvi8NS4r5g
	y10XQU3DqxCesnanQ+8kH8x697IPMUyT4RwyHJeYO1Y3ONLSkMlZhzaS8A/I/4delA1/YSwXnvJrk
	Us94u/qirSv95VYzN5+QzmWGUpRDoGf5Yb+2g7jjrvxp/v7WhOQ2KK+TygghsC6c+RrULBfsxUzu6
	udQHmqs/CLz/n4+8B/4JVX93X0ZFtRnnrmFMAvb3MPFbiVWXx0S8p7q2LQrBbkKbRpbYqmjpKWin8
	Fx28qUIGXZYGDboq9x7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9di-0000000AdvX-0mAt;
	Fri, 06 Feb 2026 00:24:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9df-0000000Adt5-0p2y
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615KqtdO1785688
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eB/6w0ERhDm
	CdUQSC3GPLAZVEVNgV/kTjr9oJ/xDm9w=; b=UXfO1OekYBdZsbCJ/HPiXEPnMUN
	x47LIy9Yc8AZhhlvUb6XL0put1eIhF2ZTAyx8fUMyDahCV9N6w6M03mxIXxgdsgh
	y0i1JGsCpu6lGCanx0swkzesmBr3dSwnt2QQpzm8Bnm/9OOxx1wWbtie+2hF4hGc
	vkf21JqqmRaX3FrusXMWqPo/VbguMbBD//tQej2on1Q+ad7XJbjeFeMb6MQpLCKR
	RUmilkZoYjFEn2/4JZmapCdE1sTucPRzSMX+Z7CsPF/EsBX5hg59iaAwY26Z3Dl4
	b/xkhpjoX7q40cqNyGKx5itHWsHdpQG2SZOyrLvJSXUqGVbSnll77OBpOXA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrgm3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:23:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b7eddde359so235304eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337438; x=1770942238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB/6w0ERhDmCdUQSC3GPLAZVEVNgV/kTjr9oJ/xDm9w=;
        b=aSMxDJG5VukdS2di3rgjLauSBqVwwA6wHHh87VYVVF8hxzrNCJGZ0HYIffUhvEvCzR
         p0/obvWxV0BLKmXZLYrptNIwUNCAm2R8UOLhuhJegPdpThjL7X9QqY52hLYj91Z7wgB1
         J/CzT98YqirDxC8cd54160qwaSlBXke8ueVKVzHPIbuvq1fPeYhz1ZQ0H0zZx5Iz5oTk
         MY4U6u18OJ1RW1LXukmMb52qM27yWrkTV2SS3wpj2PC0zV58ZAT3Y3XvjMrLG0/M5R7g
         KfuIG6+dPf7sVRmn+NTvHfmmfNNPyxxsElcivkq+/dDMCjGZOM3m5Z2V0DjkPCxnyFE4
         YlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337438; x=1770942238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eB/6w0ERhDmCdUQSC3GPLAZVEVNgV/kTjr9oJ/xDm9w=;
        b=RCDpW0QK1g3JTsLeHkGQ2Q4YP7/fYT/nTzGEwPw49lQy3kDTKZeTHuj9AcLzBU8ECX
         X3U9k3tChRfNuJHFhctDy4GS6iCl0XytlPq87iVEvOdJOsZ5y6h6qgS7GKnZFQKgLvj0
         ik9mu2JVpr5VNbNFS+Xli62rbbDFWjU9cNA7t8KSPQjAHjNFiR+BR5dQKnaYrgHR8PoM
         MpNsVhpJM59jelAKNl21rG7ZA/cqwMluCRLPl8Gl7t7w1/8jda18hyhUAT6MmGarPveW
         WDtWmuwLaANwghbGH8PE681aiDB/hoF8sAe886P+841Stt4Aq2PfNXv9zJiDjKXeLcZB
         4l0w==
X-Forwarded-Encrypted: i=1; AJvYcCU/NQuKndo/fou06+xgsWD5oE6osS733l16KYkI5vQFGNNFxKkRvLxHyVEECEZDgsjhsPQyo8HA0R0=@lists.infradead.org
X-Gm-Message-State: AOJu0YywoOSPxjO9kh4FtU19NWPBI02Fh7aV+WtyMfpy9nPKg9kxIJp6
	xHfy0J9fhSJK9PpWic6HhvdzjAg7+/6RqyJqXvSyo7zBQCTZwbEzEwHJ0jPvtjGoy77louchcaU
	Za10ZKbGKBBGoUnybmJdjwdLbJwUVpDmz65puHBlZkgEFAI5nw0xB2wB77Pux62dBKFgp
X-Gm-Gg: AZuq6aJFAcj1DMz3XumcudsWitoPujV2pmbLl/d+AWVp3dpJPaM+v0sy3fD2YkYHcui
	NyqXrZ2sAzKChj1SirmKjoAml3oosIAwNo6GIp2mxwZCjr4eFbv6WsauDPiVZg25RWe5D+h3Fgo
	2MO9LKlDww+8SdT4AB/IhaC/YjIP6eF0rxJYalGBrGmIu9W5tsCjCfzk2CEZJ0lkRFWvIClJYlI
	wGfOMMBZ/yrqOrCGIVLMWgh4bVHs4voukHh/1H6Te0W5MyQhLl6agEyXbm5aLsbYbs0CU9lWhKA
	qs3A37CV4D5Tmxn6jWifs7gKgbMb4jdAqjPJz8gI4IsfFvakzm9eUzPXtwt8lD93lQXQFwXy12K
	7Zf+218Mf8zECklGJfB8=
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr444960eec.32.1770337438026;
        Thu, 05 Feb 2026 16:23:58 -0800 (PST)
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr444946eec.32.1770337437409;
        Thu, 05 Feb 2026 16:23:57 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c3daf7sm646541eec.20.2026.02.05.16.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:56 -0800 (PST)
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
Subject: [RFC PATCH v1 03/11] riscv: Standardize extension capitilization
Date: Thu,  5 Feb 2026 18:23:41 -0600
Message-ID: <20260206002349.96740-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX5px7ou1Bh8QA
 CFITHGjsEl4lUQmyKe/Hib40lxLgYd20vvYDkKqanMtiIa8m6mjoEF/oaokCJibmW+5259BSmjs
 sXUo1UGujUUPIEd4aO4vyPTiZqVPARDjt/cg6i0AfBvftr3p0xnoo6LO9v6AESf/KMB7Xz4Q279
 fnbCB1+/aBOlrTPpI4exWLPvPRCtjw4Svl3ZdgMMogZcEBxp4gZUi/ln/bY722yh0J482G6TT5I
 HfYkIcHlNQcRW2ldALOHghJ4sADD4lO+PdLgncjnDfAjV9B4I64cT7DrSj2jcEbcvF6GEbz2nA8
 1uNxbKktJ3KJQC7IsWXVniRcC+n3HNVDZOe8n6qDzU+EhapRuxDdAiHem2W1gbtRxSpaYGeH+eu
 //FyJiyBtajjtT4UBYWuUxVn3rq9XEutJkF5k1rdqJ6kM+ykLillZwD/LFkjtOWznOy4KltLt4m
 Hwv6/KbKm31g6GOv8WQ==
X-Proofpoint-GUID: tXYHV0LlHtgKswCqsW6vAjQxQ1pr55la
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985349e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=h0uksLzaAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=_LueOzecWKeZO_VxXI8A:9
 a=scEy_gLbYbu1JhEsrz4S:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-ORIG-GUID: tXYHV0LlHtgKswCqsW6vAjQxQ1pr55la
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162359_253089_A1949A43 
X-CRM114-Status: GOOD (  19.59  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

The base extensions are often lowercase and were written as lowercase in
hwcap, but other references to these extensions in the kernel are
uppercase. Standardize the case to make it easier to handle macro
expansion.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
[Apply KVM_ISA_EXT_ARR(), fixup all KVM use.]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/include/asm/hwcap.h     | 18 ++++++++---------
 arch/riscv/include/asm/switch_to.h |  4 ++--
 arch/riscv/kernel/cpufeature.c     | 32 +++++++++++++++---------------
 arch/riscv/kernel/sys_hwprobe.c    |  4 ++--
 arch/riscv/kvm/main.c              |  2 +-
 arch/riscv/kvm/vcpu_fp.c           | 28 +++++++++++++-------------
 arch/riscv/kvm/vcpu_onereg.c       | 22 ++++++++++----------
 arch/riscv/kvm/vcpu_vector.c       | 14 ++++++-------
 8 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 496694d3e182..03acd22bbbaa 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -10,15 +10,15 @@
 
 #include <uapi/asm/hwcap.h>
 
-#define RISCV_ISA_EXT_a		('a' - 'a')
-#define RISCV_ISA_EXT_c		('c' - 'a')
-#define RISCV_ISA_EXT_d		('d' - 'a')
-#define RISCV_ISA_EXT_f		('f' - 'a')
-#define RISCV_ISA_EXT_h		('h' - 'a')
-#define RISCV_ISA_EXT_i		('i' - 'a')
-#define RISCV_ISA_EXT_m		('m' - 'a')
-#define RISCV_ISA_EXT_q		('q' - 'a')
-#define RISCV_ISA_EXT_v		('v' - 'a')
+#define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_C		('c' - 'a')
+#define RISCV_ISA_EXT_D		('d' - 'a')
+#define RISCV_ISA_EXT_F		('f' - 'a')
+#define RISCV_ISA_EXT_H		('h' - 'a')
+#define RISCV_ISA_EXT_I		('i' - 'a')
+#define RISCV_ISA_EXT_M		('m' - 'a')
+#define RISCV_ISA_EXT_Q		('q' - 'a')
+#define RISCV_ISA_EXT_V		('v' - 'a')
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920..ff35a4d04f85 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_d);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_F) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_D);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cf27b7a2547f..25ed1d6958d7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -83,7 +83,7 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -145,7 +145,7 @@ static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 	 * Due to extension ordering, d is checked before f, so no deferral
 	 * is required.
 	 */
-	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D)) {
 		pr_warn_once("This kernel does not support systems with F but not D\n");
 		return -EINVAL;
 	}
@@ -188,7 +188,7 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
 	 * Since this function validates vector only, and v/Zve* are probed
 	 * after f/d, there's no need for a deferral here.
 	 */
-	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
 		return -EINVAL;
 
 	return 0;
@@ -223,7 +223,7 @@ static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
 				  const unsigned long *isa_bitmap)
 {
 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
-	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -236,7 +236,7 @@ static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
 		return -EINVAL;
 
 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
-	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -469,15 +469,15 @@ static const unsigned int riscv_c_exts[] = {
  * New entries to this struct should follow the ordering rules described above.
  */
 const struct riscv_isa_ext_data riscv_isa_ext[] = {
-	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
-	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
-	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
-	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
-	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
-	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
-	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
-	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
-	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_I),
+	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_M),
+	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_A, riscv_a_exts),
+	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_F, riscv_ext_f_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
+	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
+	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
+	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
@@ -873,8 +873,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * marchid.
 		 */
 		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
-			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
-			clear_bit(RISCV_ISA_EXT_v, source_isa);
+			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_V];
+			clear_bit(RISCV_ISA_EXT_V, source_isa);
 		}
 
 		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1423b447fe9a..76e673ab42a5 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -88,10 +88,10 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (has_fpu())
 		pair->value |= RISCV_HWPROBE_IMA_FD;
 
-	if (riscv_isa_extension_available(NULL, c))
+	if (riscv_isa_extension_available(NULL, C))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector() && riscv_isa_extension_available(NULL, v))
+	if (has_vector() && riscv_isa_extension_available(NULL, V))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45536af521f0..4d8c6e04aa7e 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -85,7 +85,7 @@ static int __init riscv_kvm_init(void)
 	char slist[64];
 	const char *str;
 
-	if (!riscv_isa_extension_available(NULL, h)) {
+	if (!riscv_isa_extension_available(NULL, H)) {
 		kvm_info("hypervisor extension not available\n");
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 030904d82b58..5cb6b04f6f96 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -19,8 +19,8 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
 	cntx->sstatus &= ~SR_FS;
-	if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
-	    riscv_isa_extension_available(vcpu->arch.isa, d))
+	if (riscv_isa_extension_available(vcpu->arch.isa, F) ||
+	    riscv_isa_extension_available(vcpu->arch.isa, D))
 		cntx->sstatus |= SR_FS_INITIAL;
 	else
 		cntx->sstatus |= SR_FS_OFF;
@@ -36,9 +36,9 @@ void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
 				  const unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_FS) == SR_FS_DIRTY) {
-		if (riscv_isa_extension_available(isa, d))
+		if (riscv_isa_extension_available(isa, D))
 			__kvm_riscv_fp_d_save(cntx);
-		else if (riscv_isa_extension_available(isa, f))
+		else if (riscv_isa_extension_available(isa, F))
 			__kvm_riscv_fp_f_save(cntx);
 		kvm_riscv_vcpu_fp_clean(cntx);
 	}
@@ -48,9 +48,9 @@ void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
 				     const unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_FS) != SR_FS_OFF) {
-		if (riscv_isa_extension_available(isa, d))
+		if (riscv_isa_extension_available(isa, D))
 			__kvm_riscv_fp_d_restore(cntx);
-		else if (riscv_isa_extension_available(isa, f))
+		else if (riscv_isa_extension_available(isa, F))
 			__kvm_riscv_fp_f_restore(cntx);
 		kvm_riscv_vcpu_fp_clean(cntx);
 	}
@@ -59,17 +59,17 @@ void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
 void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
-	if (riscv_isa_extension_available(NULL, d))
+	if (riscv_isa_extension_available(NULL, D))
 		__kvm_riscv_fp_d_save(cntx);
-	else if (riscv_isa_extension_available(NULL, f))
+	else if (riscv_isa_extension_available(NULL, F))
 		__kvm_riscv_fp_f_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
 {
-	if (riscv_isa_extension_available(NULL, d))
+	if (riscv_isa_extension_available(NULL, D))
 		__kvm_riscv_fp_d_restore(cntx);
-	else if (riscv_isa_extension_available(NULL, f))
+	else if (riscv_isa_extension_available(NULL, F))
 		__kvm_riscv_fp_f_restore(cntx);
 }
 #endif
@@ -87,7 +87,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 	void *reg_val;
 
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
-	    riscv_isa_extension_available(vcpu->arch.isa, f)) {
+	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
@@ -98,7 +98,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 		else
 			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
+		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
 		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
 			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 				return -EINVAL;
@@ -132,7 +132,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 	void *reg_val;
 
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
-	    riscv_isa_extension_available(vcpu->arch.isa, f)) {
+	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
@@ -143,7 +143,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		else
 			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
+		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
 		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
 			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 				return -EINVAL;
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 865dae903aa0..901dca0edcb9 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -26,14 +26,14 @@
 /* Mapping between KVM ISA Extension ID & guest ISA extension ID */
 static const unsigned long kvm_isa_ext_arr[] = {
 	/* Single letter extensions (alphabetically sorted) */
-	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
-	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
-	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
-	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
-	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
-	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
-	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
-	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
+	KVM_ISA_EXT_ARR(A),
+	KVM_ISA_EXT_ARR(C),
+	KVM_ISA_EXT_ARR(D),
+	KVM_ISA_EXT_ARR(F),
+	KVM_ISA_EXT_ARR(H),
+	KVM_ISA_EXT_ARR(I),
+	KVM_ISA_EXT_ARR(M),
+	KVM_ISA_EXT_ARR(V),
 	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SMNPM),
 	KVM_ISA_EXT_ARR(SMSTATEEN),
@@ -986,7 +986,7 @@ static inline unsigned long num_fp_f_regs(const struct kvm_vcpu *vcpu)
 {
 	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
-	if (riscv_isa_extension_available(vcpu->arch.isa, f))
+	if (riscv_isa_extension_available(vcpu->arch.isa, F))
 		return sizeof(cntx->fp.f) / sizeof(u32);
 	else
 		return 0;
@@ -1015,7 +1015,7 @@ static inline unsigned long num_fp_d_regs(const struct kvm_vcpu *vcpu)
 {
 	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
-	if (riscv_isa_extension_available(vcpu->arch.isa, d))
+	if (riscv_isa_extension_available(vcpu->arch.isa, D))
 		return sizeof(cntx->fp.d.f) / sizeof(u64) + 1;
 	else
 		return 0;
@@ -1094,7 +1094,7 @@ static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
 
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
 {
-	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
+	if (!riscv_isa_extension_available(vcpu->arch.isa, V))
 		return 0;
 
 	/* vstart, vl, vtype, vcsr, vlenb and 32 vector regs */
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..8bc85593e1d4 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -25,7 +25,7 @@ void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 
 	cntx->vector.vlenb = riscv_v_vsize / 32;
 
-	if (riscv_isa_extension_available(isa, v)) {
+	if (riscv_isa_extension_available(isa, V)) {
 		cntx->sstatus |= SR_VS_INITIAL;
 		WARN_ON(!cntx->vector.datap);
 		memset(cntx->vector.datap, 0, riscv_v_vsize);
@@ -44,7 +44,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 				      unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
-		if (riscv_isa_extension_available(isa, v))
+		if (riscv_isa_extension_available(isa, V))
 			__kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
@@ -54,7 +54,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 					 unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
-		if (riscv_isa_extension_available(isa, v))
+		if (riscv_isa_extension_available(isa, V))
 			__kvm_riscv_vector_restore(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
@@ -63,13 +63,13 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
-	if (riscv_isa_extension_available(NULL, v))
+	if (riscv_isa_extension_available(NULL, V))
 		__kvm_riscv_vector_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
-	if (riscv_isa_extension_available(NULL, v))
+	if (riscv_isa_extension_available(NULL, V))
 		__kvm_riscv_vector_restore(cntx);
 }
 
@@ -149,7 +149,7 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
 	void *reg_addr;
 	int rc;
 
-	if (!riscv_isa_extension_available(isa, v))
+	if (!riscv_isa_extension_available(isa, V))
 		return -ENOENT;
 
 	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
@@ -175,7 +175,7 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	void *reg_addr;
 	int rc;
 
-	if (!riscv_isa_extension_available(isa, v))
+	if (!riscv_isa_extension_available(isa, V))
 		return -ENOENT;
 
 	if (reg_num == KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)) {
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
