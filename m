Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910ADC021A4
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KX8cJMHKpqXRnhBlJ7STajDjv8K0hwUqasxOrznE5M8=; b=g/5lOHWmucaTkj
	zBmgFjQMPnZDoeFEv6j56mBh27Vce+LtTeLYkRClEGjBl3UlRJL7V3cEPp6ruwKK588/sBAzw/ohN
	Kz8HzWckmPWsG6kMZcgIdFQJ92FBoNknbPNyav94FNeVes9a/DesfUbj9iQOiZCxi9Z0o0ARlQH/G
	ppVTzShWyy6hu2lO5udkPEr1XUTQrMP8itm9u6hy+aeRjX9HbDsERJ/Kvi50HDwCJt28CGUcy/LAn
	ADPfo2w7jJtwKO5DFWtGdnDg91/9NUR+xSGTOkg9/zioi/PRQlmpIoXh1mmgg1j58CwHXWX+qX4If
	sibUcmchAqg5zngfXsiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkg-00000003nTG-1KXa;
	Mon, 17 Feb 2025 08:45:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjwkb-00000003nN9-30ar
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 08:45:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-38f2f391864so1499800f8f.3
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Feb 2025 00:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739781912; x=1740386712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZ3VO18adCEYhhZu71Kqt+W1Lctj7LPPm0C4PWap/Pc=;
        b=gMZHyV/YS0B6NxiDkbQ1VvCBv/FXJXv+EwimTq9yK0kfL9aRHnypsMdzi/rqzPPt/8
         1qhOo018eCoo8QIpDDwr1+H9Zw8CwCFJa7cWxqS0rdgDyvITVhMQWuVeO3Z3IfeUAL6Y
         V+6mljG7NuIFXIRyuBGvxoTOPkwnpyaaioAzNLgY4ot1aDeY01yPt1/abahnPgfF7x5e
         zwBC6PHlFUpWGvx9BkAGCRiSxnTkmGhkTRv7Y/2evk1A6HwWlPeuxWaRwXndmqBTUPEF
         bVlibblp8iDcIiWrW62iFJKS5rurpsQrJBw9wZKpa0MEgYGERR0aafMM/583LVgtFupR
         RnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739781912; x=1740386712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZ3VO18adCEYhhZu71Kqt+W1Lctj7LPPm0C4PWap/Pc=;
        b=ZkLDTQ9hdzt60jx7/lxNqs6/14UjrcsXIZtfVUuyHc/AoKFmqRXb72JckPCrlW4N/o
         d/nu7Pc9f7vx7NoQbubzfCyC/TMJ6bV59fHGIj9yWaW6aFEEkLQoP/UY8i1wdTpXGbju
         he4XMXi/oGCFtqumRbJfzwPT8HL3EHc4BxJ+qCzPUPTMWDAWRabLE4JaPYM7AqkY+12e
         weSm0+aDuxg6xJZnDzonBsFLpe6cHsY61fzfo/gO1ICg/oGUCRcA6/B5WOrkYAKdmMy+
         pvmlNV3+9rLuq2y0oUaRPMQu7/g5Jnr233LSIoBOS6PK0D4WPPQm3T3aA5Ge8qRFyxkS
         yMGA==
X-Forwarded-Encrypted: i=1; AJvYcCVEmcfL3PX4lOpM2+mqHuO8vbq7nBc5OlDvlqAoXu6rPUQj8DNRhCDrA60gxoyUOV+eKv5NESiCiu4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1gGv78ueyVwKbDsGlP3NPQAICb9+5lLLs71l1YvedGPz/A3fh
	T+oxVX+4hcMVErTBnypAFmEU3OBg1o9eYZJXt7pMtUmuzkrunkEpbQV1iW8WLJs=
X-Gm-Gg: ASbGnctQiOt2m2QGZ7rroqgEu6urofGaN6fg83+2YHResEBbO96WviDJ0ONu+FEqa1P
	8eH1KA13OBW89Fpjo0QQAepoCifDIhE76TdeX+nWAKKK96ud77st1gG3GMXMIbPyMxqp5Wy2V3I
	PYgAlGEho+umlCS+v7UImEbAM0Vm6px7d40xHT1NaqFpeDj+hP7oluZAaKmQ1AhIdQ/hIo0Cn/A
	cvBMbe9bNwF1lVRgMqnfMb7lVp5bbdAmzdTPfxeP+l5xyza0/Ls+whovdRxAKTEnLQVrxNSgrCR
	mnk=
X-Google-Smtp-Source: AGHT+IFjCjQDRbtQRRPY7ND3UbrR6FOcJiCBfSPf1KsHHS/VGqmXJkoBgEpraPdPyIlzSWNaqsOAIg==
X-Received: by 2002:a05:6000:1548:b0:38f:4251:597b with SMTP id ffacd0b85a97d-38f42515b99mr2778376f8f.8.1739781911976;
        Mon, 17 Feb 2025 00:45:11 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259fe1efsm11711548f8f.97.2025.02.17.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 00:45:11 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com
Subject: [PATCH 3/5] riscv: KVM: Fix SBI IPI error generation
Date: Mon, 17 Feb 2025 09:45:10 +0100
Message-ID: <20250217084506.18763-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217084506.18763-7-ajones@ventanamicro.com>
References: <20250217084506.18763-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_004513_748073_D3B8A01E 
X-CRM114-Status: GOOD (  14.21  )
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

When an invalid function ID of an SBI extension is used we should
return not-supported, not invalid-param. Also, when we see that at
least one hartid constructed from the base and mask parameters is
invalid, then we should return invalid-param. Finally, rather than
relying on overflowing a left shift to result in zero and then using
that zero in a condition which [correctly] skips sending an IPI (but
loops unnecessarily), explicitly check for overflow and exit the loop
immediately.

Fixes: 5f862df5585c ("RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_replace.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 9c2ab3dfa93a..74e3a38c6a29 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -51,9 +51,10 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	unsigned long hmask = cp->a0;
 	unsigned long hbase = cp->a1;
+	unsigned long hart_bit = 0, sentmask = 0;
 
 	if (cp->a6 != SBI_EXT_IPI_SEND_IPI) {
-		retdata->err_val = SBI_ERR_INVALID_PARAM;
+		retdata->err_val = SBI_ERR_NOT_SUPPORTED;
 		return 0;
 	}
 
@@ -62,15 +63,23 @@ static int kvm_sbi_ext_ipi_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		if (hbase != -1UL) {
 			if (tmp->vcpu_id < hbase)
 				continue;
-			if (!(hmask & (1UL << (tmp->vcpu_id - hbase))))
+			hart_bit = tmp->vcpu_id - hbase;
+			if (hart_bit >= __riscv_xlen)
+				goto done;
+			if (!(hmask & (1UL << hart_bit)))
 				continue;
 		}
 		ret = kvm_riscv_vcpu_set_interrupt(tmp, IRQ_VS_SOFT);
 		if (ret < 0)
 			break;
+		sentmask |= 1UL << hart_bit;
 		kvm_riscv_vcpu_pmu_incr_fw(tmp, SBI_PMU_FW_IPI_RCVD);
 	}
 
+done:
+	if (hbase != -1UL && (hmask ^ sentmask))
+		retdata->err_val = SBI_ERR_INVALID_PARAM;
+
 	return ret;
 }
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
