Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17095D2ECF7
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUOXPPbMsyKhHclAFwaN9ZBkpwvYZpHZVk6nYempBbo=; b=rWCp8zG199Msug
	BEFIsKbJS49dWUEPMdGp7rqvqaREzOZBWDwfPUI7WXp51mA3FLZyQIwJS9wiHez9LhyS8+5toYoh6
	WLT/r1Nnp+kjv4zZBORDSkSJbA1VGhEbk7hvkXpYeyzfkQ2GRueJo3MO4L4G4o8561pBh3RLeVgf6
	dMRTKC1nLLt3+3yQEC/GyjWIk9lL8YeX0Mw5N+DsSsZeZm6WTF0JeqDlFCxgOu5ENmfZAPeii1fKR
	I2V2ByRDCayYtOSbC6tc7SNZHkx19cvODJqwcl8G1xQ/7twkroklXk2z/zdtbpOMoecCgBWh312Mi
	0jFF1Gup1afZnSFlCLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fH-00000003O8D-3Uqi;
	Tue, 20 Jan 2026 08:00:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fD-00000003O5G-2sub;
	Tue, 20 Jan 2026 08:00:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K184hL3365912;
	Tue, 20 Jan 2026 08:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zj+pXm6c1SE
	/dpNuWqgfA8vIfJ8YAIYLrHiF+4QfhOQ=; b=QbgepXoal6nd2Sabpg9HxgS0Fwh
	2eAHcplfthK5qhmGW3c/jeVkQkfYedYo9Ogk/VOFf3NczotvrBUkzirRApkLApAG
	YXLzgH50DBnRSh2Fp2YvZ+NzSN7aw/jkmrVt6zQczllWViZ/rXYMG0Cnx/nXFH6Y
	9ufJ8tHA57+Sq2pb28ChBHAibgltAXXjiKZj3iccU8HrqIbj6ZDKhW05+sqLSW8E
	BXJqLwsX+IXGV/e4Q1dq70M7wI2S18LQREyBqNcwudKBtVNYy5LwTTQnSNItssww
	NBlXjv1h20Z3Ia0fn0G2RKaK8MeYZ8ZzV5cgIugc2ivBONbkIo5C54BLmxQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsysb11kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80Gwc007949;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80Fih007830;
	Tue, 20 Jan 2026 08:00:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80HKp008012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id EC1B4255D1; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 26/27] RISC-V: KVM: Add ONE_REG interface for nested virtualization CSRs
Date: Tue, 20 Jan 2026 13:30:12 +0530
Message-ID: <20260120080013.2153519-27-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZCxQ-mx-JLwrZgQIotV8VaAi2Q-4HyOE
X-Authority-Analysis: v=2.4 cv=XJ89iAhE c=1 sm=1 tr=0 ts=696f3615 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=7i9L-ulwFlRkU5jsmS8A:9
X-Proofpoint-ORIG-GUID: ZCxQ-mx-JLwrZgQIotV8VaAi2Q-4HyOE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX/04nWjrpY0Na
 3K5tf8u9K1Vf8yQKWX2bvim4BymkjsDmvJt7EXKMqELB9oW7eTlYHTqxGLEStvZAKZihvwWFbUx
 MtnJAodwOhJk11mtw0L6x+A9JhKbX/uPzry2B3bDnuC07Hn2vvGrRLW/6mBHdQtNBMS3dP+RMuv
 NWM/jJiuVR70dz1LMKKHHmrD0JxYesj3QMAcXhqMZF6kRKlK2blfpDbAkdozJPtppf02VReqCFw
 HO/6OBWgGDq7E5G14oarFzkpq7JzSqFHbqsAE4DbOlFHYZYgCkcbEHQtNMDsPUM2haCRg4ECYj7
 x702d3t64BOazkUDqWSmzV4SG3diYf96FkCNWMQM8NpgqK/MZLmoHryrix5caBwKWHs7qMAThmt
 2IyTgrKdqQUhqB1cl4+Zcm1zUbVn8ZuessoZeQfnGSqcqJe6cg9PtOzfd0XlOseCCy77/+KGMkC
 Ej8YyBO+MMpUW6/g5TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_000035_746970_6C74A228 
