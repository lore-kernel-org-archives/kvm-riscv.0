Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B293FC44500
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDplIUO1YXjdEAd4ZpNPlsuFXTKsm/VGQ1qX7kJS8IE=; b=dCHdXoD1mo+bhY
	ZITjv/kTbt7YMzaO/pqD9c1WWFufNtv4hLRYpBqD3m2HdnQYD/CX4C/G2IBckUDiNjedTCaxEt13M
	G2PBUCwoorK0Px5GPRa1jjTCzLxxAWB6l1uVX9FuzCyMiWsB3Vutno0dN8vVkFegcFJgiDI7z/PhB
	3zvoSMl5WAWDM+5GF4RDyFM4HekIB9VZaOySsIvW1N1BEGi75WLrTCwEgAYpdFcaQmzIjSkhQPeEN
	45hcv7hJMev4jfhRv2q0Y25VgHb0zSdLoeCz/IbwEWlsfP3YvpA7+d/s0IF0WGSMUDhn8C3r5Dh0q
	RACf844Roe+SnHjfa3AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp5-0000000BMa3-1gZa;
	Mon, 06 Jul 2026 02:12:39 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYp2-0000000BMYH-3yaU
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:12:38 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cabc0a1ab6so25403405ad.0
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783303956; x=1783908756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YsyBUeISRtTsmCW0fRgq5oh/PaolZ1FgVZ4dpWHLHI=;
        b=mCXfbKy+4i+MTFJib5C5qNalINqFJqPwrwDxwpigakL4oA8NTXmNge+a8EOw0zbvlI
         So35s3lFGjkqXG5ArXPRQnSonyMP+bFkRdunpJyDK0moftN+Q7XeY0z/dkNrgBOT/ygO
         wLnt9kSneB0CY24PqPtPPcDVZ5ruX++FyeHNWLuD/kXKrqgMItoTa/UqRD/kz5KyP+MI
         YLaolOlrZtKqRQf6/5aGpjkR2pNnf5didPTwmL9X9Wb9/0Yq3KabpaT4xTGXPSpfCsDv
         y4tnG7NY7Xub0Zlt+PyTpzvbgr8KjeROA47nxxhFee077n7YSGIQZrLR6/sjjW0exbWy
         KWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783303956; x=1783908756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YsyBUeISRtTsmCW0fRgq5oh/PaolZ1FgVZ4dpWHLHI=;
        b=Pwvr/vflwhGc+D0srwIkijpUY4PeNRL7ysjrj/vHttB3dCH3/Lsj0syk8+Un5pk661
         ifwstvt1xDqP9PwE8OzT0fkoU1oJzfM9TdPQvI6ArPD5nhIUP/EWtxR0h3v5hX1yFx1t
         HABKz5OAxZJMekj9lXNJkLhp01k6SLVrAl5VgrHAUEqlblHt25nxSdNUPxx3GJv6hETq
         RQ6FpxI/qSZYeozlkxFtu4J3krREUKMnrAg1TPyI2SLZo1aHRr5G19tQU773thpDz9kL
         0+8d+zhYQq7SiABbuKO2cqBAz+cYJDluCtmOE2HjPqmwlyuN9LDv6w0XlPFN+YR3yynP
         IlKw==
X-Forwarded-Encrypted: i=1; AHgh+RpgjmlJ6smoRN5/exGFXJw4Ez4ZSWw6pMdyVJe8NasEsJexCd9pUNvxeM0/uKv7bqH1BlIeNPH67bU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuhSYDWh7+B5O4XHTRtJbR+3T02btt4v2w9/DSpW8iNFin/Ri8
	gE5G154EnmH//pC4FIMOW8KwksKWBlib0BC7M+l9XLfXdBLFnTzJrESV
