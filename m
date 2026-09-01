Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E0C61DD6
	for <kvm-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 03:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MwfCgeeq/m7Pxcmcx5pX/FrTTlLB+pGLn3prRNT2B8U=; b=mpXW5eDrwTw8Sf
	vc5FKh8DVLHWGFIEIqjcsSQo1BRH13xCLx+rLjr631Jtpcu9hbGVCO/1ed50+kZP3XfprnDYIdfzg
	8GjrVPetJTL/UQHcHSWUuWBqyxSrsnMWeTKiapFnYFcIAAQ6Ddjrt4WlYfn9Wfee73EKf9o2H7Fzx
	RHy7yne6RS1Q6S2bHs5HV7FwkT+llplK3ZnOSJ8cta67BPXmjWxemEBxV1nRbSCw55iTUS4a5zCTi
	BCVKKeQh8oMFa/dW+RxNs3W5cxbLJuy4EWFvKF5/HS3ZhF43f+g49j5s8gxOl5V7VLcnRz+pyOkhh
	4VIVrw3dlHRfgPTZ7MqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Fd5-0000000AxZG-1glZ;
	Tue, 01 Sep 2026 03:57:47 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Fd1-0000000AxYP-2y6P
	for kvm-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 03:57:45 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-398b3d66515so3056922a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 31 Aug 2026 20:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1788235062; x=1788839862; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u6duqbr7qiU1/7HfGsJMzno+Gd8kl8JvVp30ChVEOm4=;
        b=bTVGmgv6Oq/X/WugXsi8VI7LnX4rOmDZlHDuzqCPtxS6wUTcySwjopr7NH/OA3kSMt
         7ZqfFDEze3/tfPZhEODpgYZTxQvzn4/ch4wzQPYcVtwVctSd3LRDXmJJwhfY3JXlGQRg
         KjFhssGTMesN/IoajB5h9JjrO7lr7Fa2F7SCNYDu4RAoJdwuEOBclNUZUFhr+rRDsEGE
         rkTSPhMU/IR9zsesNuVA8wLGpDzv0sqvTGjSHoq4uIeaaL1KDd2SUEf/HOMa60B+jIXF
         dReVrCew6280JBWnvmI1mVMHy1dJ82hJHTiB6GL95a6SudZL5RT8mx8/+X8icagROYeP
         +9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788235062; x=1788839862;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u6duqbr7qiU1/7HfGsJMzno+Gd8kl8JvVp30ChVEOm4=;
        b=BMD06Y/XNRNWGX9tcD+QlnaGgh3VyR/DmX+V1Wle0NqICgvizwYOS3YnfyHumcWqr2
         AMePn4/p3SnA4FMbJXJVfLso+gRdl1DSl1jsqzyqphBI+rjIEZHmJwk6gNWZm75J+RIt
         VhBX3gHsoWnvsOu9R7jL4sK/23CN3zntmuVXuYkJ+Gii88XgDyRnu8+DyVdN27dv8IdN
         EraiMLrrHtwU80Pgv5RF0nKjBSOvKtwVp3GMm09pa+i4++aPLgDLB2HWv7NNGe8m8t6I
         0d/O2ejr+j81OshXlinC+3wxkZf4KPIFpDWOOyjQkLmqdIYgzWfbWBfv6I46PK4y4U88
         hbMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtKEjFg9NQng8gkH2HLwAvw+O8YOyI+GxVmQ4m5PriSApRC+ze9iJJdV36qbb6R/eI2zI51z77EEw=@lists.infradead.org
X-Gm-Message-State: AFuF++nb7FJg8tpl3olE9wbImVB+N9FXQSbPMgau+n9CReNuhb8VS1Lg
	eJK8e2W9q+I57wnjGcg8mN35KJBhvFdLRtNhmq5GkeVeXcE5XK/6872p9DWkEB+DrSU=
