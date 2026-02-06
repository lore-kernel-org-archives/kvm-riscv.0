Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04AE0ECD9AA
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LHGEehtKgZPEkzS47d3v750mAYssQ6WrcDHS/hM+nI=; b=ciVGFhdTwEn1XX
	F2njxmKpEVQ79VS9EtvEAIPcgu2JrRs1CPw8vT4jF88dGo6gSDKbEUmKPi7Oy29V4ZQBj72OK4tE0
	rPSVEPNy5P3aK4VIeRYW1CSHjhYo7U0nTosCF9Y1vNMiCK5ol16WxdIWHC9HBAjrZGyvo44kKyins
	TFCxiOe8HdCLQzf3XF1eD5i885MV6OmHQCEAWsQzM8M7p5CzlU/Ei2MekcCa3+nUbAHwmfaSoPpF4
	4i+mWtHh+1PtIzgIyphqSxdOcYwmUUcc46qzMuYE4i0kMz4i7C6oiHrIyVJXLBw3AtESjcH28dRQY
	wnTg04AZo3tNJ9AzZftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dn-0000000Ae2I-2jbk;
	Fri, 06 Feb 2026 00:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dl-0000000AdyL-1Gy3
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615IEYjW571761
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FzTAUyaLhnk
	1nNIhG4OIYl6NZIfOvt0gAkRvxrWQ6X0=; b=BaaN1TYOknrDYAdbMq8zVMa0gca
	iVe0pEs8ftQOgMiqkrltAdrjc6fN3YM3MEmRTVPJe1H1ARCbntu6kZ/tSkWMBc3J
	KwcRs0nDiXZWE6+j6+NWkzHN9lwyDREG9BhgPJQJ+Jm0r3MgzVyj0VCV2ihFkNPH
	xPxjJdLUCFxqDkD2lGP8WlOOkJRoFQvrFx/VYDSd7s/m8yaqGgswtbV/RKVJG5Uj
	8yS4nC3q3hkILkgVuyR9rvT57rCpnwoTIbIUOoyNxCAJUTnJSUOaVTUfvSwncmwJ
	Go6nfS6A7cNUgua66QPp7lKzz+iojMQ4yBZOq109/yRoVOwMRcKmx8zzqRQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c50a992mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b82974bd26so148649eec.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337443; x=1770942243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FzTAUyaLhnk1nNIhG4OIYl6NZIfOvt0gAkRvxrWQ6X0=;
        b=YpPl0Cj3TV2rL2eCfURNB+ISxYi+S0zqtdsHpoev5eH0cFYNUfy84MPp0+UTkty5S1
         Mg/sY+B4iiVD5XXvHNccvQ190dkrK61La9x6BCAeAUb1tNvv+t7xccN7z9UQD7zWlOSz
         yztBsjTx/YoGlHwIhAJGygMTFxDskmebIIRdbkTPE0y+pzZz/mxdvAAqm/CIenmOmo2L
         0qbPj2KoatGsc8xPA8Vpb+snSkTQng47g3YnNFGkpofpLh9p7uDzDadL4NcBHOcMRzkU
         MxUxNczZ8wmliKp8Tf4GsONJPOpOI59PVMnsXvo/b24w8//Boor5BFuD+85bl22m8M+e
         xgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337443; x=1770942243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FzTAUyaLhnk1nNIhG4OIYl6NZIfOvt0gAkRvxrWQ6X0=;
        b=xGXsLcFls9dJ5GxXc09oF058IYbvruQ0zF2JbEMUz86eekEDNotTkuJULbfSgsgz1X
         p88lC0RA6U3o0bXX47hDjoITtRZHKJuN2zYYhPcSJ6anZe3ODz2NV7tqnIJnPM0M+5To
         3YqSiBonsx6Gi4dL3kyNcKrkvAI4a8Dmnw4QYsqiS3QqASoxu09K4k7yDSwr9DvLO7YA
         wxf0/bRDpMbA3GRYP3jkJtZ+oiL0Q+TfR5pkaC5jnMQRoVrKrqVZcMPjSQ2/nlbVNNxo
         NgvjhG1irGQugvofOrQ5enHtCYingKN8tC0CeTrr0PJqjhsxf0qpXvaeEYDtQ8y9mhrd
         4YvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLWTTPWak7pmXlZmrF/cKSYZPXrhzcoMO1Ua26k4DXOA1eBwNX7qLeGbgWKoSujSWRFGHzyktb760=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIK2V0x2tbV5s7jcaylfz6RaiAb5i55Z6nSijA5NDVdvSOK3EH
	r/Xif3Tj8JOkR4EP0YWTouHbb+xSMcL5Xg8lU3aAc85ANIiMKtaeBjJor5H1+s/dYFf0aU2SEps
	kSRBHL6RI08emd5SRmDteMnxdrwUp+WtBVxJUePGIuy7QIPK+BJNUC38dF5kWEFUANsyb
