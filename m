Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94C6ECD9B8
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLBU9qDXm5VKoCm8pk1x7XHix/Rmj16z86SgCI2Y7Y8=; b=V9eGcIBbw1/zQE
	kAg1Gcoird6OWcRf9CgotKDP5qvx7f0GnNiNyB4G3VPRRXNHIkqNMpHIS2t4Os3bEis6OO4sgZ9NG
	bveJLreIADssvkgEATlbdHBosH2lo86jSCYwhVNcW7QOUI1yNpk1j315SOWw41dnZ7fedzrLVwmUJ
	ePVLuHkYOFwk7inJ5PWtS81HgRTeVPQYOWRWcKiNj6USQtFxoR3P0JYLL4T3BBV1qOfDPq52XkESY
	GiaSbvoSUKT1WWVSL/c4Y69yLraPReUdej6rrvMlB8wMi/E+NGSZQa/o8G+mrNtdO9JpziuZ52C41
	AqT2WIqTDrwIkz4KwGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dt-0000000AeBa-1ggy;
	Fri, 06 Feb 2026 00:24:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9dp-0000000Ae5t-44Yg
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:24:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615KrJvD1786078
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GRhkT6XuzXe
	TcgfvEvh6FIBCnEJ+12XAdAE/Omn9bwk=; b=KzRJR4GAbWKyjYj+jnu7+3Guohk
	Qd1yMN91F1ZZt4lVRpwn94YYyjbXoxosbdxcFPM1TM3v8L0o9MfqJxp0neiYBAX8
	qSl+4qtSvtIDTOD4ZLDFinr1HfQ8mE+WTMHlr5PWNUM/7RYGqwrdcjTocvVHqdfE
	hmHo6DAvh1fOmGzDFXYDvfyDhbHn8e4bV1lViIa1WQ3Ek752FPWDCZ4cKYKuhyzy
	FVniluB3q0eyFcptcAxRuOW6BiEu8WXAraI14QvLiZmm/vXu2f5Izy4s/V4gVarN
	iVXaGL43m+SLVEw6qIElYIzUJafPjR2Q2ozHX/C6jhjFa8yPY8r3O+EPflQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrgm4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:24:09 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1233b91de6bso201997c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337449; x=1770942249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRhkT6XuzXeTcgfvEvh6FIBCnEJ+12XAdAE/Omn9bwk=;
        b=Y9JrLXmALYz565J55Pg409z8iBK53fqBt2gNPMmGJDY4ggImaHNtqArCfVpIRQ4dGZ
         bVQu1A2gYMpUoa1yzmJqNHTMAOUTZEuz1ZXc5UVdwMwFoTRu6fHMM3ovoXden8ghSPWx
         DNKW047+/H/kRO29YZbepxvH/+UlkelwN+7lba5/NiClPA110V0b9JTG6KYQAMpucKGF
         ri+DFvmYMed8lKA3mb8Br+olGB0y2Bt4Qqaxfs1wpw445IneHKz2eE/YY+5DYQZywe/T
         9nYMU35djiwbOv3WDIn7m+P7ZlH6R15EFLhi0AXG1txQZ8R/x6Ww5YQdyPY1y1CyVEkI
         7t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337449; x=1770942249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRhkT6XuzXeTcgfvEvh6FIBCnEJ+12XAdAE/Omn9bwk=;
        b=J4PIJyjg3XBPVnn76nPs+y6ndo/AlsWo76ttKmxgLUvTfhBiWcD1tAZkYmRgUDm5Mi
         dL6WgRvUyKVT6QSl+nxXyOL4/otbIvVSsvLW0lyYjeB4nP0bxRoqyo9hfhNxIr8TR8A0
         o4hbmW3hv/Oe76TjrCLHHWgGpFU/Wkvu3zJAQ0hsPax09gRZucEc2y6FTiyxnTMIIiNR
         IcqiaMwS5hayM3B5EwipttsW4yJY7Dv1BUKmNPKbtyeFu4zuJ6gl/BC+P65HKlfIP0Nu
         HV4tF7+U3E5SUZxw+afZXP1vQs/Q+ByTpus+bIF52Wotg3GWDOPJrfVP1HHcO3/IHaqz
         37nA==
X-Forwarded-Encrypted: i=1; AJvYcCWYCF73GFwfjiWqrUBXK5Ikyy5r9hzNtseDbQyscFarYfAEwoktymp/wFRjcwzVo1R4o3GbuIe9oGk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgo4RT8BhH0ldpPD4LSPcSezh4YAvdrN90xWiMVzN6lMmZ7Mnk
	cTSKGLSMR53tbaS8i/KgjzICOojHXJLXdqfjWnBADVhuh7N7eetajQLiH6GeVrMx5jUoh01iDGl
	E2eaAOvWSljx45tKBCKrKLlnYehyVVm950P3S09wR0/r2bwESLA3ybZ1x32PD1KxIP7u7
