Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375F1C53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MhI6Krr01E+OBweh0LjQUkaXOQINDVO7fqWAUTMPlk=; b=ye7OkJnWfav0oy
	1SXUa00BL/n9HrxBr/uoDEEiRIzH1XnI+JmvuIfgXd2MNdkCOE4K6Lcm4/qWuygcWpDrjOM3/arsf
	UVHtJ+tzGtJ7mez58GtdsHvgXYyuulSg3qS5ioZXBHHo6TKb+gdFSuiOJuVCpFOjFzFCy/qyrrW7S
	ePx6mVefbvyLKOav9ItMTWMurLe3kmS/ZpzfUZc/Uj7vIUVD594FdZaCtGCQRWaaV/dFcfH/wxGWr
	Am+8a7gjlpFYlYI8mgCJkUiLlOfmAbmsqWVqGa6YYgge+olZk3m2RcqAYYEKZIAgjNGZOjhjX0RWw
	T2m06k0doN3gns0bkfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34h-00000007pTv-3bOn;
	Wed, 29 Jul 2026 12:07:51 +0000
Received: from mail-pz2-x01.google.com ([2607:f8b0:4864:3b::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34f-00000007pS6-0YAE
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:50 +0000
Received: by mail-pz2-x01.google.com with SMTP id 41be03b00d2f7-c9fe62e0da3so255608a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326868; x=1785931668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17CsgCdLrjv6bh5C/KKp5JjzHzr2Ra+7+GSbGZ8H4xY=;
        b=AyqVS3OKhUnx9Ce658o1EdoNcdWzGgeMm4wK9ivKrLFSTHacy8EccAJQLEyeSMO2lK
         OH50/JWoFnyRGLdvGuoal1c1wl8E7NjKyid1h9ClgN1O4HJJ5WUomIAPvldoPMdLrU2t
         7NlAdCqT5QRx4etKFFbQKQx21uAvIYnILUkxwj7x/1U4uFQUbSuzFySkRBeT2qQsuyOB
         2rqPqGSjN9/vV5WMCLgytUqffgRD+z0+MLXY15qGiD4uC6IJBJ/qmUlzes+13dwPS0yx
         zHrR2vDTKATLgEHHPn4WhV0Dv4/rE82gImsdFVWzBt+GENMAu7zAOhF8oWkaeE6MgIeS
         qF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326868; x=1785931668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17CsgCdLrjv6bh5C/KKp5JjzHzr2Ra+7+GSbGZ8H4xY=;
        b=dfWWx6xRRCy1jm+ClXeR8UfSiyZfugZ+RDMXqPxgG9bt2BBeirLlndy11gSFUJRwkM
         ndaxakZ4jnaxzFnmBmbf4vj8UkYRlT/Pv5X6q169oDiHyHodrnEIaogYcAwmx8MPBjlr
         Zmwa69k0Nh6e53nwZfWh72RLxJU4XlNXGs4GW75cdxAJs9Biv6IlnYLppx8luVlpSLK3
         UgtdI7DUcFxbb6jm8CFkLM+7uOOTF8RXcMtKlzhHU8V1ySOMVSQvtpjZh/UdcWWrgTdC
         2z5KgFEKF1pAFF+meYudiczgPrcFnTX70aWgOqS6lFiSsWIVibJ/WgGTsnEbBqujfN4c
         w+Ag==
X-Forwarded-Encrypted: i=1; AHgh+RqBmMr1t/UZJEgz6ArPaov5d1xJH36PDIMmSu5StRn2FVc0QSpkDlLEm6f5ISGQRKok6lj2Jm51CN4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLV7eeBvAVtkElsE+dTyU0JnkAFTaNS4S1ulFhWYsfZyW16uQs
	S/6m0mWHyaoMy/kFMcSsqbtkDWb4XDuuobwU4mOZL14eOdKb2iMWmuaf
X-Gm-Gg: AR+sD11RPTjD9GUt9v7ZDSUeMVGm5XdGBLQak+ABjIu03BlpkzqgXd6Jvo9qS45vwED
	ogYRcZo5GeSr/7/V9t3ITaiwSsE1xlYm+GmUba2jYSYE7CAWkrtk6VsX5v1nu3VX0KvXYk4D/kf
	0W/+ezlFOV08YTRw2xzLOJG0hY7XnAN+YeCVCMRF8sQsnhBuYWT35JMlV2iWMMw88p/ineou3sa
	ahMBSBe4/FzY7fcKcfmgVyO4aTzklFtgZfm40onWDgGImPoGlAX3zEJ6DF2BOlV/QFq9QQNORkt
	9qOVfFDZGjyOvCokL46jQY3kGyBPdPxfj/N0RUar6MhzDlFs0LbQXJMWhzdH2ON4908CHLixsRK
	lDD3fanIIaJbTFjjSQe8yo3UlC3yBc3Gc6g7aWO21AkgS1JyQdP5x+aZveD5ActpVFw19IzpcUu
	pGtwaMVIO5NvclGSzQZg06rZncpRt4CgEdFtnov1e0yMnwDRBmq9poKcG/kfzRt+lGZ/6KW1Rvg
	PG2gW6PxpFi/Q==
X-Received: by 2002:a05:6a00:1d8b:b0:846:7507:4e07 with SMTP id d2e1a72fcca58-84e9332c2d6mr6938425b3a.39.1785326868402;
        Wed, 29 Jul 2026 05:07:48 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:48 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org,
	Bingyu Xian <shanbeeyoo@gmail.com>
Subject: [PATCH v3 3/3] RISC-V: KVM: Widen G-stage fault address to gpa_t
Date: Wed, 29 Jul 2026 20:07:33 +0800
Message-ID: <20260729120733.829457-4-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729120733.829457-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
 <20260729120733.829457-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050749_180837_898331AC 
X-CRM114-Status: GOOD (  13.71  )
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

fault_addr in gstage_page_fault() and the fault_addr parameter of
kvm_riscv_vcpu_mmio_load/store() are unsigned long.  On RV32 with
Sv32x4, guest physical addresses are 34 bits, so a 32-bit unsigned
long truncates bits 32/33 at two points:

  - reconstruction: fault_addr = (trap->htval << 2) | ... is evaluated
    in 32-bit arithmetic, dropping bits 32/33 before widening;
  - the MMIO handler call: even with the local widened, the handler's
    unsigned long parameter narrows it back to 32 bits, aliasing
    accesses above 4 GB into the low 4 GB.

Widen fault_addr to gpa_t end to end: the local in gstage_page_fault(),
the (gpa_t) cast before the <<2 shift, and the fault_addr parameters of
kvm_riscv_vcpu_mmio_load/store().  The handlers' internal uses
(run->mmio.phys_addr is __u64, kvm_io_bus_read/write() take gpa_t) are
already 64-bit, so no further changes are needed.

Also in preparation for sharing a common struct kvm_page_fault across
architectures, where fault_addr is gpa_t.  No functional change on RV64.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Xian <shanbeeyoo@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h | 4 ++--
 arch/riscv/kvm/vcpu_exit.c             | 5 +++--
 arch/riscv/kvm/vcpu_insn.c             | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..a5c50dd4a884 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -38,10 +38,10 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				struct kvm_cpu_trap *trap);
 
 int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     unsigned long fault_addr,
+			     gpa_t fault_addr,
 			     unsigned long htinst);
 int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			      unsigned long fault_addr,
+			      gpa_t fault_addr,
 			      unsigned long htinst);
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6c8530b9f29e..28cf9b27bb07 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -17,12 +17,13 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 {
 	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
-	unsigned long hva, fault_addr;
+	unsigned long hva;
+	gpa_t fault_addr;
 	bool writable;
 	gfn_t gfn;
 	int ret;
 
-	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
+	fault_addr = ((gpa_t)trap->htval << 2) | (trap->stval & 0x3);
 	gfn = fault_addr >> PAGE_SHIFT;
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..6506411a3f78 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -371,7 +371,7 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
  * Returns < 0 to report failure and exit run-loop
  */
 int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     unsigned long fault_addr,
+			     gpa_t fault_addr,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
@@ -494,7 +494,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
  * Returns < 0 to report failure and exit run-loop
  */
 int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			      unsigned long fault_addr,
+			      gpa_t fault_addr,
 			      unsigned long htinst)
 {
 	u8 data8;
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