X-Gm-Gg: AYBFou1O6gY7oCSpGi6gNzN6iquE3kkw2rMul6W+Pe67F75uj2GV9mj+OjpjIUtDNdk
	p0uKcCT5NckqmX9fV/lNTHrHcK/EyeCtSTOF291/fW+I0i99TLy0yCi4/qPZvA56NUU2Gm4gFSm
	LOc8JDST4xepV+9gdPIKNGqKYl69hTGQoyanUQjiKLTo4D66Q29DwHyMBifS6JtYBHQo9T6Q5k0
	aNT09p7UlyutjMYIQPwPWw7Y7THViGzHi+hXPcG7l5MAgXgO2aZenYyM66mH0R0t3rcjT8PdhAd
	erPyM4H1Dxf0Z2Ca+YUpORksK2oZiMa+mpFM/yC/XP++lVhvygP7XGLDeF9PZQSN7vZ+NNYcCcu
	ZxB7bspfbQm2RCQxn0MyWT8wWAhxTIL8O1R4UIfn8PpTLEZRmWzZv50VhpfqeZnbyaRJg0DUHSc
	nH1oqhz71bn55GlLVzWUUuXobycUxCI7qlupOW3nDYKTqK0+mLVjM/BfS75JUNqEAbWdQD8C/+0
	eugTJEv
X-Received: by 2002:a17:90b:28cd:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-3989c003c08mr33472489a91.22.1788235062279;
        Mon, 31 Aug 2026 20:57:42 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1b38esm31120101c88.3.2026.08.31.20.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 20:57:41 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 31 Aug 2026 20:57:31 -0700
Subject: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on
 vcpu_arch_dump()
MIME-Version: 1.0
Message-Id: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
X-B4-Tracking: v=1; b=H4sIACpNlmoC/yXMSQqEMBBA0atIrTsQR8SrSCOaVLScSUURxLsbd
 fkW/5/AaAkZiuAEizsxLbNH+AtAdfXcoiDtDZGMMpnHoRj2qRoYR+OQXaW3aRWxyXWia5OqTII
 PV4uGjnda/j/z1vSo3HOC67oB1Ih2dXYAAAA=
X-Change-ID: 20260831-kvm_kselftest_dump-3f8d4daf5c60
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788235061; l=2028;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=FIdRcsMOC/DZC1O8y6KtoskjQGfb9qysPZfXHsmxOnA=;
 b=LoVteimfcmkAq7Y0uj1TCSBAJ+oQpFiT8+1EsF2q0xDVvaq1Q0lmJLNnHQzUXtKthWFDMufNp
 H3de3BgwRlvDU5dnQcAf6LZWzBwvT435/qp3cbsvBGQB5/sjYFkbpwA
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_205743_766648_F51EF34F 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
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

vcpu_arch_dump() omits trap-related CSRs, making it hard to diagnose
unexpected guest exceptions from the dump output alone.

Print sepc, scause, and stval alongside the existing register dump.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index ded5429f3448..bf355afa8486 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -235,6 +235,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
 void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 {
 	struct kvm_riscv_core core;
+	struct kvm_riscv_csr general_csr;
 
 	core.mode = vcpu_get_reg(vcpu, RISCV_CORE_REG(mode));
 	core.regs.pc = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc));
@@ -270,6 +271,10 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 	core.regs.t5 = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t5));
 	core.regs.t6 = vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t6));
 
+	general_csr.sepc = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(sepc));
+	general_csr.scause = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(scause));
+	general_csr.stval = vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(stval));
+
 	fprintf(stream,
 		" MODE:  0x%lx\n", core.mode);
 	fprintf(stream,
@@ -296,6 +301,9 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
 	fprintf(stream,
 		" T3: 0x%016lx   T4: 0x%016lx T5: 0x%016lx T6: 0x%016lx\n",
 		core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
+	fprintf(stream,
+		"SEPC: 0x%016lx SCAUSE: 0x%016lx STVAL: 0x%016lx\n",
+		general_csr.sepc, general_csr.scause, general_csr.stval);
 }
 
 static void __aligned(16) guest_unexp_trap(void)

---
base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
change-id: 20260831-kvm_kselftest_dump-3f8d4daf5c60


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
