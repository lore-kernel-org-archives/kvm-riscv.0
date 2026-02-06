Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD65ECD9B5
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Feb 2026 00:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kq8apMqyqtmrW+8Ql7EBzSpZIJvsQ7Gv5eN6HrVgams=; b=UUJVrJhzxUTz6T
	WOGu2IISL079NCccVD9VSpwyBD0WcK7fyrGwH6KrduZUJuTnthsKlTJXVLSltL1c5dA/qMCtrhKk6
	tImwyyoEB8pP7iUiXbHWhXylluLIM197pRrfq8K4zKwlABmOwNn4xDcf/3P8qc2iMeS1FOH+DVr+F
	oPKHEDCNGcx2sPas3aCmVGtB0qZhSvSZzuyC1b0SwljDV7WWZ9ub/baRVSS0SFDcQEVB4DuOfkz4r
	EyrjUFtb283NZwUgkQBfFMHP9ZK4JQrfSXY8jxeY8WogLkX4shATFTT2XE+W7qPEnjQlGjSSkwqsA
	PFCny5HvFu0Jp3BzN4PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9de-0000000Ads4-0JI1;
	Fri, 06 Feb 2026 00:23:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo9db-0000000Adqh-0un9
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Feb 2026 00:23:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615KrJvA1786078
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Feb 2026 00:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0jHTOUh63QR
	itbxNqeAiRHFokl+l9LDXY55njNcfYKI=; b=JBkMcmrt2yyfc8JtxzjO+QhYVbL
	vYRnUOMvWn2v61rY2wppNXQSdmUiFFUwt/lyd16WzY43gxx3c2z/gp4tC+cE7+aE
	gOHKK8ifXL+3bWn+J6FWvquyMPHix9HOUt6/9HhyrulEzgNL1umvywUISip/fdwL
	SZTn+aG/7Y2lW2XAL0dj1U6T9bFX6h8iV/jnxq25s8Qy/kJD/qEJ9fkdIF8oYUvD
	3ksZjAd6eIEWPinqkkZ0T2rK+Os0wOySiODXcbZJVlAEOmBqFclT2s8FBZUjo0xL
	8mr9RxoUbnAyzyQXZfeJCiaAHUmaGjVhL7Jjfzu7dtb8mE7i+Ofj4QqOCmQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrgm3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Feb 2026 00:23:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b74766fae7so1462317eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Feb 2026 16:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770337434; x=1770942234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jHTOUh63QRitbxNqeAiRHFokl+l9LDXY55njNcfYKI=;
        b=gsJ7MRWwCeTP/OXC0PFLxoKh11eYgPMSvP6ccreuWPeEjW9O/CALb2yk96ZXAqvFj/
         OYG1k9bStR+lckLCgrSja3epDy9LPESGFmSavDgIFlt/wONGMA6B/T5oOJNzpLGLlsFe
         fZPocUiExJ3PxmEFF4Ezr7joOsgG8ViLIS0XuPxeXo4b7nM5NwRXc5VaiNxOeolXb6PS
         rXR9j3xJbVC5rMsDZy5n8ahq1AvkIFo0ePVXXyR0lP2VEvl5yjwPrU0Qijd7NA95+Mw1
         drQMmUJBFtHozs8DMEpmjjBI7sz/su2pBvE6MAccs8+PTpMUIPJPy2yPL4YRWyrOxRrb
         i7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770337434; x=1770942234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jHTOUh63QRitbxNqeAiRHFokl+l9LDXY55njNcfYKI=;
        b=moedCvtgdmGYI5RRVLSoJFZtxhQTsx2mv7YXa4eP3L1GqLoYx/cYVYHI1RctYk8h+1
         Ea41PRk9novRl7/9M2CWLy8508fLS49BNaiCDwjGWxPZBSy6ivPzPWLTCxt0Ymy1E1cB
         DEnGs2pN1o5CM4AHR6I0C+1qlsiNOnm11t2R+xlZVgAKIoApja1qWoeF/j1gQbsWbnmX
         JWXY0kOWK2BTEnoK0rrfSRmBU4vfV82we9j4jx05G5TGudIfTC6k6IrDxdFuEYFtu7B4
         Fw/tPcY2KhIHnpcreyvzbyzG0y1VHiXjeCF2IPstJtnjygGd+GwgLwnZXRRT8MAX7GsX
         nc0g==
