Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E81CCA462
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i92wHCnDoyueCKL4JZFctV/eigjDX+8zu4ZW9P6gEcg=; b=aL3M0G9AzDGT0l
	+CF4cQ0YE891IIQO2BsFRo7rSCw1HvkJG+eJqzzbIJZ1lgfSdeKbjMm5O1qyfDyNTtZQFOAJfVm4H
	LCgDrDuBwKMoANLrQQGBks3ASPEVyB3meB2/WXrvJPmtjGFz16n7KRXNspAlDdvoyzb/fjdUsO1aR
	QlJPD17tfNI+76POfwcSdYyA/cNWV6VrBkydBvADoaXCOJO2NjosG4remd1EbQ/IdyU7OAnUv/v59
	0E6kN0NuUQNiNl4ocUr8+NDhZnRtEnUPgFFOVrKCcu16eEDzdzyDWuUhcnvmp4uHyP2v7/jiPls5V
	Y496ec3UdaLRyNzoKDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeyA-00000002aMT-1e6P;
	Fri, 16 Oct 2026 10:15:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHey9-00000002aLn-0gxj
	for kvm-riscv@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=; b=f0xDE0X7ZupzCq/G4JWvnhM2dd
	r+MJyTH775/ustvyfpOzR/LE3K16oJff0asbCGwUxA0N6FxpnNnZCeUAEiCN6TC+nIjQ261ncWSJh
	7kTDdVMXnBBuxvUI+FRr/7becFEC2+g4WFo5sLwib5q57lU+DKfjfm0LgCYquQ1AOzvL/faWTTpzH
	nh4P3hhLxSvuKKUy+8YpXpAAqy2GtcPqTcK6KLmMIg+MiptPhRZE/jrph1+K+gi+zYKxCDj0Y2HP2
	UEOqqM9pQPumIKU3CUgtm676dW/SJCZSph3Ed8SBrOC3y6hO+0yb33GaiGjxanxuliUJ6F9XVjDkc
	6usxHI7Q==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHey6-00000001MdT-0xVI
	for kvm-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 10:15:20 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc147d86bebso568580a12.0
        for <kvm-riscv@lists.infradead.org>; Fri, 16 Oct 2026 03:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792145715; x=1792750515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=;
        b=I4AnClJJpBsUjoomJCSr8Wmi2RKggkmlN1Y+jfWT18RFVCuotAXk3URdXsAGAD7doP
         aSnqGJc/2qRdxzK1/f/1Pqawf1tbOhe5+lvA+xxAF9Zig9scg7FMAQqsJwwOef316oOq
         3naSS7AxqCrSc0KAMjn/qhrID54/Ot8Dh4QnhEMGk2sR6oOROOB5Vkq4CCU6IOJunO2/
         uPCHJb9SGncmvlumTuv1CQbZhR5RasElwiwoIP365GGO6Cng1ME/OjlCniJUaTMrBkGl
         xpiHAPNuloBbeYkT7Xq8vPF+B4uOrTCEnvEurTMGbtx9G4vFKmawXbGSELtfI91s7Mdz
         HZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792145715; x=1792750515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vf6qHtCJHYPPUhzxjpIczur0NsiTKA4BX6nz592iMDQ=;
        b=IRWKIHQur4zXCKRZWs/YsILA5Wr+eDvD8J1p+fOkRMx7Dg50lFTe1NJnwFkqGpEahf
         nNTJZ1Ie1ciGqSw7Hh9KhMB8PxLYGFh5d1EO1JcDX3TA0e2AFoUXZg/gB3Fxu7709YFl
         TEO4Z0zwLrIyW6fpp6UOzH8PuHFyDfmyC4kq7UMP6DysISkko80oW8tr7jqxdlup8Mnk
         2Zj1VUQGSBANkHzmOK3dnTnMBkaM/p1Qp6GVqUBURPAeI3uGU9hcO3E1M5Pqw27bVygg
         lRpDoccB5qcYCJBXXhXqmM68Y0xeW7BI4q8LDdHT1qrSGi6smzWhOm/iD3BiZyFpNddX
         84cQ==
X-Forwarded-Encrypted: i=1; AKwUvBydmUUGLz2hNCHfx4wXjPS2F/FD3dT059uC48gBdcW/UKIPooLAdqoMr8u+WiHn2Iq42BZ5j0cbtWQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKl+MsA6TeG0ptHeyyHKgNc1gUypLBBs0t4G4uGkiVOmVdewXS4
	kP4vvToHqh19eUYnnXyDFxTGR+0moWRL7YE+iNPEutEOkJxDCpZEwVdE