X-Gm-Gg: AZuq6aKMWK4McW3v9vNaCvNv36w/ygHuhhU+06+79Wen2QeMRQQhRk5b6NpQqZZ/EZp
	+5/dYh3YiQYzZ66HiJef+2R7XpfNkrFW1rk4nFmbYFBKV1w2l7Kmnk7QwbEO4XEFcvNOVWs8Lv5
	wQzmUCFK+vBR7rvTEdBtWNdRGpdDuHsd6opxQiYpZXCtYhTDT0oC8oMrnx82mnTnogT6slsRxkw
	xbRyU/mv1jsIh4NKiFVF24WfsgZ9DkouZt1NjIolYCs3WZF0owumegAG2Q3Um2YeLcMc5O2T4CJ
	mXYfLol1PFriRXMFZadCuwV6vXxfkiLMzfHF70zf/H1GsLfCVkuxvA6K3PuLRbpuYfVbWozKwWt
	jbEUFIghYafZn2+1WgRA=
X-Received: by 2002:a05:7022:2527:b0:123:2d4f:ef1c with SMTP id a92af1059eb24-12703ff4c81mr360678c88.26.1770337448575;
        Thu, 05 Feb 2026 16:24:08 -0800 (PST)
X-Received: by 2002:a05:7022:2527:b0:123:2d4f:ef1c with SMTP id a92af1059eb24-12703ff4c81mr360665c88.26.1770337448020;
        Thu, 05 Feb 2026 16:24:08 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041d94cesm605982c88.3.2026.02.05.16.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:24:07 -0800 (PST)
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
Subject: [RFC PATCH v1 09/11] riscv: selftests: hwprobe: Check rva23u64 consistency
Date: Thu,  5 Feb 2026 18:23:47 -0600
Message-ID: <20260206002349.96740-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX/BB2WyCe5lUG
 /InBcfCCqbOLo9Z1cTKGD29h/ss5fTq++xlKBo9Zt8NOASBAfHmQCCttey/OkEyuV/x8OuK5B3i
 NqX5DciJBpXvLcDn9holoB07QOHtHNhQpvdfXLbbinLc/6P6Dx+EZvmlXM1jH2ODv73op1YmzXE
 o2iowA4Ys/8rCP4ORpzQbNWQLBPkF8I1dBFMLfuX+3xRNjSZtXZMNrmVNvnxBkp0piEPzdPdyLj
 pe1rOR/H5n9I/xevtx23fHZRijMWRZZkzbxIvMZFwlhbVFmEW9+ZTXmigIeFG0vr86J5U1Kne7u
 ExHMSjrdfLPhcSByGXYQ7zs8kmk6siUT0Nfia61Skod2eOxhHNBniti6In1w0dmnAq974CpFsuj
 FCD5thdHn2bOpz5ZjVSZzW7nLD0ba5/kHMfB0NmiZpoTjlgCDHgMilQnAS8hj5Li1j9EmoR66pP
 lBcSw7rm3VBaflnlpqg==
X-Proofpoint-GUID: zR9LJzrzQpYNlwlsXJD9ZzKcTlIm7oBY
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=698534a9 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=y9hzm5t5Ul_F05FwlnYA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: zR9LJzrzQpYNlwlsXJD9ZzKcTlIm7oBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162410_042650_C299958A 
X-CRM114-Status: GOOD (  15.57  )
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

When the rva23u64 base behavior is advertised ensure all its
mandated extensions are also advertised. The prctl calls are
necessary to ensure PMLEN=0 and PMLEN=7 are supported, as that's
also mandated by the profiles spec for rva23u64.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 .../testing/selftests/riscv/hwprobe/hwprobe.c | 112 +++++++++++++++++-
 1 file changed, 111 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index 54c435af9923..780658867313 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -1,7 +1,115 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <assert.h>
+#include <uapi/linux/prctl.h>
+#include <sys/auxv.h>
+#include <sys/prctl.h>
+
 #include "hwprobe.h"
 #include "kselftest.h"
 
