Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B74CAC58E
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 05:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=otjYc32htULOuyz0/FDV9RTRs+/P18ivhsFoSw+9ndk=; b=mETgZEA3p+UhT3
	K9N1fPC3DlY4rEKJI/kYfnw/cGSbLh9AgfTASgJ8Ve0/JBP+LimyPELmIy86onXH9gLIBHCwLFiP0
	ci37q5pGXBH5C+Zs8CpeNg+9R9yDyRUsGaR0qGknsFA0Vll2wIbLvdvGvRw0MFaypKZyds2DYMGsW
	Ly93La2W1Y0xlCIEkxofy9j4XDSoflCCTcAPAnnU7jOteqLBzNmrLWBQ7chR2NuLayfXWI4uFJDDx
	VbOvW93K0fgj6MohtBoDCAmqticlzBj7KicwAdzc/LeAb1VPrkBeFm7JMQ2x9soPp4rTY33si4dcp
	hizCV2sjJqR6a6e+qCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1rI-00000002qeU-0NhS;
	Mon, 15 Sep 2025 05:34:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy1rG-00000002qds-11w9
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 05:34:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so2995977b3a.3
        for <kvm-riscv@lists.infradead.org>; Sun, 14 Sep 2025 22:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1757914473; x=1758519273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcWOum1mNBViAIuGhSYHqBX6ni4rWoPSQnGJMRFhyRI=;
        b=bPnokRpS0PBV+9vMiGypvIB5QcCzW7r1hIhFK6nncoN6efD8mN86gz4W64zDHorKMB
         8QY8w7Ns0cRRemWJYH9TqQ5jPhWXTLqtNwpQhl1a9MPDyWYyL5IsyjNCJVA/9J7cS4ep
         Is0IIrk02qrto9p/ve6lXUOs8IElFsdXtgHrkr46MCf49NDPyuQHzTr7kwehOSpxsJhU
         k14GyQOY+oS+0AqkuQr0tzF2VAeKJkWutBBgjXeiy9uqVeSSmep8CKfFyMC9LbF5jpeD
         5INPZuLzTdJ/qwPvZl54KamWtS5ME1LFbSJ8rr2stHFuSHUXuC0AfGx7b7U6/POvJuIH
         fCDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757914473; x=1758519273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcWOum1mNBViAIuGhSYHqBX6ni4rWoPSQnGJMRFhyRI=;
        b=p8PPT2INyPJ7zJIUC+er7v7tdW5GMXgOUQl7Is1PkpIJZ9lo1kbyKwWWepy5PXGnRw
         DGN8ci/di7BNvU/YF7nudjqQOMlPYI5tKs9yz2v6Jzbtm07IquY7xn/5BuD68YHRy52s
         atxgKp1mcGpznsVqS4RrhAcb6bR8BEvNAklNxAnNl8Lpxb2KaIl/PQSPHbByc9u5tHeu
         Vio2OaZ1upI5M3PT/HLq2CuwD2NZwFzitls4vuqSRPUo9VgjE/fLmDNa8Rc5Ewo4uvxs
         W7u3+tL9xFYuNfVjde6f939UK17TDa2Oes2XN1yYfEvAwh9U1Fz+vooMB3SeqMBHdU6w
         AgxA==
X-Forwarded-Encrypted: i=1; AJvYcCVH7lGSAweOAmdbvBkxAxGTsjaeJocf5/o/CUGQwZvou6i1+SETRFXT7oxeNbOthJcylSTWkZYS5aU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfOAe+UtWvwbW45ha0NETtFn8zyI/5jQF2gEikMROECq6WTP+
	ya0xDRDoB6WAO+WxrYhS4JCKVIozQCRCqi7sX8pozy61+8ENb1+wEc4HhsSU8VO8eTc=
X-Gm-Gg: ASbGncswhVrSksFqVNNWFA0iBbeaGta2p6NVgXU6Z6v3LNswphJ8e89Qq5Kaz4nXket
	af9AVMfG/tC0ToHxjRLM75lach1aotFx26wYJ+NCs2qeaegUvzz3vg9Vc4GOzTD21eaDivSBJ18
	WBL/G/gzOryZlGzkuRcjLkUq+PhC7qZQptIBwG2M1k9lEAW7yKVySEkCUw1Oq39Spx/ppIU/Fgw
	0FGELoxMFDEXovOs/dE+lErlbGNEQDAKUXt4e0Pfvm6qpF1mTyQYaxXn5EHt8UXWnOz0gnZQlMu
	E5td/WLL5DIfmI0eGTBHl71fVa4ElCTLYIkt7zBacdiJzCKA8+WWdSPSlPbXKGa34tP4RUAxU1R
	s2fv++WQEVT1RjUm8YcHl0Hc8NokG5hqgHvxptV1t8cOFCsrMTv01Ed0=
X-Google-Smtp-Source: AGHT+IGjRSvNn9pjamHg0axHO24KuBYdd0ejvKhVmAXCjHWpKLeck8mQqMrFQreoUO1LGLwUqHHLQg==
X-Received: by 2002:a05:6a21:999a:b0:262:d265:a3c with SMTP id adf61e73a8af0-262d2650de3mr5504416637.32.1757914473069;
        Sun, 14 Sep 2025 22:34:33 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cc21sm10604151a12.28.2025.09.14.22.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 22:34:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	kvm-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Fix SBI_FWFT_POINTER_MASKING_PMLEN algorithm
Date: Sun, 14 Sep 2025 22:34:20 -0700
Message-ID: <20250915053431.1910941-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_223434_299618_BF591F2C 
X-CRM114-Status: GOOD (  12.83  )
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

The implementation of SBI_FWFT_POINTER_MASKING_PMLEN from commit
aa04d131b88b ("RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN")
was based on a draft of the SBI 3.0 specification, and is not compliant
with the ratified version.

Update the algorithm to be compliant. Specifically, do not fall back to
a pointer masking mode with a larger PMLEN if the mode with the
requested PMLEN is unsupported by the hardware.

Fixes: aa04d131b88b ("RISC-V: KVM: Add support for SBI_FWFT_POINTER_MASKING_PMLEN")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---
I saw that the RFC version of this patch already made it into
riscv_kvm_queue, but it needs an update for ratified SBI 3.0. Feel free
to squash this into the original commit, or I can send a replacement v2
patch if you prefer.

 arch/riscv/kvm/vcpu_sbi_fwft.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index cacb3d4410a54..62cc9c3d57599 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -160,14 +160,23 @@ static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 	unsigned long pmm;
 
-	if (value == 0)
+	switch (value) {
+	case 0:
 		pmm = ENVCFG_PMM_PMLEN_0;
-	else if (value <= 7 && fwft->have_vs_pmlen_7)
+		break;
+	case 7:
+		if (!fwft->have_vs_pmlen_7)
+			return SBI_ERR_INVALID_PARAM;
 		pmm = ENVCFG_PMM_PMLEN_7;
-	else if (value <= 16 && fwft->have_vs_pmlen_16)
+		break;
+	case 16:
+		if (!fwft->have_vs_pmlen_16)
+			return SBI_ERR_INVALID_PARAM;
 		pmm = ENVCFG_PMM_PMLEN_16;
-	else
+		break;
+	default:
 		return SBI_ERR_INVALID_PARAM;
+	}
 
 	vcpu->arch.cfg.henvcfg &= ~ENVCFG_PMM;
 	vcpu->arch.cfg.henvcfg |= pmm;
-- 
2.47.2

base-commit: 7835b892d1d9f52fb61537757aa446fb44984215
branch: up/kvm-fwft-pmlen

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
