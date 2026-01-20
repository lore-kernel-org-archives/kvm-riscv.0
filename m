Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65B7D2ECF7
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSDgTsCYPcf9jN3maarbjHQLTjhzbN0AIvc3MYarG14=; b=GNVrFZeHKSaqBv
	5NV8GEvniS1pju4wgUaZawNPyfXWniW9xLbHvuTYxba66mujDkcUjpV74053y02KwyIP2ZcMsCdaI
	Li/zRJUIyovTYRQCGYVASwc/Cw9+6MxpbsMm2vrzZwDl6WCW1B+kG31ysX08KtNFuNZr7tAMbzjs0
	DSyimJKimwB9EUldI9ygi8oM83QE6ti6mhOunrZQ0EvZ49C0+RqHEc+zJDcS32r11Dutq5hpA4h3/
	Cxmv8SsKiWnIYpsHZty7Y0S6Ede0yWMsf97mIR5iiBFXml/OC2KWqnT5JLriH7PwDZ+3+uFsI+G5/
	smsrPlhbrwdM5swxesQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6gB-00000003P8s-24KB;
	Tue, 20 Jan 2026 08:01:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fT-00000003OFC-2MIR;
	Tue, 20 Jan 2026 08:00:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LaxxwPakaHP0J6+6fJHTNCpSEaD/S5LWx5xDwoV+Vcw=; b=p+1AjeaukvCWMTd9zV4q3nvs0e
	EaKAFTyeZ3RK1blY0PZsEZwBEHK8VBEdj+dvpI/74O7ogGElPpV0HeGA3djqt7nut6e9zp37waj1v
	UoeMr2DijdgnCKdEWtWDppFqocbZ17oGy3CQ8z/CSQB9lioRSORI2X0yCUY0GpiiR0FazCxtbEnov
	mWv/cLioX+aQ1zFh3n7wcgO7HgcADTJzP5Eg0rMNZec8ejUPySQEspzWQTDfXX1nifUxmsAXM6Jjr
	XGCPD+4iOCNkB6mPxfFenMYM/JeadeBA4F3NAkn18OoeiH+B5oyuSpixYyOXvzpD+dJzKyzZDn5WC
	X9xPpVAw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fQ-0000000DX68-2BdJ;
	Tue, 20 Jan 2026 08:00:50 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K2pZKZ1347293;
	Tue, 20 Jan 2026 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LaxxwPakaHP
	0J6+6fJHTNCpSEaD/S5LWx5xDwoV+Vcw=; b=i2diQnQUDhaA/c2F9STxlYpPAM3
	8S3/0uXoiMq6HrWLRNaQ7JhcgkVirpWndk4FX7mGFFr3mm2usGQNfWUZbejO/DHb
	EVu2aAntYQLZbrCM2SiScSG96zuCSO9pfR4rGqzBOTrq5B6CM/mTQEYtp7d6wOxS
	+rI/C0vnPIEimXiLlKk3RXgQ/WNRzjiM4lMM91wOfi8UkV+/R/3TrqSN7mbkdRYi
	o5aLF+klbswBuopZdS91wpKw4U0mD8+J5sPk1yD3pUWOFE7Xo0Rh8BO379/shHOO
	lloErmw71dil8oNJ+6puLDG16ay1sskd7gvR7wgGEwcKxPdZgWneuv8dGAw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdjeda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Fat007861;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80FZa007832;
	Tue, 20 Jan 2026 08:00:15 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80F20007825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:15 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 9F9E32352B; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>,
        Anup Patel <anup@brainfault.org>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 04/27] RISC-V: KVM: Introduce common kvm_riscv_isa_check_host()
Date: Tue, 20 Jan 2026 13:29:50 +0530
Message-ID: <20260120080013.2153519-5-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696f3612 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=2gNUke5l5vCDW47KHagA:9
X-Proofpoint-GUID: n8tAdbkdss_3TwU2Qp7mQWngD_9rgSbY
X-Proofpoint-ORIG-GUID: n8tAdbkdss_3TwU2Qp7mQWngD_9rgSbY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX5LNtVsSdipJ0
 NkrdjhLJutRkUaIjJzkMwdJyMp3DPlYzj0D8leRbIXgbcZFP5/H4BtyM8spNCp5QE/HDzpS/Fvq
 +N5TFrDAHgMI55tg8dh4s93amnWt8umWODA7v8PdPXUsDoiGF5x18UXaXic8zkM96Oef4rWCx3w
 aFw9JS7BEb1olQl8XfaoTjFsBpf460OEYkbA0HSBKMNPTWbQac/2n3Vb4xBfIU63Yf6tJBGmN8A
 bOyM5xj0uOvVWd92WMuMPHjFJY/HXwwy8+823AeHIO0kaS+ip69xIQj7AZObEwmdE+BGCrEBu9T
 YK+xnwekDbVS4fc7QCIR/omajLoqb1BizkoXwF/csrXZUpM4PwTMHXwLtYFdNLl9nuC37QDXdGF
 R95+xoo7fGxIaIjtFraQ49zuevZangBIOA8XXwX3jmmqurN0qC7g06dFguL43J4Dkvp4QY2inxS
 zWYGN5q/tUsEaF51jhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080048_922088_86A2600D 