X-CRM114-Status: GOOD (  19.09  )
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

Add nested virtualization CSRs to the KVM RISC-V ONE_REG interface
so that it can be updated from KVM user-space.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_vcpu_nested.h |  5 ++++
 arch/riscv/include/uapi/asm/kvm.h        | 27 +++++++++++++++++++++
 arch/riscv/kvm/vcpu_nested_csr.c         | 28 ++++++++++++++++++++++
 arch/riscv/kvm/vcpu_onereg.c             | 30 ++++++++++++++++++++++--
 4 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_nested.h b/arch/riscv/include/asm/kvm_vcpu_nested.h
index db6d89cf9771..9ae0e3795522 100644
--- a/arch/riscv/include/asm/kvm_vcpu_nested.h
+++ b/arch/riscv/include/asm/kvm_vcpu_nested.h
@@ -111,6 +111,11 @@ int kvm_riscv_vcpu_nested_hext_csr_rmw(struct kvm_vcpu *vcpu, unsigned int csr_n
 
 void kvm_riscv_vcpu_nested_csr_reset(struct kvm_vcpu *vcpu);
 
+int kvm_riscv_vcpu_nested_set_csr(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				  unsigned long reg_val);
+int kvm_riscv_vcpu_nested_get_csr(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				  unsigned long *out_val);
+
 int kvm_riscv_vcpu_nested_swtlb_xlate(struct kvm_vcpu *vcpu,
 				      const struct kvm_cpu_trap *trap,
 				      struct kvm_gstage_mapping *out_map,
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f62eaa47745b..a486d73e64ce 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -103,6 +103,30 @@ struct kvm_riscv_smstateen_csr {
 	unsigned long sstateen0;
 };
 
+/* H-extension CSR for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
+struct kvm_riscv_hext_csr {
+	unsigned long hstatus;
+	unsigned long hedeleg;
+	unsigned long hideleg;
+	unsigned long hvip;
+	unsigned long hcounteren;
+	unsigned long htimedelta;
+	unsigned long htimedeltah;
+	unsigned long htval;
+	unsigned long htinst;
+	unsigned long henvcfg;
+	unsigned long henvcfgh;
+	unsigned long hgatp;
+	unsigned long vsstatus;
+	unsigned long vsie;
+	unsigned long vstvec;
+	unsigned long vsscratch;
+	unsigned long vsepc;
+	unsigned long vscause;
+	unsigned long vstval;
+	unsigned long vsatp;
+};
+
 /* TIMER registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_timer {
 	__u64 frequency;
@@ -264,12 +288,15 @@ struct kvm_riscv_sbi_fwft {
 #define KVM_REG_RISCV_CSR_GENERAL	(0x0 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_AIA		(0x1 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_SMSTATEEN	(0x2 << KVM_REG_RISCV_SUBTYPE_SHIFT)
+#define KVM_REG_RISCV_CSR_HEXT		(0x3 << KVM_REG_RISCV_SUBTYPE_SHIFT)
 #define KVM_REG_RISCV_CSR_REG(name)	\
 		(offsetof(struct kvm_riscv_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_AIA_REG(name)	\
 	(offsetof(struct kvm_riscv_aia_csr, name) / sizeof(unsigned long))
 #define KVM_REG_RISCV_CSR_SMSTATEEN_REG(name)  \
 	(offsetof(struct kvm_riscv_smstateen_csr, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_CSR_HEXT_REG(name)  \
+	(offsetof(struct kvm_riscv_hext_csr, name) / sizeof(unsigned long))
 
 /* Timer registers are mapped as type 4 */
 #define KVM_REG_RISCV_TIMER		(0x04 << KVM_REG_RISCV_TYPE_SHIFT)
diff --git a/arch/riscv/kvm/vcpu_nested_csr.c b/arch/riscv/kvm/vcpu_nested_csr.c
index 0e427f224954..887e84d15321 100644
--- a/arch/riscv/kvm/vcpu_nested_csr.c
+++ b/arch/riscv/kvm/vcpu_nested_csr.c
@@ -359,3 +359,31 @@ void kvm_riscv_vcpu_nested_csr_reset(struct kvm_vcpu *vcpu)
 
 	memset(nsc, 0, sizeof(*nsc));
 }
+
+int kvm_riscv_vcpu_nested_set_csr(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				  unsigned long reg_val)
+{
+	struct kvm_vcpu_nested_csr *nsc = &vcpu->arch.nested.csr;
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, h))
+		return -ENOENT;
+	if (reg_num >= sizeof(struct kvm_riscv_hext_csr) / sizeof(unsigned long))
+		return -ENOENT;
+
+	((unsigned long *)nsc)[reg_num] = reg_val;
+	return 0;
+}
+
+int kvm_riscv_vcpu_nested_get_csr(struct kvm_vcpu *vcpu, unsigned long reg_num,
+				  unsigned long *out_val)
+{
+	struct kvm_vcpu_nested_csr *nsc = &vcpu->arch.nested.csr;
+
+	if (!riscv_isa_extension_available(vcpu->arch.isa, h))
+		return -ENOENT;
+	if (reg_num >= sizeof(struct kvm_riscv_hext_csr) / sizeof(unsigned long))
+		return -ENOENT;
+
+	*out_val = ((unsigned long *)nsc)[reg_num];
+	return 0;
+}
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 5f0d10beeb98..6bae3753b924 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -367,6 +367,9 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num, &reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_HEXT:
+		rc = kvm_riscv_vcpu_nested_get_csr(vcpu, reg_num, &reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -409,6 +412,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CSR_SMSTATEEN:
 		rc = kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num, reg_val);
 		break;
