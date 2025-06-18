Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB82C761AE
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9LhwMAweCnW8y5i4TfK4V/VO0nUvUlfvTajrZSJg0I8=; b=RgvD/aRgvLvoVU
	OMv2WWxcs7LSQEekPB6E2EY0kqd216HVMwvH8u/uhdEjjCwbf1PRxfsjQsQPbBK6Y/bWhuDUYNdXS
	1EU1EKn9Ow6bQjhHFnO2MaT7/3/gldWrYo+oKwhvmOAHZD3PYZQw6uvkdD9eVibQ4+jE0M9+ecnEL
	zUAlL5WTenFsXzn1ByaBwBbsNGKgPeRWMAeuVwaj631oXcz1v7F9mY03eRlMSFLzbPvm3h5pX4GWm
	g4ixrKJHi9Ak9YrTyuLjOLXO4Quza+NlCZfdJEbKSognDSn7JVzD46/4B0jdR1pn2BBlQgNIFPfuk
	M7ENMuOKIdPUptqrbc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWq-0000000AEiw-3bTT;
	Wed, 18 Jun 2025 13:08:36 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr5Z-00000009xkQ-09MS
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:36:22 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2366e5e4dbaso5709505ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246580; x=1750851380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YNO98LyRrwhUY0pfR89F0hA4+0elQu2+nOXauL2xzw=;
        b=Xyp9i0TspFU2Do3gMyr0A066m1GAMhp/dFo7fBHHuFV1cpsRO/xcRxlUjS1Iu3Luku
         F2sqzORGAQnttJcc5ohA2s/9WDoR2mzgkyRHsR6fjl0j9i2xMVzXWjNWrPLj9z4UlGCU
         M6q82Q793YcrNzqGDLnban4EO0Usg2J+rckmDrj+sxlJQKaphgQ9jcFMAuW9eOkMo6Cv
         5lpYPm6o6zK1s1NoPlVbDeY/lbW2vCOiZ6RQjGXGG486rrykzn4lOq39mweJVAL3IoJV
         U8KmJkDvor6BjknOS9gB4SvfykaMT8bV4D27Wg5a3RGSGGeTRmMY+SR3cMteaWBoWu1c
         q53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246580; x=1750851380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/YNO98LyRrwhUY0pfR89F0hA4+0elQu2+nOXauL2xzw=;
        b=VhCBuRaTmj+pL3R1JjE0sbCSeI/nor2IyHS1W4PN5tzD3uRUofAO/nuXJw20TdnZJd
         gQl8tSg1jU6k+kNYbHRUz0Ti/E0tUYR0V8gI2ZJiL4ZDpQGGWBgAzpbGZ1fmmQ1Bjbfw
         JvePrbzRmuph0hZ0EiFlC+/Iw/8xLE0KPzwPkoxScP/M3qvm3Eh2RaWuPl1W0+MBSPEn
         enstKiwAVXbuRMF7bt62ekFFLBZz0gC/6Z7EQIo59j+b1ywFyBERHnaRuHH4PhiakiuF
         fxcbYNImicPca7Zoaz8/PDW5DmmViWXUwM4adoZ8fiDo1RqYV16hWW594QC+2cmT9e39
         hD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHQkcRSJFN4MHuEt6zANQVelhGVZBn4uNUR6AAOzbCoM3x3dBcsCVjwVan6QQEI1cr2PF6zwO/NmE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfrWckIQpOQ3jiVqSayW8WEOtcQ7ZDyFzCk9Gieai7syCzDxs/
	Sb300G2DOX9Vdaw6kukt1YA3APg3Hah9H/fpDn7VJq+Euiyyzam6YKx8+26w8Czpx50=
X-Gm-Gg: ASbGncsDJTzu/Dsp/b3IS3vzlu5P4MaOMNqb4X7LLsmF0udVkLjCMZKN/yj8CXCh0Bb
	0GYd+1MsUGBY+u0S2rEVdmICS4EIwTT0zEWQIVdQgSuODAzPhO2kqcza/jk0xCZKpXj/cB6wTVF
	Ucq/N+slBqotjTo9Rg39nfWzMAPFGWx4Qozaos0+ZNDKktcdJ3PxuhuNFBRU9/vg2NR4iMz8RoX
	Gxne4F42H1JjJprTmV4SH0OVCX/38lZFKAx9NUy5Akip1Yo92Z42wuh0yJ6Y64jHDVDLpGuUXQT
	u2VroNT1+AtGWq3I9HYtJmpOdllNkrw1uamu2Fd/cOPRouzHVV3zk8AF9KoW3IMV/RfzB2rfhwA
	JUWTB0JFmHqLbcmL27A==
X-Google-Smtp-Source: AGHT+IGvNMzA4JkJB3Lqq8VqvqJDedOuU5j6cPnr0JPK19aiVhzcYh8cLYvVgF2E++GIf5MLnFvaZw==
X-Received: by 2002:a17:902:ccc8:b0:221:89e6:ccb6 with SMTP id d9443c01a7336-237c210feedmr34862225ad.25.1750246580053;
        Wed, 18 Jun 2025 04:36:20 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:36:19 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 07/12] RISC-V: KVM: Use ncsr_xyz() in kvm_riscv_vcpu_trap_redirect()
Date: Wed, 18 Jun 2025 17:05:27 +0530
Message-ID: <20250618113532.471448-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043621_067837_B7251256 
X-CRM114-Status: GOOD (  10.26  )
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

Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
