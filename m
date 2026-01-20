Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3EFD2ED11
	for <kvm-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUXbsVHAdWb+gDDFeNSIi4dqDM59b0cAx5mlMxMnuig=; b=tYbYJ5/+CEVz3C
	RYqu9sL0D1dNb6cWdwFGA8z+jVo+2B8slAf8CofTuUuio5i5jzV9+nQztMWewjM2YNU97uff08/ny
	gKZfH7ta/ML6Nzfktc5XkwzDXpEy6VQpJvtnqaC47ha4rgxFDDZMDY7jNQ7bqAHwdU8QyVgWqZWVZ
	WzWQNhn7DftN3Wen96d+5TucYLTzj+I1snvl4VgRGHxLKfUPkrWveorEfTjJf2AdMx2mvJgqdeLeO
	uy2LKU0PV5OSw4WMIoKUW2jQCBpj2nk8Rp9xSb6rNwj5XxBPvc21JsUBgq3/ILQjM/lks+pgEpcbP
	aph3IRHlYdsjfaYU27eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fQ-00000003OD8-2nAz;
	Tue, 20 Jan 2026 08:00:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fI-00000003O7z-0q6T;
	Tue, 20 Jan 2026 08:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8OuUQbrQgmZHCSbCkZ/7w9QZEB4haD24UAPXzHec4+Y=; b=cKB3ENQCJSIY2Vgg3OxDkOddP3
	9GOqHBMFbOlnHuB45y3t594zoNEtNvgW+dwezVpu5CZJQHsGuqTG9ri4VXveYUv/fdAlz0K0w3hVx
	6DSk79p6BzT4OSiL43+j9+8+un5tlzJdSH5VHWSxvI9iDhKME/eoIsXquQQGDVJaHEmIK1ZgyoOrR
	PTCuqhsH75+rLNeaXY86PFW/wBMXy4T7mXpQb2p6SI6q+jh2Up+jeVSvJmd4msOn0cYk0C8dJ8Om/
	4dyavsnvmtDIOFVNmT+ydJ9ofVNEZ9H5s7hHPr5UUJZ/sNDIJ983q0pc2zbQyCxOsTH7lH379QLIy
	JjLyqFXQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi6fF-0000000DX1M-0KAq;
	Tue, 20 Jan 2026 08:00:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6iel23154093;
	Tue, 20 Jan 2026 08:00:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8OuUQbrQgmZ
	HCSbCkZ/7w9QZEB4haD24UAPXzHec4+Y=; b=kAMDQLCfvy5m2ZYuI5lcocipcNB
	Q2Sh0wiTNFoPdDEMCwpb2vnwf/Pe0rCxk92SWTQDaQwQlNAN2EthPf9wnuZNCYpY
	fPuZ6tW27Yd9qp42wmLsTYiQuhlVF0N1ibOt7JqZ0LJxZg/UeuEi3eItGJIrHOaX
	Vm10pfyXAwnK7vb2vNc5bVnA1eQL/x3ELO6EHQFnFAY90AEoJzG9gzGYjd/r1Q32
	pqtIUT4De+qQ61+e24N/DoOF52zEkBlrWIFOLXv74AsT1crOMhWWAmdGXBfUBQt6
	jaU/Z2WTPU1vVUlIcOOqzgSs+C+eZA0ZW49hCQYVcoguitmSv4LIfqAa1hQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4q507ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60K80GKk007950;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4br3gm8q5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60K80FQQ007831;
	Tue, 20 Jan 2026 08:00:16 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60K80GZC007893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 08:00:16 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id BEB3825506; Tue, 20 Jan 2026 13:30:14 +0530 (+0530)
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
Subject: [PATCH 13/27] RISC-V: KVM: Extend kvm_riscv_vcpu_config_load() for nested virtualization
Date: Tue, 20 Jan 2026 13:29:59 +0530
Message-ID: <20260120080013.2153519-14-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA2NSBTYWx0ZWRfX1F0e7WxQZRYm
 PyYQRk13kmsnobj1Yb8u0XNBK5lk4uXZhHJnaswoS8gOKvtoVphtHeiJMi+gRwy4zT6dNMlnBOG
 BokzFcxhCW3TJmPQEcAgly8L5qxfZLeUyWsmzmqG0iNUmFhVOnecB0CNzk1IUWNUv1nqeFwy3Rn
 /ToOxo/UPt7GIYVuBuuPj3srPnZi9Y8TRHaRo1Mx+gb8GKlr7n9i6cw8tCN6uCHmKE//LEWUWAN
 xGerYGYfYlaqnUGEfb0TC5J5SelTpwGgLagKTCpLePoAZaWUmOYKCRRO7Wd4P7/eWPYXSYtrZqP
 n4s32VVGUfj8SFJigrZXlBZnDCO4JxQ/9Mquox8U1biIXp24zecDRUrvVH0J4GDKQ+12CiLLJae
 AJx8MCFf1Pj9OCLBnlIlbk4a0hrTwptM0MLy8+K4LOybi+cDfFZEhL46JdS4DVryBuxiiyxRJ8z
 qtte/5Z0926ww1fPP8A==