X-CRM114-Status: GOOD (  22.41  )
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

Rename kvm_riscv_vcpu_isa_check_host() to kvm_riscv_isa_check_host()
and use it as common function with KVM RISC-V to check isa extensions
supported by host.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_host.h |  4 ++++
 arch/riscv/kvm/aia_device.c       |  2 +-
 arch/riscv/kvm/vcpu_fp.c          |  8 +++----
 arch/riscv/kvm/vcpu_onereg.c      | 38 ++++++++++++++++---------------
 arch/riscv/kvm/vcpu_pmu.c         |  2 +-
 arch/riscv/kvm/vcpu_timer.c       |  2 +-
 arch/riscv/kvm/vcpu_vector.c      |  4 ++--
 7 files changed, 33 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 24585304c02b..47a350c25555 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -308,6 +308,10 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 void __kvm_riscv_switch_to(struct kvm_vcpu_arch *vcpu_arch);
 
+int __kvm_riscv_isa_check_host(unsigned long kvm_ext, unsigned long *guest_ext);
+#define kvm_riscv_isa_check_host(ext)	\
+	__kvm_riscv_isa_check_host(KVM_RISCV_ISA_EXT_##ext, NULL)
+
 void kvm_riscv_vcpu_setup_isa(struct kvm_vcpu *vcpu);
 unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index bed4d2c8c44c..4cecab9bf102 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -23,7 +23,7 @@ static int aia_create(struct kvm_device *dev, u32 type)
 	if (irqchip_in_kernel(kvm))
 		return -EEXIST;
 
-	if (!riscv_isa_extension_available(NULL, SSAIA))
+	if (kvm_riscv_isa_check_host(SSAIA))
 		return -ENODEV;
 
 	ret = -EBUSY;
diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 030904d82b58..32ab5938a2ec 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -59,17 +59,17 @@ void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
 void kvm_riscv_vcpu_host_fp_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
-	if (riscv_isa_extension_available(NULL, d))
+	if (!kvm_riscv_isa_check_host(D))
 		__kvm_riscv_fp_d_save(cntx);
-	else if (riscv_isa_extension_available(NULL, f))
+	else if (!kvm_riscv_isa_check_host(F))
 		__kvm_riscv_fp_f_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_fp_restore(struct kvm_cpu_context *cntx)
 {
-	if (riscv_isa_extension_available(NULL, d))
+	if (!kvm_riscv_isa_check_host(D))
 		__kvm_riscv_fp_d_restore(cntx);
-	else if (riscv_isa_extension_available(NULL, f))
+	else if (!kvm_riscv_isa_check_host(F))
 		__kvm_riscv_fp_f_restore(cntx);
 }
 #endif
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 6dab4deed86d..f0f8c293d950 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -119,7 +119,7 @@ static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
 	return KVM_RISCV_ISA_EXT_MAX;
 }
 