X-Gm-Gg: AYBFou2zwE7kmT+rIx2WNdEtT9h+/8vPTbaSDSnWF2jQ/mAaSdDB2cngC+t5x0QowbS
	Pv/VPd68AkF9MBGCQkZWv+dPJX9/rqg8r5M3xsyFVHRQxO/oax9HK1982KtNIgdaCEQG3TWrlgx
	JLgr9Tm5AO3JROrjWC1Qy0kpXioTYmyiolMLb8DG4/iRleeJqWW59Hr2HdvcYdbQfLQjZRovh3t
	KUwppa4a9GhkpwBwhwAx/Iv0IWWs60+L0rXewAAhHiSrOnT1g39nc4Xsziu2wQxZ33CmD+KboDW
	t7tu9CE5ZQ8Z84Id59i6ZE0fe1bZYUYJZg3Lwk3/aZ4kIbrnlKgM6LEkLbPBMPBatoe1Gti584X
	Ql/pBdUjsn2DQbELxGe5R2UfDDXHZOaOg1S4Z2YdBH0X0OkDZkBgsGVgJ1xSd8nZhTIFzX6JFZc
	EePDKr30nuoUCr5C6aZGVs2DAWrric+QCmSc7vTaCuHO7twhPsdrrn7Ksb3i0/6dOGlvjC7tSm2
	lXUb7HRxPKPAVHfl33rpA==
X-Received: by 2002:a17:903:2f8b:b0:2df:b004:df28 with SMTP id d9443c01a7336-2e9772b0555mr20367255ad.35.1792145715452;
        Fri, 16 Oct 2026 03:15:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e85fd1dsm7876465ad.49.2026.10.16.03.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:15:13 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: anup@brainfault.org,
	atish.patra@linux.dev
Cc: tjytimi@163.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andrew.jones@linux.dev,
	pbonzini@redhat.com,
	seanjc@google.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault fast path
Date: Fri, 16 Oct 2026 19:14:58 +0900
Message-ID: <20261016101458.221648-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_111518_509020_1370D697 
X-CRM114-Status: GOOD (  13.12  )
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

kvm_riscv_mmu_dirty_log_write_fault_fast() considers a leaf with W
and D set already handled, even if aging has cleared its A bit.
On hardware that faults when A is clear, the fast path returns
true without setting A and skips the slow path that would set it.
The guest retries the same store, but A is still clear, so it
faults again. This repeats indefinitely, preventing the guest
from making progress.

Host reclaim or page_idle can trigger this while dirty logging is
enabled, potentially hanging vCPUs during live migration.

Require _PAGE_ACCESSED in addition to W and D before treating the
fault as handled, and set A along with W and D. The existing
cmpxchg loop retries if aging changes the PTE before the update.

Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
Cc: stable@vger.kernel.org # 7.2+
Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
---
Testing:

On a HiFive Premier P550 (EIC7700X, which traps on clear A/D bits),
run:

dirty_log_perf_test -v 3 -b 256M -i 3

While the test runs, repeatedly mark all system RAM idle through
/sys/kernel/mm/page_idle/bitmap.

Before the fix, the test did not complete its first iteration in
over 11 minutes, with lock_stat showing about 16k read-side
mmu_lock acquisitions per second from the fast path.

After the fix, all three iterations complete, each taking about
29 seconds under the same aging workload.

 arch/riscv/kvm/mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 78a1826c466d..042d1e3b3547 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -591,14 +591,15 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
 			dirty_marked = true;
 		}
 
-		if ((pte_val(old_pte) & (_PAGE_WRITE | _PAGE_DIRTY)) ==
-		    (_PAGE_WRITE | _PAGE_DIRTY)) {
+		if ((pte_val(old_pte) &
+		     (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) ==
+		    (_PAGE_WRITE | _PAGE_DIRTY | _PAGE_ACCESSED)) {
 			new_pte = old_pte;
 			ret = true;
 			break;
 		}
 
-		new_pte = pte_mkdirty(pte_mkwrite_novma(old_pte));
+		new_pte = pte_mkyoung(pte_mkdirty(pte_mkwrite_novma(old_pte)));
 
 		if (kvm_riscv_gstage_try_update_pte(&gstage, ptep_level, gpa,
 						    ptep, old_pte, new_pte)) {
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
