Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1FDC71135
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fP6QBLTm4M5UnvdeSY/e3pOhXsywzWYy1NJM4yt5qaE=; b=sqTV3CIm/yRDD8
	a5+gywYk3n82ydFOBNBB6znrAJ5DYys2wjnk4KnsukuNuv8WENTXTx9hLNaNrvHQjcHTAzQMeT6A1
	zqJgv3EpLoyvzaREeIJDESzQBEcSwcc9Tw2MWfUMmLPI/Wpi+eVHaZ4gMvaqpNpMflA48wYppZZkO
	LROyA72jRkLtMmeumnrojWQDDNzZ59xYsJDB7k24BqAy6l6ji7rVo78NrMOjZAhXxTw0M/dGbgOxl
	lQsr+PNlVMYLSlYT/Bjg0bHNOAKfX43m0ryo5QoZ27Iz9rceTJR5Vzvbs3l9QtxIPP/lNyvIlm0A7
	M9Jq1NZH1TPS7141xaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMz-0000000FXdT-0rpG;
	Fri, 13 Jun 2025 06:58:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMx-0000000FXb6-2yee
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=; b=GohIML3/X9DxRy98t3ZsDe/IJJ
	qBb1/6A6OSDBOm5wfiYxS8CjE3fCIk24THqruj3Q0Sgr6BSaAJBVre4VdU95TCk+qZI0Gy5e8EgMM
	mHHvuayWRvTzKJzxRUP99YvbbYT/lbmpXnRIPPKxnBYJTP9tNugLyJ6vS7CwMoFsvm7tVKQHsrfZT
	BnpUOyXSqwxrBXPXCXBwoX4w0kDKO0KvmCT9W66dO597B7iToIxOfFfW+YC63YpIqGOdbIBv0DykK
	HBr3iuufsEXWxCrt/oQcQvrwAWpqLtFvjdycWhSTuPT8Q7XmER7oh0iuFRqZKwZTdOdh7aD419WbY
	e07Y+FpA==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMv-00000002rwQ-2c6v
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:31 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so1596493a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797907; x=1750402707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=;
        b=MLK2FEzAUth2dlt7Ji9vLKntlIthLpbTcm8JSk92JjolrqJvCh+v4PFaUt1cSNSlQp
         r5c2wu69MqGAxr64D3Ho1ga3Jxb1YZjQc599clblDvciocyRbNMchMAeaPXepvtIXib9
         981qrIGxdNQPYRBwjV74yte4zXjccwG1/2TYPKguLazcNPjE53p+aZtOuaaDOE2cI7Fd
         6BavD4hgcqBHFyv4fpceWRDCzNM5XzOICNZfloK/dYvUemAluWSAuLib+jF5Rycr08XN
         NFnr8AaYUORFDfvEKLJ8xztwJD1FaufuZ9nidsikNBG/71Vs29Bs+BirAA8OdErzVuIK
         o58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797907; x=1750402707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9NuUqyMjDjOZ8RZ5AE6YpvMfKBxH1jx9BmTdXWsOf0=;
        b=mnWE+5IvnyIqAZVdHrcfixgxXU/h4Su1WPUb6GFYsUKWZ6FJCvglXGWYvceN3PA/03
         SOwkXSNte7c8DCVCPIVBIQ8zITCPri5Ye3r+fUXhO3HyAviZVDdMs5gxnL8pxQWCtD80
         ayoAkSznMpdDTCaXBTmqGvoWXM8a11/3Q64uUeKGZ55qB9IGLjNjn57Ys4tlMUTUNLYS
         S/0KGHvTbt3A67Qk/eiF81dNW1kGUHBRWkUQzLa8vBVB0KJ/2sggL5TDL5LvszLaYKTZ
         RqLyo5JTucEk/uAU/d5qW9EKDrvL5FLDxdshdjCZZyCce8tKbVA8Kc6BVcEhvIPmr5xo
         Y8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQk/nv/CzmuhwQBl9CZKKjudaxWYCgV+ok3IMIQ9tgguI3D7XrjKrCKzMfx39jVtidylSZvKKieB8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5zlof9UJPFOFXUkYAeF0Ssh60sljCB3cpaAbmiTxf9KiYwONf
	1+7hCGkoU03ZT5gIFAIyrOXxFbEvo3tzXFbVNJAah675p6mH0b1FaSvjbQYHPBlP6+M=