-static int kvm_riscv_vcpu_isa_check_host(unsigned long kvm_ext, unsigned long *guest_ext)
+int __kvm_riscv_isa_check_host(unsigned long kvm_ext, unsigned long *base_ext)
 {
 	unsigned long host_ext;
 
@@ -127,8 +127,7 @@ static int kvm_riscv_vcpu_isa_check_host(unsigned long kvm_ext, unsigned long *g
 	    kvm_ext >= ARRAY_SIZE(kvm_isa_ext_arr))
 		return -ENOENT;
 
-	*guest_ext = kvm_isa_ext_arr[kvm_ext];
-	switch (*guest_ext) {
+	switch (kvm_isa_ext_arr[kvm_ext]) {
 	case RISCV_ISA_EXT_SMNPM:
 		/*
 		 * Pointer masking effective in (H)S-mode is provided by the
@@ -139,13 +138,16 @@ static int kvm_riscv_vcpu_isa_check_host(unsigned long kvm_ext, unsigned long *g
 		host_ext = RISCV_ISA_EXT_SSNPM;
 		break;
 	default:
-		host_ext = *guest_ext;
+		host_ext = kvm_isa_ext_arr[kvm_ext];
 		break;
 	}
 
 	if (!__riscv_isa_extension_available(NULL, host_ext))
 		return -ENOENT;
 
+	if (base_ext)
+		*base_ext = kvm_isa_ext_arr[kvm_ext];
+
 	return 0;
 }
 
@@ -156,7 +158,7 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 		return false;
 	case KVM_RISCV_ISA_EXT_SSCOFPMF:
 		/* Sscofpmf depends on interrupt filtering defined in ssaia */
-		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
+		return !kvm_riscv_isa_check_host(SSAIA);
 	case KVM_RISCV_ISA_EXT_SVADU:
 		/*
 		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
@@ -263,7 +265,7 @@ void kvm_riscv_vcpu_setup_isa(struct kvm_vcpu *vcpu)
 	unsigned long guest_ext, i;
 
 	for (i = 0; i < ARRAY_SIZE(kvm_isa_ext_arr); i++) {
-		if (kvm_riscv_vcpu_isa_check_host(i, &guest_ext))
+		if (__kvm_riscv_isa_check_host(i, &guest_ext))
 			continue;
 		if (kvm_riscv_vcpu_isa_enable_allowed(i))
 			set_bit(guest_ext, vcpu->arch.isa);
@@ -288,17 +290,17 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (!riscv_isa_extension_available(NULL, ZICBOM))
+		if (kvm_riscv_isa_check_host(ZICBOM))
 			return -ENOENT;
 		reg_val = riscv_cbom_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (!riscv_isa_extension_available(NULL, ZICBOZ))
+		if (kvm_riscv_isa_check_host(ZICBOZ))
 			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		if (!riscv_isa_extension_available(NULL, ZICBOP))
+		if (kvm_riscv_isa_check_host(ZICBOP))
 			return -ENOENT;
 		reg_val = riscv_cbop_block_size;
 		break;
@@ -382,19 +384,19 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (!riscv_isa_extension_available(NULL, ZICBOM))
+		if (kvm_riscv_isa_check_host(ZICBOM))
 			return -ENOENT;
 		if (reg_val != riscv_cbom_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (!riscv_isa_extension_available(NULL, ZICBOZ))
+		if (kvm_riscv_isa_check_host(ZICBOZ))
 			return -ENOENT;
 		if (reg_val != riscv_cboz_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
-		if (!riscv_isa_extension_available(NULL, ZICBOP))
+		if (kvm_riscv_isa_check_host(ZICBOP))
 			return -ENOENT;
 		if (reg_val != riscv_cbop_block_size)
 			return -EINVAL;
@@ -660,7 +662,7 @@ static int riscv_vcpu_get_isa_ext_single(struct kvm_vcpu *vcpu,
 	unsigned long guest_ext;
 	int ret;
 
-	ret = kvm_riscv_vcpu_isa_check_host(reg_num, &guest_ext);
+	ret = __kvm_riscv_isa_check_host(reg_num, &guest_ext);
 	if (ret)
 		return ret;
 
@@ -678,7 +680,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 	unsigned long guest_ext;
 	int ret;
 
-	ret = kvm_riscv_vcpu_isa_check_host(reg_num, &guest_ext);
+	ret = __kvm_riscv_isa_check_host(reg_num, &guest_ext);
 	if (ret)
 		return ret;
 
@@ -837,13 +839,13 @@ static int copy_config_reg_indices(const struct kvm_vcpu *vcpu,
 		 * was not available.
 		 */
 		if (i == KVM_REG_RISCV_CONFIG_REG(zicbom_block_size) &&
-			!riscv_isa_extension_available(NULL, ZICBOM))
+		    kvm_riscv_isa_check_host(ZICBOM))
 			continue;
 		else if (i == KVM_REG_RISCV_CONFIG_REG(zicboz_block_size) &&
-			!riscv_isa_extension_available(NULL, ZICBOZ))
+			 kvm_riscv_isa_check_host(ZICBOZ))
 			continue;
 		else if (i == KVM_REG_RISCV_CONFIG_REG(zicbop_block_size) &&
-			!riscv_isa_extension_available(NULL, ZICBOP))
+			 kvm_riscv_isa_check_host(ZICBOP))
 			continue;
 
 		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
@@ -1064,7 +1066,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
 			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
 		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_ISA_EXT | i;
 
-		if (kvm_riscv_vcpu_isa_check_host(i, &guest_ext))
+		if (__kvm_riscv_isa_check_host(i, &guest_ext))
 			continue;
 
 		if (uindices) {
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 4d8d5e9aa53d..9759143c1785 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -819,7 +819,7 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	 * filtering is available in the host. Otherwise, guest will always count
 	 * events while the execution is in hypervisor mode.
 	 */
-	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
+	if (kvm_riscv_isa_check_host(SSCOFPMF))
 		return;
 
 	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index f36247e4c783..cac4f3a5f213 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -253,7 +253,7 @@ int kvm_riscv_vcpu_timer_init(struct kvm_vcpu *vcpu)
 	t->next_set = false;
 
 	/* Enable sstc for every vcpu if available in hardware */
-	if (riscv_isa_extension_available(NULL, SSTC)) {
+	if (!kvm_riscv_isa_check_host(SSTC)) {
 		t->sstc_enabled = true;
 		hrtimer_setup(&t->hrt, kvm_riscv_vcpu_vstimer_expired, CLOCK_MONOTONIC,
 			      HRTIMER_MODE_REL);
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 05f3cc2d8e31..8c7315a96b9e 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -63,13 +63,13 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
-	if (riscv_isa_extension_available(NULL, v))
+	if (!kvm_riscv_isa_check_host(V))
 		__kvm_riscv_vector_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
-	if (riscv_isa_extension_available(NULL, v))
+	if (!kvm_riscv_isa_check_host(V))
 		__kvm_riscv_vector_restore(cntx);
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