+#define RVA23U64_HWCAP ( \
+	(1 << ('I' - 'A')) | \
+	(1 << ('M' - 'A')) | \
+	(1 << ('A' - 'A')) | \
+	(1 << ('F' - 'A')) | \
+	(1 << ('D' - 'A')) | \
+	(1 << ('C' - 'A')) | \
+	(1 << ('B' - 'A')) | \
+	(1 << ('V' - 'A')) \
+)
+
+#define RVA23U64_EXT0 ( \
+	RISCV_HWPROBE_IMA_FD | \
+	RISCV_HWPROBE_IMA_C | \
+	RISCV_HWPROBE_IMA_V | \
+	RISCV_HWPROBE_EXT_ZBA | \
+	RISCV_HWPROBE_EXT_ZBB | \
+	RISCV_HWPROBE_EXT_ZBS | \
+	RISCV_HWPROBE_EXT_ZICBOZ | \
+	RISCV_HWPROBE_EXT_ZKT | \
+	RISCV_HWPROBE_EXT_ZVBB | \
+	RISCV_HWPROBE_EXT_ZVKT | \
+	RISCV_HWPROBE_EXT_ZFHMIN | \
+	RISCV_HWPROBE_EXT_ZIHINTNTL | \
+	RISCV_HWPROBE_EXT_ZVFHMIN | \
+	RISCV_HWPROBE_EXT_ZFA | \
+	RISCV_HWPROBE_EXT_ZICNTR | \
+	RISCV_HWPROBE_EXT_ZICOND | \
+	RISCV_HWPROBE_EXT_ZIHINTPAUSE | \
+	RISCV_HWPROBE_EXT_ZIHPM | \
+	RISCV_HWPROBE_EXT_ZIMOP | \
+	RISCV_HWPROBE_EXT_ZCB | \
+	RISCV_HWPROBE_EXT_ZCMOP | \
+	RISCV_HWPROBE_EXT_ZAWRS | \
+	RISCV_HWPROBE_EXT_SUPM | \
+	RISCV_HWPROBE_EXT_ZICBOM | \
+	RISCV_HWPROBE_EXT_ZICBOP | \
+	RISCV_HWPROBE_EXT_ZICCLSM \
+)
+
+#define RVA23U64_EXT1 ( \
+	RISCV_HWPROBE_EXT_ZICCAMOA | \
+	RISCV_HWPROBE_EXT_ZICCIF | \
+	RISCV_HWPROBE_EXT_ZICCRSE | \
+	RISCV_HWPROBE_EXT_ZA64RS \
+)
+
+static void check_rva23u64(unsigned long *cpus, size_t cpusetsize)
+{
+	struct riscv_hwprobe pairs[] = {
+		{ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, },
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },
+		{ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, },
+		{ .key = RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE, },
+		{ .key = RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE, },
+		{ .key = RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE, },
+	};
+	long ret, pmlen0, pmlen7;
+	unsigned long hwcap;
+
+	ret = riscv_hwprobe(pairs, ARRAY_SIZE(pairs), cpusetsize, cpus, 0);
+	assert(ret == 0);
+	assert(pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR);
+	assert(pairs[1].key == RISCV_HWPROBE_KEY_IMA_EXT_0);
+	assert(pairs[3].key == RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE);
+	assert(pairs[4].key == RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE);
+	assert(pairs[5].key == RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE);
+
+	if (!(pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64)) {
+		ksft_test_result_skip("rva23u64 check, no RVA23U64 base behavior\n");
+		return;
+	}
+
+	assert(pairs[2].key == RISCV_HWPROBE_KEY_IMA_EXT_1);
+	assert(pairs[0].value & RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+
+	if (prctl(PR_SET_TAGGED_ADDR_CTRL, 0 << PR_PMLEN_SHIFT, 0, 0, 0)) {
+		ksft_test_result_skip("rva23u64 check, failed PR_SET_TAGGED_ADDR_CTRL\n");
+		return;
+	}
+	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
+	if (ret < 0) {
+		ksft_test_result_skip("rva23u64 check, failed PR_GET_TAGGED_ADDR_CTRL\n");
+		return;
+	}
+	pmlen0 = (ret & PR_PMLEN_MASK) >> PR_PMLEN_SHIFT;
+
+	ret = prctl(PR_SET_TAGGED_ADDR_CTRL, 7 << PR_PMLEN_SHIFT, 0, 0, 0);
+	assert(ret == 0);
+	ret = prctl(PR_GET_TAGGED_ADDR_CTRL, 0, 0, 0, 0);
+	assert(ret >= 0);
+	pmlen7 = (ret & PR_PMLEN_MASK) >> PR_PMLEN_SHIFT;
+
+	hwcap = getauxval(AT_HWCAP);
+
+	ksft_test_result((pairs[1].value & RVA23U64_EXT0) == RVA23U64_EXT0 &&
+			 (pairs[2].value & RVA23U64_EXT1) == RVA23U64_EXT1 &&
+			 pairs[3].value == 64 && pairs[4].value == 64 && pairs[5].value == 64 &&
+			 pmlen0 == 0 && pmlen7 == 7 &&
+			 (hwcap & RVA23U64_HWCAP) == RVA23U64_HWCAP,
+			 "rva23u64 is consistent\n");
+}
+
 int main(int argc, char **argv)
 {
 	struct riscv_hwprobe pairs[8];
@@ -9,7 +117,7 @@ int main(int argc, char **argv)
 	long out;
 
 	ksft_print_header();
-	ksft_set_plan(5);
+	ksft_set_plan(6);
 
 	/* Fake the CPU_SET ops. */
 	cpus = -1;
@@ -62,5 +170,7 @@ int main(int argc, char **argv)
 			 pairs[1].key == 1 && pairs[1].value != 0xAAAA,
 			 "Unknown key overwritten with -1 and doesn't block other elements\n");
 
+	check_rva23u64(&cpus, 1);
+
 	ksft_finished();
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