+	case KVM_REG_RISCV_CSR_HEXT:
+		rc = kvm_riscv_vcpu_nested_set_csr(vcpu, reg_num, reg_val);
+		break;
 	default:
 		rc = -ENOENT;
 		break;
@@ -664,6 +670,8 @@ static inline unsigned long num_csr_regs(const struct kvm_vcpu *vcpu)
 		n += sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 	if (riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
 		n += sizeof(struct kvm_riscv_smstateen_csr) / sizeof(unsigned long);
+	if (riscv_isa_extension_available(vcpu->arch.isa, h))
+		n += sizeof(struct kvm_riscv_hext_csr) / sizeof(unsigned long);
 
 	return n;
 }
@@ -672,7 +680,7 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 				u64 __user *uindices)
 {
 	int n1 = sizeof(struct kvm_riscv_csr) / sizeof(unsigned long);
-	int n2 = 0, n3 = 0;
+	int n2 = 0, n3 = 0, n4 = 0;
 
 	/* copy general csr regs */
 	for (int i = 0; i < n1; i++) {
@@ -724,7 +732,25 @@ static int copy_csr_reg_indices(const struct kvm_vcpu *vcpu,
 		}
 	}
 
-	return n1 + n2 + n3;
+	/* copy H-extension csr regs */
+	if (riscv_isa_extension_available(vcpu->arch.isa, h)) {
+		n4 = sizeof(struct kvm_riscv_hext_csr) / sizeof(unsigned long);
+
+		for (int i = 0; i < n4; i++) {
+			u64 size = IS_ENABLED(CONFIG_32BIT) ?
+				   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+			u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CSR |
+					  KVM_REG_RISCV_CSR_HEXT | i;
+
+			if (uindices) {
+				if (put_user(reg, uindices))
+					return -EFAULT;
+				uindices++;
+			}
+		}
+	}
+
+	return n1 + n2 + n3 + n4;
 }
 
 static inline unsigned long num_timer_regs(void)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