X-Gm-Gg: AZuq6aI1E1yBehxiEmYXmXSVKUdsXf9oonHmfe7QhkozIH8eddCsA5Xt7V8c54PD8Wc
	/qG1sunVmwxkXEZ6aPLJokuvotDM8jFJAuFEPIavV1Oa2DladarTlvSXmnL1IUOFGwy1CWE606i
	xVzSXhP8rDXc0A5LdCprgn7ofA+6EFkIYhmIATRINHm1ovoCeaFwHrWSU7e3t2LuR/IFpKp0O1N
	/Z0Yxyj2Z1ALhHkifQ7q08z81DPQnEOkUUz6DDiB4ca6oAfcnADk68Da+4xldOmv+reSzUWpJ7J
	/8I2ypUia0LkPFpxkaTSe9p6wDOL0biXIziV7Lp6ACD5+gytTOzC/duzVkz3p4j3jcVWmUAOS1+
	qqNl/Yy63o9oUK2p9AkA=
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr445101eec.32.1770337443326;
        Thu, 05 Feb 2026 16:24:03 -0800 (PST)
X-Received: by 2002:a05:7300:f602:b0:2b6:af85:dd2d with SMTP id 5a478bee46e88-2b856833be8mr445088eec.32.1770337442754;
        Thu, 05 Feb 2026 16:24:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855caa061sm591521eec.35.2026.02.05.16.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:02 -0800 (PST)
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
Subject: [RFC PATCH v1 06/11] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to hwprobe
Date: Thu,  5 Feb 2026 18:23:44 -0600
Message-ID: <20260206002349.96740-7-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: gaZLoEJYV7O4cQNjZH4pHzMUGrPGa3wj
X-Proofpoint-ORIG-GUID: gaZLoEJYV7O4cQNjZH4pHzMUGrPGa3wj
X-Authority-Analysis: v=2.4 cv=e6ALiKp/ c=1 sm=1 tr=0 ts=698534a4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=J7CogLm1HqMz9eIOx6AA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX63IxgBbXC4nY
 fRz1HJqLgg76MinDJNB5sUHyCP+r4+fdp5FESYHXbBShDn+d6uuj8qnBYpEsvozqOpMsQz+TZjs
 oz3zEt1dfnRJDPLAhE3+Df/fGOMgd0vuQqCIroaTlBIEUOWwp8JNfTCxDuDvcpU0qcIO+XpUXzM
 82Q7yP0MAwxkxcZtJLRWgRVuXwOf5bb65gzrqWWqdKfLANpOTYUYxdt6qWDg89Y+ozOzUh7rGeD
 hXckBQgOoXe0mCS9gH7lUptHl30B7/ZyYdiRM+Fu1Rra3diFGYeS3XgnpwnBGHf3y2QXu+z+nX6
 576jFQHJQG1nlcpl64tBQGQlAkP14aYbAxOw8QJpZwqREkm0cP7fkORxc9KZkywFw6BpYQ4IafP
 t7YsjanDsiN8K5dFjQaTKAzwRpjjOO3DUrOguvHqTvuKTyCSCc8yXatbGyrXMKKj/Z7Uhb9euQX
 JeseLqyuL6w8YN1xbpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162405_481070_AECA7816 
X-CRM114-Status: GOOD (  17.42  )
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

Ziccrse is already present in cpufeature.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        |  3 +++
 arch/riscv/kernel/sys_hwprobe.c       |  7 +++++--
 5 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 4484f2a7f798..97226b7c5936 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -395,3 +395,19 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index c17e11caca83..8e764dbc7413 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,9 @@
 #define RISCV_ISA_EXT_ZILSD		102
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICCLSM		104
+#define RISCV_ISA_EXT_ZICCAMOA		105
+#define RISCV_ISA_EXT_ZICCIF		106
+#define RISCV_ISA_EXT_ZA64RS		107
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 6a0163b54718..fed9ea6fd2b5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -115,6 +115,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
+#define		RISCV_HWPROBE_EXT_ZICCAMOA	(1 << 0)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1 << 1)
+#define		RISCV_HWPROBE_EXT_ZICCRSE	(1 << 2)
+#define		RISCV_HWPROBE_EXT_ZA64RS	(1 << 3)
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index ca7a34f66738..b001e78eecf6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -488,6 +488,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccamoa, RISCV_ISA_EXT_ZICCAMOA),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
@@ -498,6 +500,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 76e673ab42a5..31d222301bf0 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -196,7 +196,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 	 * doesn't have.
 	 */
 	for_each_cpu(cpu, cpus) {
-		/* struct riscv_isainfo *isainfo = &hart_isa[cpu]; */
+		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 
 		/*
 		 * Only use EXT_KEY() for extensions which can be
@@ -204,7 +204,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * configuration, as no other checks, besides presence
 		 * in the hart_isa bitmap, are made.
 		 */
-		/* Nothing here yet */
+		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