X-Forwarded-Encrypted: i=1; AJvYcCW9YU/DIO4zlY7nB+LX71NBhWLnLs8e36HGyFIgXX839gDfQU0ISUFvigAe//PHl1Xs8LIyLAzXQww=@lists.infradead.org
X-Gm-Message-State: AOJu0YzftAJc0CJuTwrh2gIV0ogyhhp966ubRaRz/5S/xJtbih1uuMsw
	o692/gU1rM6fIjedF+SGtSpM3yH+Fs4n19uvpR/hrk0SjGnsAgSOvIarYBtyJt2tNxiIiMKSZEm
	Z6w21I+rQNff6pnLlp2VXjRNgAPCpsFTesgzQncnnIW0bBYXMPsqh6RfcE+/Y6icNuJUE
X-Gm-Gg: AZuq6aJZkRXPi4mIMsDRYJ6UJlkVDXhnpR9yjZlN8taFEOPIAl1fMtisYWyR0SH/v0t
	OyNNk20wUHUI+P542Y4uWFmjh/gH9TPrquwdi6OTim2TkHe2+Mmeupigc688jJrjoGSPZ9jX1LH
	Zm5LAzVnXfhasX8sxHxIMOEyXnYv9oU5CFx7zyw5SiV6WHc/sUSRSpF4K++kTWRCh6YWagkRh2P
	zNnfRJKXGsQIYUCAfPxyfP5FpOqvqOkvbqVmgkDGxW2NQvguei1EJy2I0az/liQI9kDO0rYc9I6
	nllQpcqd1VerzahI7kyXj8FEAMEOdT0UIeDbxl0PkP4bu5YxF7MbIq1ednxPW75v/7t5EvATzp6
	T7tmEvesi/D0EotbZJiI=
X-Received: by 2002:a05:7301:1699:b0:2b7:961e:1b78 with SMTP id 5a478bee46e88-2b856400accmr390636eec.12.1770337433895;
        Thu, 05 Feb 2026 16:23:53 -0800 (PST)
X-Received: by 2002:a05:7301:1699:b0:2b7:961e:1b78 with SMTP id 5a478bee46e88-2b856400accmr390619eec.12.1770337433182;
        Thu, 05 Feb 2026 16:23:53 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855c8a8f6sm637774eec.32.2026.02.05.16.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 16:23:52 -0800 (PST)
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
Subject: [RFC PATCH v1 01/11] riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
Date: Thu,  5 Feb 2026 18:23:39 -0600
Message-ID: <20260206002349.96740-2-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAwMSBTYWx0ZWRfX04heUgTv5+ZM
 grKDhOwlND16bHLYUGS995zrxHil2HuTLOh+zxZfDnHtN0Yky+IN2+X27oDAc3FYOxuF3BBhz+F
 taAf/qbvMYC6s6sL4qnAzGjI13AxyKFsridT29PFp0xGOveUF80IIdNnVA2NlcVSqY4+SvprZPZ
 6w5gF4ypyn6d4DhTM/XyLnGVsEPr4MpoEECIlfI1njPPV7MIpgVFqdVsJjNhtd4BxlFY2FH7HUP
 qe3MWjv1W1hyaDn9Mgt5LroUDsvaR0+KULGdO7oirgBlPQmhkXCBnlJFkTqsyWgs+LMe6wQrNuA
 bt/aS4RCvm25JHP7XrEavsoN/YysQtI6udbjr3Is/rJhzrmITjwlY5eYtXlPnqZVrnkBuo3INAr
 E9IvFi5NEYRDJHFIZt0EQ4MS1iqrNEW2JV/nt0is2U6blUyyHwk4IWpe8nKPLjqW6yNMVoVUu6o
 mGpYmJfMums0D91d5wQ==
X-Proofpoint-GUID: Sk6TR22BWdPCcvpT5I62o0-Uw84WIUiv
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985349a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j9gIX6CO6tostgs0pIYA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Sk6TR22BWdPCcvpT5I62o0-Uw84WIUiv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_06,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_162355_269622_25708CE9 
X-CRM114-Status: GOOD (  22.40  )
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

From: Paul Walmsley <pjw@kernel.org>