X-Gm-Gg: ASbGncsmps4zhRohrmhHtAusMCWqXGwWn/4ICpOMH/mvvAoDoR0/6OT6490lyzncOPc
	Co39HdPC2Wyy7LH1kZkZG4IH9ZvUsVfhphk58YeQcuXjh23MWsmXJWveAzGtw1mSZams7aABGBE
	1zAwATMcxdgnS1J9GSyUYn/WWewUgfnw4IkUbxIQhQhiSb/AJ0/MmCoRxFPRB4tREscoGlfJJAj
	3FHys2ojvqemlDAbkJCV7i9S7MU27eVZEJcXveu6V/Flyl5/tH/AoziCFRhqBEQn4HltwNEEmAH
	j4dOwSoN5b4M0gZB8xwHgkuW3yx/A8Cku/5hw0FOYiz8RljKIKsKqxIR0N0OCQzSs809iiR1OmC
	4/UljTsaGbANg6en6g3k=
X-Google-Smtp-Source: AGHT+IE8a5t2vAc7uHbhW52m189RNr8N2yqc2jJGrHdRdfFv50kYLOdkbxH34MMXUkyP4JTNM1l//w==
X-Received: by 2002:a17:90b:2686:b0:313:db0b:75d8 with SMTP id 98e67ed59e1d1-313db0b77acmr2060784a91.32.1749797906744;
        Thu, 12 Jun 2025 23:58:26 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Date: Fri, 13 Jun 2025 12:27:38 +0530
Message-ID: <20250613065743.737102-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075829_739955_F214A356 
X-CRM114-Status: GOOD (  10.65  )
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

The H-extension CSRs accessed by kvm_riscv_vcpu_trap_redirect() will
trap when KVM RISC-V is running as Guest/VM hence remove these traps
by using ncsr_xyz() instead of csr_xyz().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_exit.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 6e0c18412795..85c43c83e3b9 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_nacl.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -135,7 +136,7 @@ unsigned long kvm_riscv_vcpu_unpriv_read(struct kvm_vcpu *vcpu,
 void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 				  struct kvm_cpu_trap *trap)
 {
-	unsigned long vsstatus = csr_read(CSR_VSSTATUS);
+	unsigned long vsstatus = ncsr_read(CSR_VSSTATUS);
 
 	/* Change Guest SSTATUS.SPP bit */
 	vsstatus &= ~SR_SPP;
@@ -151,15 +152,15 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
 	vsstatus &= ~SR_SIE;
 
 	/* Update Guest SSTATUS */
-	csr_write(CSR_VSSTATUS, vsstatus);
+	ncsr_write(CSR_VSSTATUS, vsstatus);
 
 	/* Update Guest SCAUSE, STVAL, and SEPC */
-	csr_write(CSR_VSCAUSE, trap->scause);
-	csr_write(CSR_VSTVAL, trap->stval);
-	csr_write(CSR_VSEPC, trap->sepc);
+	ncsr_write(CSR_VSCAUSE, trap->scause);
+	ncsr_write(CSR_VSTVAL, trap->stval);
+	ncsr_write(CSR_VSEPC, trap->sepc);
 
 	/* Set Guest PC to Guest exception vector */
-	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
+	vcpu->arch.guest_context.sepc = ncsr_read(CSR_VSTVEC);
 
 	/* Set Guest privilege mode to supervisor */
 	vcpu->arch.guest_context.sstatus |= SR_SPP;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