X-Gm-Gg: AfdE7cmzGF2ML/BUCAH8i0CHftCobB6eOAyXeaMuvqhx6Ic6jha4YaD6/D3F8IMiPfh
	F9o310s5Rr3Bbk8OBPLJ9wd2xScZbUeKu2U80CKEXDqPJVoemdcOGVrsBnZYS1eGqxiMHt+alAC
	RX60MVKVwKJGrHOb0uBagavjtu9y6IdJ/3D/PijOx1BfhwNAaV3B9HIEAB3F02jZc5WI6BRbJ+C
	EZfi19XHwxWSO+WI9fmfl5qCK2rDw6AwlIXHvgq44iFU4EWPkKaiLHWtEFWxvWdbcvsYr9aa2Fn
	a5It+T6LgaIiHKKS53LNe2WamzM6zXQD9J/UfrOVVW6lYvV8yZ6zzCliMA8ObCj3TUlBzQyv3be
	dVeTKsphTpSUhOLGGxCsKjp+G+M8MoJiisdL9AX89tPRamwPiQPnJxXGysieOvD7z
X-Received: by 2002:a17:903:3bcb:b0:2ca:e08e:9e70 with SMTP id d9443c01a7336-2cbb9f479a9mr84564265ad.46.1783303956077;
        Sun, 05 Jul 2026 19:12:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71270e5sm40338495ad.23.2026.07.05.19.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:12:35 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 1/3] RISC-V: KVM: Add SBI extension validate callback
Date: Mon,  6 Jul 2026 10:11:50 +0800
Message-ID: <20260706021154.210289-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706021154.210289-1-inochiama@gmail.com>
References: <20260706021154.210289-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_191236_988827_F288D2A8 
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

When user disable FWFT extension after setting any value of the
FWFT feature, the state of vCPU will be broken since the value
of disable FWFT feature is still functional.

Add the generic SBI extension validate callback so the FWFT
extension can fix its parameters before the first run.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++++
 arch/riscv/kvm/vcpu_config.c          |  2 ++
 arch/riscv/kvm/vcpu_sbi.c             | 23 +++++++++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index c1a7e3b40d9c..f01a2860c751 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -60,6 +60,9 @@ struct kvm_vcpu_sbi_extension {
 
 	void (*reset)(struct kvm_vcpu *vcpu);
 
+	/* Allow the extension to correct its parameters before the first run */
+	void (*validate)(struct kvm_vcpu *vcpu);
+
 	unsigned long state_reg_subtype;
 	unsigned long (*get_state_reg_count)(struct kvm_vcpu *vcpu);
 	int (*get_state_reg_id)(struct kvm_vcpu *vcpu, int index, u64 *reg_id);
@@ -93,6 +96,7 @@ int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
 void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_RISCV_SBI_V01
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
diff --git a/arch/riscv/kvm/vcpu_config.c b/arch/riscv/kvm/vcpu_config.c
index 238418fed2b9..b68aa830aaf5 100644
--- a/arch/riscv/kvm/vcpu_config.c
+++ b/arch/riscv/kvm/vcpu_config.c
@@ -69,6 +69,8 @@ void kvm_riscv_vcpu_config_ran_once(struct kvm_vcpu *vcpu)
 
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);
+
+	kvm_riscv_vcpu_sbi_validate(vcpu);
 }
 
 void kvm_riscv_vcpu_config_load(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 46ab7b989432..b737e9a7a12a 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -723,3 +723,26 @@ void kvm_riscv_vcpu_sbi_reset(struct kvm_vcpu *vcpu)
 		ext->reset(vcpu);
 	}
 }
+
+void kvm_riscv_vcpu_sbi_validate(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
+	const struct kvm_riscv_sbi_extension_entry *entry;
+	const struct kvm_vcpu_sbi_extension *ext;
+	int idx, i;
+
+	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
+		entry = &sbi_ext[i];
+		ext = entry->ext_ptr;
+		idx = entry->ext_idx;
+
+		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
+			continue;
+
+		if (scontext->ext_status[idx] != KVM_RISCV_SBI_EXT_STATUS_ENABLED ||
+		    !ext->validate)
+			continue;
+
+		ext->validate(vcpu);
+	}
+}
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