We've run out of bits to describe RISC-V ISA extensions in our initial
hwprobe key, RISCV_HWPROBE_KEY_IMA_EXT_0.  So, let's add
RISCV_HWPROBE_KEY_IMA_EXT_1, along with the framework to set the
appropriate hwprobe tuple, and add testing for it.

Signed-off-by: Paul Walmsley <pjw@kernel.org>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 Documentation/arch/riscv/hwprobe.rst          |   4 +
 arch/riscv/include/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
 arch/riscv/kernel/sys_hwprobe.c               | 169 +++++++++++-------
 .../selftests/riscv/hwprobe/which-cpus.c      |  18 +-
 5 files changed, 120 insertions(+), 75 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 641ec4abb906..03484a2546da 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -387,3 +387,7 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicbop block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
+  extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8c572a464719..8b9f5e1cf4cb 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 15
+#define RISCV_HWPROBE_MAX_KEY		16
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
@@ -20,6 +20,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	switch (key) {
 	case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
+	case RISCV_HWPROBE_KEY_IMA_EXT_1:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index cd3c126730c3..ed2621a5a47d 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -113,6 +113,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0	13
 #define RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0	14
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
+#define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e6787ba7f2fc..53731ace7984 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -24,6 +24,14 @@
 #include <vdso/vsyscall.h>
 
 
+#define EXT_KEY(isa_arg, ext, pv, missing)					\
+	do {										\
+		if (__riscv_isa_extension_available(isa_arg, RISCV_ISA_EXT_##ext))	\
+			pv |= RISCV_HWPROBE_EXT_##ext;				\
+		else									\
+			missing |= RISCV_HWPROBE_EXT_##ext;				\
+	} while (false)
+
 static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 			    const struct cpumask *cpus)
 {
@@ -93,90 +101,109 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	for_each_cpu(cpu, cpus) {
 		struct riscv_isainfo *isainfo = &hart_isa[cpu];
 
-#define EXT_KEY(ext)									\
-	do {										\
-		if (__riscv_isa_extension_available(isainfo->isa, RISCV_ISA_EXT_##ext))	\
-			pair->value |= RISCV_HWPROBE_EXT_##ext;				\
-		else									\
-			missing |= RISCV_HWPROBE_EXT_##ext;				\
-	} while (false)
-
 		/*
 		 * Only use EXT_KEY() for extensions which can be exposed to userspace,
 		 * regardless of the kernel's configuration, as no other checks, besides
 		 * presence in the hart_isa bitmap, are made.
 		 */
-		EXT_KEY(ZAAMO);
-		EXT_KEY(ZABHA);
-		EXT_KEY(ZACAS);
-		EXT_KEY(ZALASR);
-		EXT_KEY(ZALRSC);
-		EXT_KEY(ZAWRS);
-		EXT_KEY(ZBA);
-		EXT_KEY(ZBB);
-		EXT_KEY(ZBC);
-		EXT_KEY(ZBKB);
-		EXT_KEY(ZBKC);
-		EXT_KEY(ZBKX);
-		EXT_KEY(ZBS);
-		EXT_KEY(ZCA);
-		EXT_KEY(ZCB);
-		EXT_KEY(ZCLSD);
-		EXT_KEY(ZCMOP);
-		EXT_KEY(ZICBOM);
-		EXT_KEY(ZICBOP);
-		EXT_KEY(ZICBOZ);
-		EXT_KEY(ZICNTR);
-		EXT_KEY(ZICOND);
-		EXT_KEY(ZIHINTNTL);
-		EXT_KEY(ZIHINTPAUSE);
-		EXT_KEY(ZIHPM);
-		EXT_KEY(ZILSD);
-		EXT_KEY(ZIMOP);
-		EXT_KEY(ZKND);
-		EXT_KEY(ZKNE);
-		EXT_KEY(ZKNH);
-		EXT_KEY(ZKSED);
-		EXT_KEY(ZKSH);
-		EXT_KEY(ZKT);
-		EXT_KEY(ZTSO);
+		EXT_KEY(isainfo->isa, ZAAMO, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZABHA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZACAS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZALASR, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZALRSC, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZAWRS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBB, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBC, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBKB, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBKC, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBKX, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZBS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCB, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIHINTNTL, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIHINTPAUSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIHPM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZILSD, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIMOP, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKND, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKNE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKNH, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKSED, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKSH, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZKT, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZTSO, pair->value, missing);
 
 		/*
 		 * All the following extensions must depend on the kernel
 		 * support of V.
 		 */
 		if (has_vector()) {
-			EXT_KEY(ZVBB);
-			EXT_KEY(ZVBC);
-			EXT_KEY(ZVE32F);
-			EXT_KEY(ZVE32X);
-			EXT_KEY(ZVE64D);
-			EXT_KEY(ZVE64F);
-			EXT_KEY(ZVE64X);
-			EXT_KEY(ZVFBFMIN);
-			EXT_KEY(ZVFBFWMA);
-			EXT_KEY(ZVFH);
-			EXT_KEY(ZVFHMIN);
-			EXT_KEY(ZVKB);
-			EXT_KEY(ZVKG);
-			EXT_KEY(ZVKNED);
-			EXT_KEY(ZVKNHA);
-			EXT_KEY(ZVKNHB);
-			EXT_KEY(ZVKSED);
-			EXT_KEY(ZVKSH);
-			EXT_KEY(ZVKT);
+			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKNHA, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKNHB, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
+			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
 		}
 
-		EXT_KEY(ZCD);
-		EXT_KEY(ZCF);
-		EXT_KEY(ZFA);
-		EXT_KEY(ZFBFMIN);
-		EXT_KEY(ZFH);
-		EXT_KEY(ZFHMIN);
+		EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
 
 		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
-			EXT_KEY(SUPM);
-#undef EXT_KEY
+			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
+	}
+
+	/* Now turn off reporting features if any CPU is missing it. */
+	pair->value &= ~missing;
+}
+
+static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
+			     const struct cpumask *cpus)
+{
+	int cpu;
+	u64 missing = 0;
+
+	pair->value = 0;
+
+	/*
+	 * Loop through and record extensions that 1) anyone has, and 2) anyone
+	 * doesn't have.
+	 */
+	for_each_cpu(cpu, cpus) {
+		/* struct riscv_isainfo *isainfo = &hart_isa[cpu]; */
+
+		/*
+		 * Only use EXT_KEY() for extensions which can be
+		 * exposed to userspace, regardless of the kernel's
+		 * configuration, as no other checks, besides presence
+		 * in the hart_isa bitmap, are made.
+		 */
+		/* Nothing here yet */
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */
@@ -287,6 +314,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		hwprobe_isa_ext0(pair, cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_IMA_EXT_1:
+		hwprobe_isa_ext1(pair, cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
 		pair->value = hwprobe_misaligned(cpus);
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
index 3ab53067e8dd..587feb198c04 100644
--- a/tools/testing/selftests/riscv/hwprobe/which-cpus.c
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -83,9 +83,9 @@ static void do_which_cpus(int argc, char **argv, cpu_set_t *cpus)
 
 int main(int argc, char **argv)
 {
-	struct riscv_hwprobe pairs[2];
+	struct riscv_hwprobe pairs[3];
 	cpu_set_t cpus_aff, cpus;
-	__u64 ext0_all;
+	__u64 ext0_all, ext1_all;
 	long rc;
 
 	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus_aff);
@@ -112,6 +112,11 @@ int main(int argc, char **argv)
 	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_IMA_EXT_0);
 	ext0_all = pairs[0].value;
 
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, };
+	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
+	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_IMA_EXT_1);
+	ext1_all = pairs[0].value;
+
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	CPU_ZERO(&cpus);
 	rc = riscv_hwprobe(pairs, 1, 0, (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
@@ -134,20 +139,23 @@ int main(int argc, char **argv)
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
+	pairs[2] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, .value = ext1_all, };
 	CPU_ZERO(&cpus);
-	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	rc = riscv_hwprobe(pairs, 3, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
 	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == sysconf(_SC_NPROCESSORS_ONLN), "set all cpus\n");
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
+	pairs[2] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, .value = ext1_all, };
 	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
-	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	rc = riscv_hwprobe(pairs, 3, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
 	ksft_test_result(rc == 0 && CPU_EQUAL(&cpus, &cpus_aff), "set all affinity cpus\n");
 
 	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
 	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ~ext0_all, };
+	pairs[2] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_1, .value = ~ext1_all, };
 	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
-	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	rc = riscv_hwprobe(pairs, 3, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
 	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == 0, "clear all cpus\n");
 
 	ksft_finished();
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