X-Proofpoint-GUID: Y3S_rLnd4miq4swMHOYbJsoKOaAkVvYB
X-Proofpoint-ORIG-GUID: Y3S_rLnd4miq4swMHOYbJsoKOaAkVvYB
X-Authority-Analysis: v=2.4 cv=MNFtWcZl c=1 sm=1 tr=0 ts=696f3617 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=RZcOP4xzeWknupDpA_gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_080037_490358_242C3EBB 
X-CRM114-Status: GOOD (  15.27  )
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

The kvm_riscv_vcpu_config_load() will be also used for when switching
between guest HS-mode and guest VS/VU-mode so extend it accordingly.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 arch/riscv/include/asm/kvm_vcpu_config.h |  2 +-
 arch/riscv/kvm/vcpu.c                    |  2 +-
 arch/riscv/kvm/vcpu_config.c             | 55 ++++++++++++++++++------
 3 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_config.h b/arch/riscv/include/asm/kvm_vcpu_config.h
index fcc15a0296b3..be7bffb6a428 100644
--- a/arch/riscv/include/asm/kvm_vcpu_config.h
+++ b/arch/riscv/include/asm/kvm_vcpu_config.h
@@ -20,6 +20,6 @@ struct kvm_vcpu_config {
 void kvm_riscv_vcpu_config_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_config_guest_debug(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu);
-void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu, bool nested_virt);
 
 #endif
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 178a4409d4e9..077637aff9a2 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -560,7 +560,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	 * the read/write behaviour of certain CSRs change
 	 * based on VCPU config CSRs.
 	 */
-	kvm_riscv_vcpu_config_load(vcpu);
+	kvm_riscv_vcpu_config_load(vcpu, kvm_riscv_vcpu_nested_virt(vcpu));
 
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nsh = nacl_shmem();
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index eb7374402b07..6c49bd6f83c5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -69,33 +69,62 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
 }
 
-void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu, bool nested_virt)
 {
+	struct kvm_vcpu_nested_csr *nsc = &vcpu->arch.nested.csr;
 	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+	unsigned long hedeleg, hideleg, tmp;
+	u64 henvcfg, hstateen0;
 	void *nsh;
 
+	if (nested_virt) {
+		hedeleg = nsc->hedeleg;
+		hideleg = 0;
+		henvcfg = 0;
+		hstateen0 = 0;
+	} else {
+		hedeleg = cfg->hedeleg;
+		hideleg = cfg->hideleg;
+		henvcfg = cfg->henvcfg;
+		hstateen0 = cfg->hstateen0;
+	}
+
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nsh = nacl_shmem();
-		nacl_csr_write(nsh, CSR_HEDELEG, cfg->hedeleg);
-		nacl_csr_write(nsh, CSR_HIDELEG, cfg->hideleg);
-		nacl_csr_write(nsh, CSR_HENVCFG, cfg->henvcfg);
+		nacl_csr_write(nsh, CSR_HEDELEG, hedeleg);
+		nacl_csr_write(nsh, CSR_HIDELEG, hideleg);
+		nacl_csr_write(nsh, CSR_HENVCFG, henvcfg);
 		if (IS_ENABLED(CONFIG_32BIT))
-			nacl_csr_write(nsh, CSR_HENVCFGH, cfg->henvcfg >> 32);
+			nacl_csr_write(nsh, CSR_HENVCFGH, henvcfg >> 32);
 		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-			nacl_csr_write(nsh, CSR_HSTATEEN0, cfg->hstateen0);
+			nacl_csr_write(nsh, CSR_HSTATEEN0, hstateen0);
 			if (IS_ENABLED(CONFIG_32BIT))
-				nacl_csr_write(nsh, CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+				nacl_csr_write(nsh, CSR_HSTATEEN0H, hstateen0 >> 32);
+		}
+		if (kvm_riscv_aia_available()) {
+			tmp = nacl_csr_read(nsh, CSR_HVICTL);
+			if (nested_virt)
+				tmp |= HVICTL_VTI;
+			else
+				tmp &= ~HVICTL_VTI;
+			nacl_csr_write(nsh, CSR_HVICTL, tmp);
 		}
 	} else {
-		csr_write(CSR_HEDELEG, cfg->hedeleg);
-		csr_write(CSR_HIDELEG, cfg->hideleg);
-		csr_write(CSR_HENVCFG, cfg->henvcfg);
+		csr_write(CSR_HEDELEG, hedeleg);
+		csr_write(CSR_HIDELEG, hideleg);
+		csr_write(CSR_HENVCFG, henvcfg);
 		if (IS_ENABLED(CONFIG_32BIT))
-			csr_write(CSR_HENVCFGH, cfg->henvcfg >> 32);
+			csr_write(CSR_HENVCFGH, henvcfg >> 32);
 		if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-			csr_write(CSR_HSTATEEN0, cfg->hstateen0);
+			csr_write(CSR_HSTATEEN0, hstateen0);
 			if (IS_ENABLED(CONFIG_32BIT))
-				csr_write(CSR_HSTATEEN0H, cfg->hstateen0 >> 32);
+				csr_write(CSR_HSTATEEN0H, hstateen0 >> 32);
+		}
+		if (kvm_riscv_aia_available()) {
+			if (nested_virt)
+				csr_set(CSR_HVICTL, HVICTL_VTI);
+			else
+				csr_clear(CSR_HVICTL, HVICTL_VTI);
 		}
 	}
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
